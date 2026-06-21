package tree

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"needle/internal/metadata"
)

type Ability struct {
	ID       string
	Filepath string
	SpellId  string
	Target   string
	Facing   bool
	Los      bool
	Lua      string
}

func NewAbility(path string) (*Ability, error) {
	basename := filepath.Base(path)
	id := strings.TrimSuffix(basename, filepath.Ext(path))

	if filepath.Ext(path) != ".lua" {
		err := fmt.Errorf("ability `%s` is not a lua file", id)
		return nil, err
	}

	meta, err := metadata.New(path)
	if err != nil {
		return nil, err
	}

	a := &Ability{
		ID:       id,
		Filepath: path,
		SpellId:  meta.GetString("spellId"),
		Target:   meta.GetString("target"),
		Facing:   meta.GetBool("facing", true),
		Los:      meta.GetBool("los", true),
		Lua:      meta.Content,
	}

	return a, nil
}

func ListAbilities(dirpath string) []*Ability {
	abilities := make([]*Ability, 0)

	files, err := os.ReadDir(dirpath)
	if err != nil {
		return abilities
	}

	for _, f := range files {
		if f.IsDir() || filepath.Ext(f.Name()) != ".lua" {
			continue
		}

		path := filepath.Join(dirpath, f.Name())
		a, err := NewAbility(path)
		if err != nil {
			id := strings.TrimSuffix(f.Name(), filepath.Ext(path))
			fmt.Printf("Skipped ability `%s`\n", id)
			continue
		}

		abilities = append(abilities, a)
	}

	return abilities
}
