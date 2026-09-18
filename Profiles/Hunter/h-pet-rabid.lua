if
    MK_PET_CONTROL
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and UnitExists("target")
    and UnitCanAttack("player", "target")
    and UnitCanAttack("pet", "target")
    and IsPetAttackActive()
    and ni.spell.valid("target", 52474, true, true)
then
    ni.spell.cast(53401)
    return true
end