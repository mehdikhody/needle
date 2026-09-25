package tmpl

import (
	"bytes"
	_ "embed"
	"fmt"
	"text/template"
)

//go:embed stub.lua.tmpl
var stubTmpl string

// StubVars holds the randomized local-variable names used by one emitted stub.
type StubVars struct {
	Data   string
	State  string
	I      string
	Ks     string
	Byte   string
	Buf    string
	Bn     string
	Parts  string
	Hash   string
	Src    string
	Chunk  string
	Fields string
	Key    string
	Get    string
}

// StubData is everything needed to render a self-decrypting Lua stub.
type StubData struct {
	Cipher string   // ciphertext as a run of \ddd decimal escapes
	SeedA  int64    // seed split so the stub reads SeedA+SeedB, not the raw seed
	SeedB  int64    //
	Hash   int64    // expected tamper hash of the decrypted source
	NI     []string // top-level `ni` fields the source reads, e.g. "spell"
	V      StubVars // randomized identifiers
}

// RenderStub renders the decryptor stub for one protected profile.
func RenderStub(data *StubData) (string, error) {
	t, err := template.New("stub").Parse(stubTmpl)
	if err != nil {
		return "", fmt.Errorf("error parsing stub template: %v", err)
	}

	var buf bytes.Buffer
	if err := t.Execute(&buf, data); err != nil {
		return "", fmt.Errorf("error rendering stub template: %v", err)
	}

	return buf.String(), nil
}
