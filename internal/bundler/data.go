package bundler

import (
	"fmt"
	"os"
	"path/filepath"

	"needle/internal/protect"
	"needle/internal/tmpl"
	"needle/internal/utils"
)

// remoteFile is the NI settings file (addon\Settings) that persists the
// PC-wide disabled flag. Nondescript on purpose.
const remoteFile = "ui_cache.json"

// dataID is the require name of the shared Data module, or "" when there is
// nothing to put in it and profiles should not load one.
func (b *Bundler) dataID() string {
	if len(b.tree.Data) == 0 && len(b.allowList()) == 0 && !b.cfg.Remote {
		return ""
	}

	return utils.DataID(b.cfg.Name, b.cfg.Version)
}

// BundleData writes the shared module every profile loads via
// ni.utils.require. Profiles are useless without it, so errors are fatal.
func (b *Bundler) BundleData() error {
	id := b.dataID()
	if id == "" {
		return nil
	}

	remote := ""
	if b.cfg.Remote {
		var err error
		remote, err = tmpl.RenderRemote(&tmpl.RemoteData{
			Version: id,
			File:    remoteFile,
		})
		if err != nil {
			return err
		}
	}

	lua, err := tmpl.RenderData(&tmpl.DataData{
		Allow:  b.allowList(),
		Files:  b.tree.Data,
		Remote: remote,
	})
	if err != nil {
		return err
	}

	if b.cfg.Encode {
		lua, err = protect.Protect(lua)
		if err != nil {
			return fmt.Errorf("failed to encode `%s` data: %v", id, err)
		}
	}

	path := filepath.Join(b.cfg.Output, "Data", id+".lua")
	if err := os.WriteFile(path, []byte(lua), os.ModePerm); err != nil {
		return fmt.Errorf("failed to save `%s` data: %v", id, err)
	}

	fmt.Printf("Saved data to file `%s`.\n", id)
	return nil
}
