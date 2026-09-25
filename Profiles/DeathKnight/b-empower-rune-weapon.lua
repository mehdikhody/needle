-- SpellId: MK_EMPOWER_RUNE_WEAPON
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
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
