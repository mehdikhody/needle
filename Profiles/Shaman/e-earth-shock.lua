-- SpellId: MK_EARTH_SHOCK
if
    GetUnitSpeed("player") >= 3
    and ni.unit.debuffremaining("target", MK_FLAME_SHOCK, "player") >= 5
then
    return true
end
