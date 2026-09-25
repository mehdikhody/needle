-- SpellId: MK_EMPOWER_RUNE_WEAPON
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
    and GetRuneType(1) == 4
    and GetRuneType(2) == 4
    and math.min(
        MK.GetRuneCooldown(1),
        MK.GetRuneCooldown(2),
        MK.GetRuneCooldown(3),
        MK.GetRuneCooldown(4),
        MK.GetRuneCooldown(5),
        MK.GetRuneCooldown(6)
    ) > 2
then
    return true
end
