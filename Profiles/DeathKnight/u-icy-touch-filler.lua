-- SpellId: MK_ICY_TOUCH
-- Target: target
if
    not IsSpellKnown(MK_SCOURGE_STRIKE)
    and (not MK.PoolForDeathAndDecay() or MK.RunesReady(3) >= 2)
then
    return true
end
