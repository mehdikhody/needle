package config

import (
	"encoding/json"
	"os"
)

type Config struct {
	Name      string   `json:"name"`
	Version   string   `json:"version"`
	Expansion string   `json:"expansion"`
	Output    string   `json:"output"`
	Debug     bool     `json:"debug"`
	Watch     bool     `json:"watch"`
	Encode    bool     `json:"encode"`
	Remote    bool     `json:"remote"`
	Allow     []string `json:"allow"`
}

func DefaultConfig() *Config {
	cfg := &Config{
		Name:      "MK",
		Version:   "0.1",
		Expansion: "Wrath",
		Output:    "../Rotations",
		Debug:     true,
		Watch:     true,
		Encode:    false,
		Remote:    false,
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
