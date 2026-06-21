package tree

type Project struct {
	Name      string
	Version   string
	Dirpath   string
	Profiles  []*Profile
	Abilities []*Ability
}

func New(name, version, path string) (*Project, error) {
	p := &Project{
		Name:      name,
		Version:   version,
		Dirpath:   path,
		Profiles:  ListProfiles(path),
		Abilities: ListAbilities(path),
	}

	return p, nil
}
