package bundler

import (
	"strings"

	"needle/internal/config"
	"needle/internal/tree"
)

type Bundler struct {
	cfg  *config.Config
	tree *tree.Tree
}

func New(cfg *config.Config) (*Bundler, error) {
	t, err := tree.New(cfg.Input)
	if err != nil {
		return nil, err
	}

	b := &Bundler{
		cfg:  cfg,
		tree: t,
	}

	return b, nil
}

// allowList returns the configured character names, trimmed, without empties.
// An empty result means every character may use the profile.
func (b *Bundler) allowList() []string {
	allow := make([]string, 0, len(b.cfg.Allow))
	for _, name := range b.cfg.Allow {
		name = strings.TrimSpace(name)
		if name != "" {
			allow = append(allow, name)
		}
	}

	return allow
}
