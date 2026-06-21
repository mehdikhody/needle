package tree

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"needle/internal/config"
	"needle/internal/wow"
)

type Profile struct {
	ID        string
	Filepath  string
	Class     wow.Class
	Rotation  []string
	Abilities []*Ability
}

func NewProfile(class wow.Class, path string) (*Profile, error) {
	basename := filepath.Base(path)
	id := strings.TrimSuffix(basename, filepath.Ext(path))

	if filepath.Ext(path) != ".json" {
		err := fmt.Errorf("profile `%s` is not a json file", id)
		return nil, err
	}

	cfg := config.DefaultProfileConfig()
	err := config.LoadProfileConfig(path, cfg)
	if err != nil {
		err = fmt.Errorf("profile `%s` is not a valid json file", id)
		return nil, err
	}

	p := &Profile{
		ID:        id,
		Filepath:  path,
		Class:     class,
		Rotation:  cfg.Rotation,
		Abilities: make([]*Ability, 0),
	}

	return p, nil
}

func ListProfiles(basepath string) []*Profile {
	profiles := make([]*Profile, 0)

	for _, class := range wow.Classes {
		dirpath := filepath.Join(basepath, string(class))
		files, err := os.ReadDir(dirpath)
		if err != nil {
			fmt.Printf("Class `%s` not found", class)
			continue
		}

		for _, file := range files {
			if file.IsDir() || filepath.Ext(file.Name()) != ".json" {
				continue
			}

			path := filepath.Join(dirpath, file.Name())
			p, err := NewProfile(class, path)
			if err != nil {
				fmt.Println(err)
				continue
			}

			profiles = append(profiles, p)
		}
	}

	return profiles
}
