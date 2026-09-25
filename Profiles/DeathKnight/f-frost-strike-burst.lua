-- SpellId: MK_FROST_STRIKE
if
    MK_COOLDOWNS
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
    and ni.spell.cd(MK_EMPOWER_RUNE_WEAPON) == 0
    and ni.spell.cd(MK_OBLITERATE) >= 6
    and (MK.GetRuneCooldown(1) == 0) ~= (MK.GetRuneCooldown(2) == 0)
    and MK.GetRuneCooldown(3) > 0
    and MK.GetRuneCooldown(4) > 0
    and MK.GetRuneCooldown(5) > 0
    and MK.GetRuneCooldown(6) > 0
then
    return true
end
