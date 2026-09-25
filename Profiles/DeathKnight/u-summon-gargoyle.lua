-- SpellId: MK_SUMMON_GARGOYLE
-- Target: target
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.buff("player", MK_UNHOLY_PRESENCE)
then
    return true
end
