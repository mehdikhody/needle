package utils

import (
	"regexp"
	"strings"
)

func Normalize(s string) string {
	mnl := regexp.MustCompile(`\n{3,}`)
	s = mnl.ReplaceAllString(s, "\n\n")
	s = strings.TrimSpace(s)
	return s
}
