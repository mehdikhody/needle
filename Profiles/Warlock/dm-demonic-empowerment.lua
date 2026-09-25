-- SpellId: MK_DEMONIC_EMPOWERMENT
if
    UnitExists("pet")
    and not UnitIsDead("pet")
    and UnitAffectingCombat("pet")
then
    return true
end
