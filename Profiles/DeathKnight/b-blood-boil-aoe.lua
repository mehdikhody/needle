-- SpellId: MK_BLOOD_BOIL
if
    MK_AOE
    and ni.unit.distance("player", "target") <= 10
    and #ni.unit.enemiesinrange("target", 10) >= 4
then
    return true
end
