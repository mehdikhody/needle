-- SpellId: MK_SACRED_SHIELD
-- Target: player
if
    ni.unit.hp("player") <= 30
    and not ni.unit.buff("player", MK_SACRED_SHIELD)
then
    return true
end
