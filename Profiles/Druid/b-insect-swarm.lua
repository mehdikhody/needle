-- SpellId: MK_INSECT_SWARM
if
    not ni.unit.buff("player", MK_LUNAR)
    and not ni.unit.debuff("target", MK_INSECT_SWARM, "player")
then
    return true
end
