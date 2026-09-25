-- SpellId: MK_EXPLOSIVE_SHOT_RANK_2
if
    ni.unit.buff("player", MK_LOCK_AND_LOAD)
    and ni.unit.debuff("target", MK_EXPLOSIVE_SHOT, "player")
then
    return true
end
