// Package protect turns a bundled profile's plaintext Lua into a self-decrypting
// Lua stub. The stub carries the rotation as an encrypted, comment-stripped blob
// that it decrypts in pure Lua at load time (no bit library, no bytecode) and
// runs via loadstring, refusing to run if the blob has been tampered with.
//
// This is obscurity-grade protection: the key and algorithm ship inside the
// stub, which runs in a Lua state the user controls, so a determined reverser
// can still recover the source. It stops casual reading, editing, and copying —
// nothing more.
package protect

import (
	"fmt"
	"math/rand"
	"regexp"
	"sort"
	"strings"
	"time"

	"needle/internal/tmpl"
)

var seedRand = rand.New(rand.NewSource(time.Now().UnixNano()))

// prelude is prepended (on the same line, so line numbers are unchanged) to the
// decrypted source. The NI loader only resolves `ni.<field>` written directly
// in a profile file: a bare `ni` there is nil, and a chunk from loadstring
// can't see `ni` at all. So the stub reads each field the source uses as
// `ni.<field>`, like a plaintext profile, and passes a proxy in as `ni`.
const prelude = "local ni=...;"

// niField matches a top-level `ni.<field>` access (not `x.ni.<field>`).
var niField = regexp.MustCompile(`(?:^|[^\w.])ni\.([A-Za-z_][A-Za-z0-9_]*)`)

// niFields returns the sorted, unique top-level `ni` fields src reads.
func niFields(src string) []string {
	seen := map[string]bool{}
	for _, m := range niField.FindAllStringSubmatch(src, -1) {
		seen[m[1]] = true
	}
	fields := make([]string, 0, len(seen))
	for f := range seen {
		fields = append(fields, f)
	}
	sort.Strings(fields)
	return fields
}

// Protect minifies, encrypts, and wraps lua in a fresh self-decrypting stub,
// using a new random seed so every build differs.
func Protect(lua string) (string, error) {
	return ProtectWithSeed(lua, randSeed())
}

// ProtectWithSeed is Protect with an explicit seed, for deterministic tests.
func ProtectWithSeed(lua string, seed int64) (string, error) {
	min := prelude + Minify(lua)
	cipher, hash := encrypt([]byte(min), seed)

	seedB := seed / 2
	data := &tmpl.StubData{
		Cipher: escapeBytes(cipher),
		SeedA:  seed - seedB,
		SeedB:  seedB,
		Hash:   hash,
		NI:     niFields(min),
		V:      stubVars(seed),
	}
	return tmpl.RenderStub(data)
}

// randSeed returns a seed in [1, lcgMod-1], the valid range for the MINSTD LCG.
func randSeed() int64 {
	return seedRand.Int63n(lcgMod-1) + 1
}

// escapeBytes renders bytes as a run of three-digit decimal Lua escapes
// ("\012\255..."), which Lua's own parser turns back into the raw bytes.
func escapeBytes(b []byte) string {
	var sb strings.Builder
	sb.Grow(len(b) * 4)
	for _, x := range b {
		fmt.Fprintf(&sb, "\\%03d", x)
	}
	return sb.String()
}

// stubVars generates a distinct set of valid, non-keyword Lua identifiers,
// seeded deterministically so a given seed always yields the same stub.
func stubVars(seed int64) tmpl.StubVars {
	r := rand.New(rand.NewSource(seed))
	used := map[string]bool{}

	const letters = "abcdefghijklmnopqrstuvwxyz"
	const alnum = letters + "0123456789"
	gen := func() string {
		for {
			n := 5 + r.Intn(3) // length 5-7 is well clear of any Lua keyword
			b := make([]byte, n)
			b[0] = letters[r.Intn(len(letters))]
			for i := 1; i < n; i++ {
				b[i] = alnum[r.Intn(len(alnum))]
			}
			s := string(b)
			if !used[s] {
				used[s] = true
				return s
			}
		}
	}

	return tmpl.StubVars{
		Data:   gen(),
		State:  gen(),
		I:      gen(),
		Ks:     gen(),
		Byte:   gen(),
		Buf:    gen(),
		Bn:     gen(),
		Parts:  gen(),
		Hash:   gen(),
		Src:    gen(),
		Chunk:  gen(),
		Fields: gen(),
		Key:    gen(),
		Get:    gen(),
	}
}
