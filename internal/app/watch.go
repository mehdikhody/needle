package app

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"sync"
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

// isSource reports whether a change to path should trigger a rebuild: only
// ability (.lua) and profile/config (.json) files, never files under output.
func isSource(path, output string) bool {
	ext := strings.ToLower(filepath.Ext(path))
	if ext != ".lua" && ext != ".json" {
		return false
	}

	abs, err := filepath.Abs(path)
	if err != nil {
		return true
	}
	rel, err := filepath.Rel(output, abs)
	if err == nil && rel != ".." && !strings.HasPrefix(rel, ".."+string(filepath.Separator)) {
		return false
	}

	return true
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

	// Snapshot now: a.cfg is reloaded by builds running on the timer goroutine.
	output, err := filepath.Abs(a.cfg.Output)
	if err != nil {
		output = a.cfg.Output
	}

	if err := a.Run(); err != nil {
		fmt.Printf("run error: %v\n", err)
	}

	fmt.Printf("Watching `%s` for changes...\n", a.cfg.Input)

	var (
		mu       sync.Mutex
		timer    *time.Timer
		debounce = 300 * time.Millisecond
	)

	rebuild := func() {
		mu.Lock()
		defer mu.Unlock()
		if err := a.Run(); err != nil {
			fmt.Printf("run error: %v\n", err)
		}
	}

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

			if !event.Has(fsnotify.Write) && !event.Has(fsnotify.Create) &&
				!event.Has(fsnotify.Remove) && !event.Has(fsnotify.Rename) {
				continue
			}

			if !isSource(event.Name, output) {
				continue
			}

			// Always (re)arm the timer: a change made during a build schedules
			// one more build, which waits on mu until the current one finishes.
			if timer != nil {
				timer.Stop()
			}
			timer = time.AfterFunc(debounce, rebuild)

		case err, ok := <-w.Errors:
			if !ok {
				return nil
			}
			fmt.Printf("watcher error: %v\n", err)
		}
	}
}
