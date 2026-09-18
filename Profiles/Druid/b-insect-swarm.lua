if
    not ni.unit.buff("player", MK_LUNAR)
    and not ni.unit.debuff("target", MK_INSECT_SWARM, "player")
then
    ni.spell.cast(MK_INSECT_SWARM, "target")
    return true
end
