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

//go:embed ability.lua.tmpl
var abilityTmpl string

type AbilityData struct {
	Ability *tree.Ability
	Config  *config.Config
}

func RenderAbility(data *AbilityData) (string, error) {
	funcMap := template.FuncMap{
		"indent": utils.Indent,
	}

	tmpl, err := template.New("lua").Funcs(funcMap).Parse(abilityTmpl)
	if err != nil {
		err = fmt.Errorf("error parsing ability template: %v", err)
		return "", err
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, data); err != nil {
		err = fmt.Errorf("error rendering ability template: %v", err)
		return "", err
	}

	return utils.Normalize(buf.String()), nil
}
