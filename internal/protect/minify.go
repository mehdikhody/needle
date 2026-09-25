package protect

import (
	"strconv"
	"strings"
)

// Minify strips Lua comments and per-line indentation while preserving every
// token and every string / long-bracket literal byte-for-byte. It never merges
// adjacent tokens: string literals are lifted out as opaque atoms before any
// whitespace is touched, block comments are replaced with a single space, line
// comments are dropped to end-of-line, and blank / comment-only lines are
// removed. Newlines remain between statements, so the result is always
// semantically identical Lua — just de-formatted and comment-free.
func Minify(src string) string {
	var code strings.Builder
	var lits []string

	i, n := 0, len(src)
	for i < n {
		c := src[i]
		switch {
		case c == '-' && i+1 < n && src[i+1] == '-':
			// Comment: either a --[[ long ]] block or a -- line comment.
			if lvl, ok := longBracketLevel(src, i+2); ok {
				end := skipLongBracket(src, i+2, lvl)
				code.WriteByte(' ') // keep a separator where the block was
				i = end
			} else {
				k := i + 2
				for k < n && src[k] != '\n' {
					k++
				}
				i = k // stop before the newline so it survives as a separator
			}
		case c == '"' || c == '\'':
			end := skipShortString(src, i)
			code.WriteString(placeholder(&lits, src[i:end]))
			i = end
		case c == '[':
			if lvl, ok := longBracketLevel(src, i); ok {
				end := skipLongBracket(src, i, lvl)
				code.WriteString(placeholder(&lits, src[i:end]))
				i = end
			} else {
				code.WriteByte(c)
				i++
			}
		default:
			code.WriteByte(c)
			i++
		}
	}

	return restore(trimLines(code.String()), lits)
}

// longBracketLevel reports whether src[pos:] opens a Lua long bracket
// ("[[", "[=[", "[==[", ...) and, if so, its level (the number of '=').
func longBracketLevel(src string, pos int) (int, bool) {
	if pos >= len(src) || src[pos] != '[' {
		return 0, false
	}
	j := pos + 1
	lvl := 0
	for j < len(src) && src[j] == '=' {
		lvl++
		j++
	}
	if j < len(src) && src[j] == '[' {
		return lvl, true
	}
	return 0, false
}

// skipLongBracket returns the index just past the closing long bracket that
// matches the opener at src[pos] with the given level. An unterminated bracket
// consumes the rest of the input (the loader would reject it anyway).
func skipLongBracket(src string, pos, lvl int) int {
	j := pos + lvl + 2 // past the opening "[" + '='*lvl + "["
	closer := "]" + strings.Repeat("=", lvl) + "]"
	if idx := strings.Index(src[j:], closer); idx >= 0 {
		return j + idx + len(closer)
	}
	return len(src)
}

// skipShortString returns the index just past the closing quote of the short
// string starting at src[pos], honoring backslash escapes.
func skipShortString(src string, pos int) int {
	q := src[pos]
	j := pos + 1
	for j < len(src) {
		switch src[j] {
		case '\\':
			j += 2
			continue
		case q:
			return j + 1
		case '\n':
			return j // unterminated; the loader would error, so stop here
		}
		j++
	}
	return len(src)
}

// placeholder stashes a literal and returns a NUL-delimited marker that trimming
// leaves untouched and that cannot collide with Lua source.
func placeholder(lits *[]string, s string) string {
	idx := len(*lits)
	*lits = append(*lits, s)
	return "\x00" + strconv.Itoa(idx) + "\x00"
}

// restore swaps each placeholder back for its original literal text.
func restore(s string, lits []string) string {
	for idx, lit := range lits {
		s = strings.Replace(s, "\x00"+strconv.Itoa(idx)+"\x00", lit, 1)
	}
	return s
}

// trimLines drops blank lines and trims horizontal whitespace from the edges of
// each remaining line. String literals have already been lifted out, so this
// can never touch literal content.
func trimLines(s string) string {
	lines := strings.Split(s, "\n")
	out := lines[:0]
	for _, ln := range lines {
		if t := strings.TrimSpace(ln); t != "" {
			out = append(out, t)
		}
	}
	return strings.Join(out, "\n")
}
