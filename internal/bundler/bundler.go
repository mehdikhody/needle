package bundler

import (
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
