-- SpellId: MK_PESTILENCE
local epidemic = { GetTalentInfo(3, 4) }

if
    epidemic[5] == 2
    and ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") >= 18
    and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") >= 18
    and (GetRuneType(1) == 4) ~= (GetRuneType(2) == 4)
    and (MK.GetRuneCooldown(1) == 0) ~= (MK.GetRuneCooldown(2) == 0)
then
    return true
end
