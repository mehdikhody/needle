-- SpellId: MK_AVENGING_WRATH
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
then
    return true
end
