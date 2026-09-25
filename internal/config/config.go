package config

import (
	"encoding/json"
	"os"
)

type Config struct {
	Name      string   `json:"name"`
	Version   string   `json:"version"`
	Expansion string   `json:"expansion"`
	Input     string   `json:"input"`
	Output    string   `json:"output"`
	Debug     bool     `json:"debug"`
	Print     bool     `json:"print"`
	Watch     bool     `json:"watch"`
	Encode    bool     `json:"encode"`
	Allow     []string `json:"allow"`
}

func DefaultConfig() *Config {
	cfg := &Config{
		Name:      "MK",
		Version:   "0.1",
		Expansion: "Wrath",
		Input:     ".",
		Output:    "../Rotations",
		Debug:     true,
		Print:     false,
		Watch:     true,
		Encode:    false,
		Allow:     []string{},
	}

	return cfg
}

func LoadConfig(path string, cfg *Config) error {
	data, err := os.ReadFile(path)
	if err != nil {
		return err
	}

	return json.Unmarshal(data, cfg)
}

func SaveConfig(path string, cfg *Config) error {
	data, err := json.MarshalIndent(cfg, "", "	")
	if err != nil {
		return err
	}

	return os.WriteFile(path, data, 0644)
}
