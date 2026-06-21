package app

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/fsnotify/fsnotify"
)

func watchDirectory(w *fsnotify.Watcher, dirpath string) error {
	return filepath.WalkDir(dirpath, func(path string, d os.DirEntry, err error) error {
		if err != nil {
			return nil
		}
		if d.IsDir() && strings.HasPrefix(d.Name(), ".") && path != dirpath {
			return filepath.SkipDir
		}
		if d.IsDir() {
			return w.Add(path)
		}
		return nil
	})
}

func (a *App) Watch() error {
	w, err := fsnotify.NewWatcher()
	if err != nil {
		return err
	}
	defer w.Close()

	err = watchDirectory(w, a.cfg.Input)
	if err != nil {
		err = fmt.Errorf("failed to set up watcher: %w", err)
		return err
	}

	if err := a.Run(); err != nil {
		fmt.Printf("run error: %v\n", err)
	}

	var (
		timer    *time.Timer
		debounce = 300 * time.Millisecond
	)

	running := false

	for {
		select {
		case event, ok := <-w.Events:
			if !ok {
				return nil
			}

			if event.Has(fsnotify.Create) {
				if info, err := os.Stat(event.Name); err == nil && info.IsDir() {
					_ = watchDirectory(w, event.Name)
					continue
				}
			}

			if !event.Has(fsnotify.Write) && !event.Has(fsnotify.Create) && !event.Has(fsnotify.Remove) {
				continue
			}

			if running {
				continue
			}

			if timer != nil {
				timer.Stop()
			}

			timer = time.AfterFunc(debounce, func() {
				running = true
				if err := a.Run(); err != nil {
					fmt.Printf("run error: %v\n", err)
				}
				running = false
			})

		case err, ok := <-w.Errors:
			if !ok {
				return nil
			}
			fmt.Printf("watcher error: %v\n", err)
		}
	}
}
