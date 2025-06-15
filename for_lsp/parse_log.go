package main

import (
	"bufio"
	"bytes"
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"os"
	"regexp"
)

type Option struct {
	Path string
}

var LogTimeStampKey = regexp.MustCompile(`^\d{4}/\d{2}/\d{2} \d{2}:\d{2}:\d{2}:`)

func parse_option() *Option {
	ret := &Option{}
	flag.Parse()
	ret.Path = flag.Arg(0)
	return ret
}

func split_log_line(log string) (string, string, error) {
	parsed := LogTimeStampKey.FindAllStringIndex(log, -1)
	if len(parsed) == 0 {
		return "", "", errors.New("Parse Error")
	}
	timestamp := log[:parsed[0][1]]
	json := log[parsed[0][1]:]

	return timestamp, json, nil
}

func parse_log_line(log string) (string, error) {
	timestamp, jsonRaw, err := split_log_line(log)
	if err != nil {
		return "", err
	}
	var buf bytes.Buffer
	err = json.Indent(&buf, []byte(jsonRaw), "", "  ")
	if err != nil {
		return "", err
	}
	return timestamp + " " + buf.String(), nil
}

func main() {
	opt := parse_option()
	file, err := os.Open(opt.Path)
	if err != nil {
		panic(err)
	}
	defer file.Close()
	dest, err := os.Create(opt.Path + ".txt")
	if err != nil {
		panic(err)
	}
	defer dest.Close()

	scanner := bufio.NewScanner(file)
	n := 0
	for scanner.Scan() {
		n++
		parsed, err := parse_log_line(scanner.Text())
		if err != nil {
			fmt.Println(n, " th line Parse Error")
			continue
		}
		dest.WriteString(parsed + "\n")
	}
}
