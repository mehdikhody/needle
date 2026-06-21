package utils

import "strings"

func Indent(s string, spaces int) string {
	pad := strings.Repeat(" ", spaces)
	lines := strings.Split(s, "\n")

	for i := range lines {
		lines[i] = pad + lines[i]
	}

	str := strings.Join(lines, "\n")
	return strings.TrimSpace(str)
}
