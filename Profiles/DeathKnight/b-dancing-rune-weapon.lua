-- SpellId: MK_DANCING_RUNE_WEAPON
-- Target: target
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    return true
end
