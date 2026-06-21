package metadata

import "fmt"

func toBool(val string) (bool, error) {
	switch val {
	case "true", "1", "yes", "y", "on":
		return true, nil
	case "false", "0", "no", "n", "off":
		return false, nil
	}

	err := fmt.Errorf("invalid boolean value: %q", val)
	return false, err
}

func (m *Metadata) GetBool(key string, def ...bool) bool {
	val := m.GetString(key)
	if val == "" {
		if len(def) > 0 {
			return def[0]
		}
		return false
	}

	result, err := toBool(val)
	if err != nil {
		return result
	}

	if len(def) > 0 {
		return def[0]
	}
	return false
}

func (m *Metadata) GetBoolSlice(key string, def ...[]bool) []bool {
	parts := m.GetStringSlice(key)
	if len(parts) == 0 {
		if len(def) > 0 {
			return def[0]
		}
		return nil
	}

	out := make([]bool, 0, len(parts))
	for _, part := range parts {
		result, _ := toBool(part)
		out = append(out, result)
	}

	if len(out) == 0 {
		if len(def) > 0 {
			return def[0]
		}
	}

	return out
}
