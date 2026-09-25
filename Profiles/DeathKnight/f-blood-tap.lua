-- SpellId: MK_BLOOD_TAP
if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
then
    return true
end
