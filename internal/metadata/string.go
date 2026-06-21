package metadata

import "strings"

func (m *Metadata) GetString(key string, def ...string) string {
	val, ok := m.Data[strings.ToLower(key)]
	if ok {
		return val
	}
	if len(def) > 0 {
		return def[0]
	}
	return ""
}

func (m *Metadata) GetStringSlice(key string, def ...[]string) []string {
	val := m.GetString(key)
	if len(val) == 0 {
		if len(def) > 0 {
			return def[0]
		}
		return nil
	}

	parts := strings.Split(val, ",")
	out := make([]string, 0, len(parts))

	for _, part := range parts {
		v := strings.TrimSpace(part)
		if v != "" {
			out = append(out, v)
		}
	}

	if len(out) == 0 {
		if len(def) > 0 {
			return def[0]
		}
	}

	return out
}
