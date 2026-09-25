-- SpellId: MK_HYSTERIA
-- Target: player
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and not ni.unit.buff("player", MK_HYSTERIA)
then
    return true
end
