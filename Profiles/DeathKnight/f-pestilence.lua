-- SpellId: MK_PESTILENCE
local epidemic = { GetTalentInfo(3, 4) }
local refresh_at = 4
if epidemic[5] == 0 then 
    refresh_at = 5
end

if
    ni.player.hasglyph(63334)
    and ni.unit.debuff("target", MK_FROST_FEVER, "player")
    and ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player")
    and (
        ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") <= refresh_at
        or ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") <= refresh_at
    )
then
    return true
end
