package bundler

import (
	"needle/internal/tmpl"
	"needle/internal/tree"
)

func (b *Bundler) BundleAbility(a *tree.Ability) (string, error) {
	lua, err := tmpl.RenderAbility(&tmpl.AbilityData{
		Ability: a,
		Config:  b.cfg,
	})

	if err != nil {
		return "", err
	}

	return lua, nil
}
