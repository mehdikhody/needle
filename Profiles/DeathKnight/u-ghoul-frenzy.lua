-- SpellId: MK_GHOUL_FRENZY
-- Target: pet
if
    not MK.PoolForDeathAndDecay()
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and ni.unit.buffremaining("pet", MK_GHOUL_FRENZY, "player") <= 10
then
    return true
end
