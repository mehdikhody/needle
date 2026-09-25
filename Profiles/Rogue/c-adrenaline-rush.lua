-- SpellId: MK_ADRENALINE_RUSH
if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and UnitPower("player") <= 50
then
    return true
end
