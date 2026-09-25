-- SpellId: MK_SUMMON_GARGOYLE
-- Target: target
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and not ni.unit.buff("player", MK_BLOOD_PRESENCE)
then
    return true
end
