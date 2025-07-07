package main

import (
	"bytes"
	"fmt"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"slices"
	"strings"
)

const destFilename = "_compile_flags.txt"
const duplicatedHeaders = "_duplicated_headers.txt"

var staticOptions = []string{
	"--target=x86_64-w64-mingw32",
	"-std=c++20",
	"-xc++",
	"-U_GLIBCXX_USE_FLOAT128", // よくわからんけどundefが必要そう
}
var forceDirectories = []string{
	"include",
}
var ros2Specials = []*regexp.Regexp{
	regexp.MustCompile("include[\\\\/].*[\\\\/]msg$"),
}
var headerFileKey = regexp.MustCompile("\\.(h|hxx|hpp)$")

func executeWithDummyInput(tool string, params []string) (string, error) {
	//fmt.Printf(" >> %v %v\n", tool, params)
	cmd := exec.Command(tool, params...)
	cmd.Stdin = bytes.NewBufferString("")
	log, _ := cmd.CombinedOutput()
	return string(log), nil
}

func collectCompilerSearchPaths() []string {
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

func collectCompilerDefaultDefines() []string {
	_, err := exec.LookPath("g++")
	if err != nil {
		return []string{}
	}
	log, _ := executeWithDummyInput("g++", []string{"-dM", "-E", "-"})
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

func fitDirectoryEntry(path string) (bool, string) {
	for _, d := range forceDirectories {
		if strings.Compare(filepath.Base(path), d) == 0 {
			return true, filepath.ToSlash(path)
		}
	}
	for _, key := range ros2Specials {
		if key.MatchString(path) {
			relative := filepath.Join(path, "..", "..")
			target := filepath.Clean(relative)
			return true, filepath.ToSlash(target)
		}
	}
	return false, ""
}

type AllHeaders map[string][]string

func collectHeaderFileDirs(root string) ([]string, AllHeaders) {
	all := []string{}
	headers := AllHeaders{}
	filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		abs, err := filepath.Abs(path)
		if err != nil {
			return nil
		}
		if d.IsDir() {
			found, dir := fitDirectoryEntry(abs)
			if found {
				all = append(all, dir)
			}
			return nil
		} else {
			ext := filepath.Ext(abs)
			if !headerFileKey.MatchString(ext) {
				return nil
			}
			fname := filepath.Base(abs)
			headers[fname] = append(headers[fname], abs)
			all = append(all, filepath.ToSlash(filepath.Dir(abs)))
		}
		return nil
	})
	slices.Sort(all)
	return slices.Compact(all), headers
}

func main() {
	root := os.Args[1]
	compilerPaths := collectCompilerSearchPaths()
	compilerDefines := collectCompilerDefaultDefines()
	headerPaths, allHaders := collectHeaderFileDirs(root)
	dest, err := os.Create(destFilename)
	if err != nil {
		panic(err)
	}
	defer dest.Close()
	duplicated, err := os.Create(duplicatedHeaders)
	if err != nil {
		panic(err)
	}
	defer duplicated.Close()

	for _, opt := range staticOptions {
		dest.WriteString(opt + "\n")
	}
	for _, opt := range compilerDefines {
		dest.WriteString("-D" + opt + "\n")
	}
	for _, path := range compilerPaths {
		dest.WriteString("-I" + path + "\n")
	}
	for _, path := range headerPaths {
		dest.WriteString("-I" + path + "\n")
	}
	for name, list := range allHaders {
		if len(list) > 1 {
			duplicated.WriteString(fmt.Sprintf("duplicated header [%v]\n", name))
			for _, header := range list {
				duplicated.WriteString(fmt.Sprintf("  - %v\n", header))
			}
		}
	}
}
