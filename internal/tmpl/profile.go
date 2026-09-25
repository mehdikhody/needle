package tmpl

import (
	"bytes"
	_ "embed"
	"fmt"
	"text/template"

	"needle/internal/config"
	"needle/internal/tree"
	"needle/internal/utils"
)

//go:embed profile.lua.tmpl
var profileTmpl string

type ProfileData struct {
	ID        string
	Profile   *tree.Profile
	Config    *config.Config
	Allow     []string
	Abilities []*ProfileAbilityData
}

type ProfileAbilityData struct {
	ID  string
	Lua string
}

func RenderProfile(data *ProfileData) (string, error) {
	funcMap := template.FuncMap{
		"indent": utils.Indent,
	}

	tmpl, err := template.New("lua").Funcs(funcMap).Parse(profileTmpl)
	if err != nil {
		err = fmt.Errorf("error parsing profile template: %v", err)
		return "", err
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, data); err != nil {
		err = fmt.Errorf("error rendering profile template: %v", err)
		return "", err
	}

	return utils.Normalize(buf.String()), nil
}
