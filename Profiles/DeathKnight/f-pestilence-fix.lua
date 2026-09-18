local epidemic = { GetTalentInfo(3, 4) }

if
    epidemic[5] == 2
    and ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") >= 18
    and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") >= 18
    and (GetRuneType(1) == 4) ~= (GetRuneType(2) == 4)
    and (MK_GetRuneCooldown(1) == 0) ~= (MK_GetRuneCooldown(2) == 0)
then
    ni.spell.cast(MK_PESTILENCE, "target")
    return true
end
