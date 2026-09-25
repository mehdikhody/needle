-- SpellId: MK_TIGERS_FURY
if
    ni.unit.inmelee("player", "target")
    and ni.unit.power("player") <= 40
    and not ni.unit.buff("player", MK_BERSERK)
then
    return true
end
