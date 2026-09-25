-- SpellId: MK_BERSERK
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
then
    return true
end
