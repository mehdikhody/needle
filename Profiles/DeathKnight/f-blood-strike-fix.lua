local epidemic = { GetTalentInfo(3, 4) }
local ffRemaining = ni.unit.debuffremaining("target", MK_FROST_FEVER, "player")
local bpRemaining = ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player")

if epidemic[5] == 2 then
    if
        ffRemaining <= 5 
        and bpRemaining <= 5
        and ffRemaining >= 2 
        and bpRemaining >= 2
        and MK_GetRuneCooldown(1) <= 1 
        and MK_GetRuneCooldown(2) <= 1
    then
        ni.spell.cast(MK_BLOOD_STRIKE, "target")
        return true
    end
else
    if
        ffRemaining <= 8 
        and bpRemaining <= 8
        and GetRuneType(1) == 4 
        and GetRuneType(2) == 4
        and MK_GetRuneCooldown(1) == 0 
        and MK_GetRuneCooldown(2) == 0
    then
        ni.spell.cast(MK_BLOOD_STRIKE, "target")
        return true
    end
end
