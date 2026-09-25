-- SpellId: MK_SUMMON_WATER_ELEMENTAL
if 
    MK_PET_CONTROL
    and (not UnitExists("pet") or UnitIsDead("pet")) 
then
    return true
end
