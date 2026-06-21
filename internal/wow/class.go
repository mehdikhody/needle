package wow

type Class string

const (
	Warrior     Class = "Warrior"
	Paladin     Class = "Paladin"
	Hunter      Class = "Hunter"
	Mage        Class = "Mage"
	Rogue       Class = "Rogue"
	Priest      Class = "Priest"
	Shaman      Class = "Shaman"
	Warlock     Class = "Warlock"
	Druid       Class = "Druid"
	DeathKnight Class = "DeathKnight"
)

var Classes = []Class{
	Warrior,
	Paladin,
	Hunter,
	Mage,
	Rogue,
	Priest,
	Shaman,
	Warlock,
	Druid,
	DeathKnight,
}
