-- SpellId: MK_SUMMON_FELGUARD
if
    GetUnitSpeed("player") == 0
    and (not UnitExists("pet") or UnitIsDead("pet"))
then
    return true
end
