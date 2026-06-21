package app

import "needle/internal/config"

func (a *App) Load() error {
	err := config.LoadConfig(a.Filepath, a.cfg)
	if err != nil {
		return err
	}

	err = config.SaveConfig(a.Filepath, a.cfg)
	if err != nil {
		return err
	}

	return nil
}
