if
    UnitExists("focus")
    and UnitCanAttack("player", "focus")
    and ni.unit.buff("focus", "Enrage")
then
    ni.spell.cast(MK_TRANQUILIZING_SHOT, "focus")
    return true
end