-- SpellId: MK_TRANQUILIZING_SHOT
-- Target: focus
if
    UnitExists("focus")
    and UnitCanAttack("player", "focus")
    and ni.unit.buff("focus", "Enrage")
then
    return true
end