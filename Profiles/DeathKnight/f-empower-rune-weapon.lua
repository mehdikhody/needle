if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
    and GetRuneType(1) == 4
    and GetRuneType(2) == 4
    and math.min(
        MK_GetRuneCooldown(1),
        MK_GetRuneCooldown(2),
        MK_GetRuneCooldown(3),
        MK_GetRuneCooldown(4),
        MK_GetRuneCooldown(5),
        MK_GetRuneCooldown(6)
    ) > 2
then
    ni.spell.cast(MK_EMPOWER_RUNE_WEAPON)
    return true
end
