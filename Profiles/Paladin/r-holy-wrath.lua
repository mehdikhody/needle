-- SpellId: MK_HOLY_WRATH
local creature = UnitCreatureType("target")

if
    ni.unit.power("player") >= 40
    and ni.unit.inmelee("player", "target")
    and (creature == "Demon" or creature == "Undead")
then
    return true
end
