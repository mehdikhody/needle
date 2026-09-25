package tmpl

import (
	"bytes"
	_ "embed"
	"fmt"
	"text/template"

	"needle/internal/utils"
)

//go:embed remote.lua.tmpl
var remoteTmpl string

// RemoteMacros is the developer's in-game macros for controlling remote.
//
//go:embed remote-macros.txt
var RemoteMacros string

// RemoteData is everything needed to render the remote-control block of the
// Data module.
type RemoteData struct {
	Version string // Data module ID, reported by MK_CHECKOUT
	File    string // NI settings file that persists the disabled flag
}

func RenderRemote(data *RemoteData) (string, error) {
	tmpl, err := template.New("remote").Parse(remoteTmpl)
	if err != nil {
		err = fmt.Errorf("error parsing remote template: %v", err)
		return "", err
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, data); err != nil {
		err = fmt.Errorf("error rendering remote template: %v", err)
		return "", err
	}

	return utils.Normalize(buf.String()), nil
}
