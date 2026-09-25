-- SpellId: MK_PESTILENCE
if
    MK_COOLDOWNS
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
    and ni.spell.cd(MK_EMPOWER_RUNE_WEAPON) == 0
    and (GetRuneType(1) == 4) ~= (GetRuneType(2) == 4)
    and (MK_GetRuneCooldown(1) == 0) ~= (MK_GetRuneCooldown(2) == 0)
    and MK_GetRuneCooldown(3) > 0
    and MK_GetRuneCooldown(4) > 0
    and MK_GetRuneCooldown(5) > 0
    and MK_GetRuneCooldown(6) > 0
then
    return true
end
