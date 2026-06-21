package app

import (
	"fmt"
	"os"
	"path/filepath"

	"needle/internal/wow"
)

func (a *App) Structurize() error {
	for _, class := range wow.Classes {
		path := filepath.Join("./", string(class))
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

	for _, class := range wow.Classes {
		path := filepath.Join(a.cfg.Output, string(class), a.cfg.Expansion)
		_, err := os.Stat(path)
		if err != nil {
			fmt.Println(err)
			os.MkdirAll(path, os.ModePerm)
		}
	}

	return nil
}
