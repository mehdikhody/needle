if not ni.unit.isboss("target") then
    return false
end

local ttd = ni.unit.ttd("target")
local curse = nil

if not ni.unit.debuff("target", MK_CURSE_OF_THE_ELEMENTS)
    and not ni.unit.debuff("target", MK_EARTH_AND_MOON)
    and not ni.unit.debuff("target", MK_EBON_PLAGUE)
then
    curse = MK_CURSE_OF_THE_ELEMENTS
elseif
    not ni.unit.debuff("target", MK_CURSE_OF_THE_ELEMENTS, "player")
    and not ni.unit.debuff("target", MK_CURSE_OF_DOOM, "player")
    and (ttd < 0 or ttd >= 60)
then
    curse = MK_CURSE_OF_DOOM
end

if
    curse
    and ni.spell.available(curse)
    and MK.IsUsableSpell(curse)
    and ni.spell.valid("target", curse, true, true)
then
    ni.spell.cast(curse, "target")
    return true
end
