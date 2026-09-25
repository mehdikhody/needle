package bundler

import (
	"fmt"

	"needle/internal/tmpl"
	"needle/internal/tree"
	"needle/internal/utils"
)

func (b *Bundler) BundleProfile(p *tree.Profile, abilities []*tree.Ability) (string, error) {
	ad := make([]*tmpl.ProfileAbilityData, 0, len(abilities))
	for _, a := range abilities {
		lua, err := b.BundleAbility(a)
		if err != nil {
			fmt.Println(err)
			continue
		}

		if lua == "" {
			fmt.Printf("Failed to bundle `%s` ability for %s `%s` profile.\n", a.ID, p.Class, p.ID)
			continue
		}

		ad = append(ad, &tmpl.ProfileAbilityData{
			ID:  a.ID,
			Lua: lua,
		})
	}

	id := utils.ProfileID(b.cfg.Name, b.cfg.Version, p.ID)
	lua, err := tmpl.RenderProfile(&tmpl.ProfileData{
		ID:        id,
		Profile:   p,
		Config:    b.cfg,
		Allow:     b.allowList(),
		Abilities: ad,
	})

	if err != nil {
		return "", err
	}

	return lua, nil
}
