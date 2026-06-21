package app

import (
	"fmt"

	"needle/internal/bundler"
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
	return nil
}
