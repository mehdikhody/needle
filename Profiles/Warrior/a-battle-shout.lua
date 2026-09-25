-- SpellId: MK_BATTLE_SHOUT
if
    ni.unit.buffremaining("player", MK_BATTLE_SHOUT) < 5
    and not ni.unit.buff("player", MK_COMMANDING_SHOUT, "player")
then
    return true
end
