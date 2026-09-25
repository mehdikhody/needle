-- SpellId: MK_PLAGUE_STRIKE
-- Target: target

-- without Scourge Strike, spare Unholy runes go to Plague Strike
if
    not IsSpellKnown(MK_SCOURGE_STRIKE)
    and (not MK.PoolForDeathAndDecay() or MK.RunesReady(2) >= 2)
then
    return true
end
