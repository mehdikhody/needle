package main

import (
	"fmt"
	"strings"

	"needle/internal/app"
	"needle/internal/config"
	"needle/internal/version"

	"github.com/spf13/cobra"
)

var (
	cfgPath   = "./config.json"
	cfg       = config.DefaultConfig()
	watchFlag = cfg.Watch
)

var cmd = &cobra.Command{
	Use:  "needle",
	Long: "needle is a tool for bundling wow profiles for NI Loader.",
	RunE: func(cmd *cobra.Command, args []string) error {
		a := app.New(cfgPath, cfg)

		// Load before deciding so `watch` (and `input`) come from config.json.
		if err := a.Load(); err != nil {
			return err
		}

		watch := cfg.Watch
		if cmd.Flags().Changed("watch") {
			watch = watchFlag
		}

		if watch {
			return a.Watch()
		}

		return a.Run()
	},
}

func main() {
	cmd.Version = version.Version

	versionTemplate := []string{
		"",
		"------------- needle -------------",
		fmt.Sprintf("%-10s %s", "Version:", version.Version),
		fmt.Sprintf("%-10s %s", "Commit:", version.Commit),
		fmt.Sprintf("%-10s %s", "Date:", version.Date),
		"",
	}

	cmd.SetVersionTemplate(strings.Join(versionTemplate, "\n"))
	cmd.SetHelpCommand(&cobra.Command{Hidden: true})
	cmd.CompletionOptions.DisableDefaultCmd = true

	cmd.Flags().SortFlags = false
	cmd.Flags().StringVarP(&cfgPath, "config", "c", cfgPath, "config path.")
	cmd.Flags().BoolVarP(&watchFlag, "watch", "w", watchFlag, "watch project (overrides config).")

	if err := cmd.Execute(); err != nil {
		fmt.Println(err)
	}
}
