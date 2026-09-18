if
    MK_PET_CONTROL
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and IsPetAttackActive()
    and UnitExists("target")
    and UnitCanAttack("player", "target")
    and UnitIsUnit("player", "targettarget")
    and UnitName("target") ~= "Aerial Command Unit"
    and ni.spell.cd(61676) == 0
then
    ni.spell.cast(61676, "target")
    return true
end
