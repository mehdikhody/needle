package config

import (
	"encoding/json"
	"os"
)

type ProfileConfig struct {
	Name     string   `json:"name"`
	Rotation []string `json:"rotation"`
}

func DefaultProfileConfig() *ProfileConfig {
	cfg := &ProfileConfig{
		Name:     "",
		Rotation: []string{},
	}

	return cfg
}

func LoadProfileConfig(path string, cfg *ProfileConfig) error {
	data, err := os.ReadFile(path)
	if err != nil {
		return err
	}

	return json.Unmarshal(data, cfg)
}

func SaveProfileConfig(path string, cfg *ProfileConfig) error {
	data, err := json.MarshalIndent(cfg, "", "	")
	if err != nil {
		return err
	}

	return os.WriteFile(path, data, 0644)
}
