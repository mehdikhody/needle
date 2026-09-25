-- SpellId: MK_PRESENCE_OF_MIND
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and not ni.unit.buff("player", MK_MISSILE_BARRAGE)
then
    return true
end
