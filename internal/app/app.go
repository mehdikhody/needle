package app

import (
	"needle/internal/config"
)

type App struct {
	cfg      *config.Config
	Filepath string
}

func New(path string, cfg *config.Config) *App {
	return &App{
		cfg:      cfg,
		Filepath: path,
	}
}
