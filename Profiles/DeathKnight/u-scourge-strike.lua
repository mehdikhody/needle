-- SpellId: MK_SCOURGE_STRIKE
-- Target: target
if
    ni.unit.debuff("target", MK_FROST_FEVER, "player")
    and ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player")
    and (
        not MK.PoolForDeathAndDecay()
        or MK.RunesReady(3) >= 2 and MK.RunesReady(2) >= 2
    )
then
    return true
end
