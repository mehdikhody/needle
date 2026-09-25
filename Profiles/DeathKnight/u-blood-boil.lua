-- SpellId: MK_BLOOD_BOIL
if
    ni.unit.distance("player", "target") <= 10
    and ni.unit.debuff("target", MK_FROST_FEVER, "player")
    and ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player")
    and (not MK.PoolForDeathAndDecay() or MK.RunesReady(1) >= 2)
then
    return true
end
