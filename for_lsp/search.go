package main

import (
	"bytes"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"slices"
	"strings"
)

const destFilename = "_compile_flags.txt"

var staticOptions = []string{
	"-std=c++20",
}
var forceDirectories = []string{
	"include",
}
var headerFileKey = regexp.MustCompile("\\.(h|hxx|hpp)$")

func executeWithDummyInput(tool string, params []string) (string, error) {
	//fmt.Printf(" >> %v %v\n", tool, params)
	cmd := exec.Command(tool, params...)
	cmd.Stdin = bytes.NewBufferString("")
	log, _ := cmd.CombinedOutput()
	return string(log), nil
}

func collectCompilerSeachPaths(dummyFile string) []string {
	_, err := exec.LookPath("gcc")
	if err != nil {
		return []string{}
	}
	log, _ := executeWithDummyInput("gcc", []string{"-xc++", "-E", "-v", "-"})
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
			paths = append(paths, strings.TrimSpace(filepath.ToSlash(line)))
		}
	}
	return paths
}

func collectHeaderFileDirs(root string) []string {
	all := []string{}
	filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		abs, err := filepath.Abs(path)
		if err != nil {
			return nil
		}
		if d.IsDir() {
			for _, d := range forceDirectories {
				if strings.Compare(filepath.Base(abs), d) == 0 {
					all = append(all, filepath.ToSlash(abs))
					break
				}
			}
			return nil
		}
		ext := filepath.Ext(path)
		if !headerFileKey.MatchString(ext) {
			return nil
		}
		all = append(all, filepath.ToSlash(filepath.Dir(abs)))
		return nil
	})
	slices.Sort(all)
	return slices.Compact(all)
}

func main() {
	root := os.Args[1]
	compilerPaths := collectCompilerSeachPaths(os.Args[0])
	headerPaths := collectHeaderFileDirs(root)
	dest, err := os.Create(destFilename)
	if err != nil {
		panic(err)
	}
	defer dest.Close()
	for _, opt := range staticOptions {
		dest.WriteString(opt + "\n")
	}
	for _, path := range compilerPaths {
		dest.WriteString("-I" + path + "\n")
	}
	for _, path := range headerPaths {
		dest.WriteString("-I" + path + "\n")
	}
}
