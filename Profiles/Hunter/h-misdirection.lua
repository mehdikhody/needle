-- SpellId: MK_MISDIRECTION
-- Target: focus
if
    MK_MD
    and UnitExists("focus")
    and UnitIsPlayer("focus")
    and UnitIsFriend("player", "focus")
    and UnitInRange("focus")
    and not UnitIsUnit("player", "focus")
    and not UnitIsDeadOrGhost("focus")
    and ni.unit.isboss("target")
    and ni.spell.valid("focus", MK_MISDIRECTION, false, true)
then
    return true
end