package app

import (
	"fmt"
	"os"
	"path/filepath"

	"needle/internal/bundler"
	"needle/internal/tmpl"
)

func (a *App) Run() error {
	err := a.Load()
	if err != nil {
		return err
	}

	err = a.Structurize()
	if err != nil {
		return err
	}

	b, err := bundler.New(a.cfg)
	if err != nil {
		return fmt.Errorf("fail to init bundler: %v", err)
	}

	b.Bundle()

	if a.cfg.Remote {
		path := filepath.Join(filepath.Dir(a.Filepath), "remote-macros.txt")
		if err := os.WriteFile(path, []byte(tmpl.RemoteMacros), 0644); err != nil {
			fmt.Printf("Failed to save remote macros: %v\n", err)
		}
	}

	return nil
}
