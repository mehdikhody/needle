-- SpellId: MK_SWIPE_CAT
if
    MK_AOE
    and ni.unit.buff("player", MK_SAVAGE_ROAR)
    and #ni.unit.enemiesinrange("player", 8) >= 3
then
    return true
end
