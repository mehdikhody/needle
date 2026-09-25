-- SpellId: MK_BONE_SHIELD
if
    not MK.PoolForDeathAndDecay()
    and ni.unit.buffremaining("player", MK_BONE_SHIELD) <= 5
then
    return true
end
