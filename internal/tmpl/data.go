package tmpl

import (
	"bytes"
	_ "embed"
	"fmt"
	"text/template"

	"needle/internal/tree"
	"needle/internal/utils"
)

//go:embed data.lua.tmpl
var dataTmpl string

type DataData struct {
	Allow  []string
	Files  []*tree.Ability
	Remote string // rendered remote-control block, or "" when disabled
}

func RenderData(data *DataData) (string, error) {
	funcMap := template.FuncMap{
		"indent": utils.Indent,
	}

	tmpl, err := template.New("data").Funcs(funcMap).Parse(dataTmpl)
	if err != nil {
		err = fmt.Errorf("error parsing data template: %v", err)
		return "", err
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, data); err != nil {
		err = fmt.Errorf("error rendering data template: %v", err)
		return "", err
	}

	return utils.Normalize(buf.String()), nil
}
