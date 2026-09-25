package bundler

import (
	"fmt"
	"os"
	"path/filepath"

	"needle/internal/protect"
	"needle/internal/utils"
)

func (b *Bundler) Bundle() {
	if err := b.BundleData(); err != nil {
		fmt.Println(err)
		return
	}

	for _, p := range b.tree.Profiles {
		abilities := append(b.tree.Abilities, p.Abilities...)
		lua, err := b.BundleProfile(p, abilities)
		if err != nil {
			fmt.Println(err)
			continue
		}

		if lua == "" {
			fmt.Printf("Failed to bundle %s `%s` profile.\n", p.Class, p.ID)
			continue
		}

		if b.cfg.Encode {
			enc, err := protect.Protect(lua)
			if err != nil {
				fmt.Printf("Failed to encode %s `%s` profile: %v\n", p.Class, p.ID, err)
				continue
			}
			lua = enc
		}

		ID := utils.ProfileID(b.cfg.Name, b.cfg.Version, p.ID)
		filename := fmt.Sprintf("%s.lua", ID)
		path := filepath.Join(b.cfg.Output, string(p.Class), b.cfg.Expansion, filename)
		err = os.WriteFile(path, []byte(lua), os.ModePerm)
		if err != nil {
			fmt.Printf("Failed to save %s `%s` to file `%s.lua`.\n", p.Class, p.ID, ID)
			continue
		}

		fmt.Printf("Saved %s `%s` to file `%s`.\n", p.Class, p.ID, ID)
	}
}
