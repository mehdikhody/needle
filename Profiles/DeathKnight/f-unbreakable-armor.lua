-- SpellId: MK_UNBREAKABLE_ARMOR
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and ni.spell.available(MK_UNBREAKABLE_ARMOR)
then
    return true
end
