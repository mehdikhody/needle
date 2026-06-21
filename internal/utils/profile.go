package utils

import (
	"fmt"
	"strings"
)

func ProfileID(name, version, profileId string) string {
	profileId = strings.Title(strings.ToLower(profileId))
	return fmt.Sprintf("%s_%s_%s", name, version, profileId)
}
