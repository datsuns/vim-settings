package main

import (
	"bytes"
	"flag"
	"fmt"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strings"
)

func main() {
	buildPaths := flag.String("build", ".", "Comma-separated paths to build environments or clone roots")
	outputDir := flag.String("out", ".", "Directory to write the .clangd file")
	flag.Parse()

	if *buildPaths == "" {
		fmt.Println("Usage: go run gen_clangd.go -build <path1,path2,...> [-out <source_dir>]")
		os.Exit(1)
	}

	roots := strings.Split(*buildPaths, ",")
	var allIncludePaths []string

	for _, root := range roots {
		cleanRoot := strings.TrimSpace(root)
		if cleanRoot == "" {
			continue
		}
		absRoot, err := filepath.Abs(cleanRoot)
		if err != nil {
			fmt.Printf("Warning: Could not resolve path %s: %v\n", cleanRoot, err)
			continue
		}
		fmt.Printf("Scanning %s...\n", absRoot)
		allIncludePaths = append(allIncludePaths, findIncludePaths(absRoot)...)
	}

	// Remove duplicates
	uniquePaths := make([]string, 0)
	seen := make(map[string]bool)
	for _, p := range allIncludePaths {
		if !seen[p] {
			uniquePaths = append(uniquePaths, p)
			seen[p] = true
		}
	}

	compilerDefines := getDefaultDefines()
	compilerPaths := getDefaultIncludePaths()

	var sb strings.Builder
	sb.WriteString("CompileFlags:\n")
	sb.WriteString("  Add: [\n")
	sb.WriteString("    \"-xc++\",\n")
	sb.WriteString("    \"-std=c++20\",\n")

	for _, def := range compilerDefines {
		sb.WriteString(fmt.Sprintf("    \"-D%s\",\n", def))
	}

	for _, path := range compilerPaths {
		sb.WriteString(fmt.Sprintf("    \"-I%s\",\n", path))
	}

	for _, path := range uniquePaths {
		// clangd expects forward slashes
		normalizedPath := filepath.ToSlash(path)
		sb.WriteString(fmt.Sprintf("    \"-I%s\",\n", normalizedPath))
	}

	sb.WriteString("  ]\n")

	outputPath := filepath.Join(*outputDir, ".clangd")
	err := os.WriteFile(outputPath, []byte(sb.String()), 0644)
	if err != nil {
		fmt.Printf("Error writing .clangd: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("\nSuccessfully generated %s\n", outputPath)
	fmt.Printf("Added %d unique include paths.\n", len(uniquePaths))
}

func findIncludePaths(root string) []string {
	var paths []string

	err := filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return nil
		}
		if d.IsDir() {
			name := strings.ToLower(d.Name())

			// 不要なディレクトリをスキップして高速化
			if name == ".git" || name == "build" || name == "install" || name == "log" {
				return filepath.SkipDir
			}

			// 'include' フォルダを見つけたら追加
			if name == "include" {
				paths = append(paths, path)
				return nil
			}
		}
		return nil
	})

	if err != nil {
		fmt.Printf("Warning: Error walking %s: %v\n", root, err)
	}

	return paths
}

func getCompilerOutput(tool string, params []string) (string, error) {
	cmd := exec.Command(tool, params...)
	cmd.Stdin = bytes.NewBufferString("")
	log, _ := cmd.CombinedOutput()
	return string(log), nil
}

func getDefaultIncludePaths() []string {
	_, err := exec.LookPath("g++")
	if err != nil {
		return []string{}
	}
	log, _ := getCompilerOutput("g++", []string{"-xc++", "-E", "-v", "-"})
	body := false
	lineFeeds := regexp.MustCompile(`[\r\n]`)
	paths := []string{}
	for _, line := range strings.Split(log, "\n") {
		line = lineFeeds.ReplaceAllString(line, "")
		if strings.Compare(line, "End of search list.") == 0 {
			break
		}

		if strings.Compare(line, "#include <...> search starts here:") == 0 {
			body = true
			continue
		}

		if body {
			path := strings.TrimSpace(filepath.ToSlash(line))
			paths = append(paths, path)
		}
	}
	return paths
}

func getDefaultDefines() []string {
	_, err := exec.LookPath("g++")
	if err != nil {
		return []string{}
	}
	log, _ := getCompilerOutput("g++", []string{"-dM", "-E", "-"})
	lineFeeds := regexp.MustCompile(`[\r\n]`)
	defines := []string{}
	for _, line := range strings.Split(log, "\n") {
		line = lineFeeds.ReplaceAllString(line, "")
		params := strings.Split(line, " ")
		if len(params) != 3 {
			continue
		}

		defines = append(defines, fmt.Sprintf("%v=%v", params[1], params[2]))
	}
	return defines
}
