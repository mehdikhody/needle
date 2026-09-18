if
    GetUnitSpeed("player") >= 3
    and ni.unit.debuffremaining("target", MK_FLAME_SHOCK, "player") >= 5
then
    ni.spell.cast(MK_EARTH_SHOCK, "target")
    return true
end
