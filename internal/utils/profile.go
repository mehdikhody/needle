package utils

import (
	"fmt"
	"strings"
)

func ProfileID(name, version, profileId string) string {
	profileId = strings.Title(strings.ToLower(profileId))
	return fmt.Sprintf("%s_v%s_%s", name, version, profileId)
}

// DataID names the shared Data module that profiles load via ni.utils.require.
func DataID(name, version string) string {
	return fmt.Sprintf("%s_v%s", name, version)
}
