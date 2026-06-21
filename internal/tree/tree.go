package tree

import (
	"fmt"
	"os"
)

type Tree struct {
	Name      string
	Version   string
	Dirpath   string
	Profiles  []*Profile
	Abilities []*Ability
}

func New(path string) (*Tree, error) {
	stat, err := os.Stat(path)
	if err != nil {
		err = fmt.Errorf("tree directory %s does not exist", path)
		return nil, err
	}

	if !stat.IsDir() {
		err = fmt.Errorf("tree directory %s is not a directory", path)
		return nil, err
	}

	p := &Tree{
		Dirpath:   path,
		Profiles:  ListProfiles(path),
		Abilities: ListAbilities(path),
	}

	return p, nil
}
