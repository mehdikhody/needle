-- SpellId: MK_FAN_OF_KNIVES
if
    MK_AOE
    and ni.unit.buff("player", MK_SLICE_AND_DICE)
    and #ni.unit.enemiesinrange("player", 8) >= 4
then
    return true
end
