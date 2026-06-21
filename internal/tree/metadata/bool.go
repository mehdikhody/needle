package metadata

func (m *Metadata) GetBool(key string, def ...bool) bool {
	val := m.GetString(key)
	if val == "" {
		if len(def) > 0 {
			return def[0]
		}
		return false
	}

	switch val {
	case "true", "1", "yes", "y", "on":
		return true
	case "false", "0", "no", "n", "off":
		return false
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
		switch part {
		case "true", "1", "yes", "y", "on":
			out = append(out, true)
		case "false", "0", "no", "n", "off":
			out = append(out, false)
		default:
			out = append(out, false)
		}
	}

	if len(out) == 0 {
		if len(def) > 0 {
			return def[0]
		}
	}

	return out
}
