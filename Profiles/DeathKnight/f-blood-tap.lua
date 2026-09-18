if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
then
    ni.spell.cast(MK_BLOOD_TAP)
    return true
end
