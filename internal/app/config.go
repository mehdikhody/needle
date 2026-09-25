package app

import (
	"bytes"
	"encoding/json"
	"os"

	"needle/internal/config"
)

func (a *App) Load() error {
	err := config.LoadConfig(a.Filepath, a.cfg)
	if err != nil {
		return err
	}

	// Only rewrite the config when normalizing it changes something, so the
	// watcher isn't re-triggered by our own write on every build.
	data, err := json.MarshalIndent(a.cfg, "", "	")
	if err != nil {
		return err
	}

	current, err := os.ReadFile(a.Filepath)
	current = bytes.ReplaceAll(current, []byte("\r\n"), []byte("\n"))
	if err == nil && bytes.Equal(bytes.TrimSpace(current), data) {
		return nil
	}

	return config.SaveConfig(a.Filepath, a.cfg)
}
