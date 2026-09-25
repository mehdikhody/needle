-- SpellId: 61684
if
    MK_PET_CONTROL
    and UnitExists("pet")
    and UnitExists("target")
    and UnitCanAttack("player", "target")
    and UnitCanAttack("pet", "target")
    and IsPetAttackActive()
    and not UnitIsDead("pet")
    and not ni.spell.valid("target", 52474, false, true)
then
    return true
end
