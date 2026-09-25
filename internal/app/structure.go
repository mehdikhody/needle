package app

import (
	"os"
	"path/filepath"

	"needle/internal/wow"
)

func (a *App) Structurize() error {
	for _, class := range wow.Classes {
		path := filepath.Join(a.cfg.Input, string(class))
		_, err := os.Stat(path)
		if err != nil {
			os.MkdirAll(path, os.ModePerm)
		}
	}

	if a.cfg.Output != "." {
		_, err := os.Stat(a.cfg.Output)
		if err != nil {
			os.MkdirAll(a.cfg.Output, os.ModePerm)
		}
	}

	for _, path := range []string{
		filepath.Join(a.cfg.Input, "Data"),
		filepath.Join(a.cfg.Output, "Data"),
	} {
		_, err := os.Stat(path)
		if err != nil {
			os.MkdirAll(path, os.ModePerm)
		}
	}

	for _, class := range wow.Classes {
		path := filepath.Join(a.cfg.Output, string(class), a.cfg.Expansion)
		_, err := os.Stat(path)
		if err != nil {
			os.MkdirAll(path, os.ModePerm)
		}
	}

	return nil
}
