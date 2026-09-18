if
    GetUnitSpeed("player") >= 3
    and ni.unit.hp("player") >= 50
    and ni.unit.power("player") <= 95
then
    ni.spell.cast(MK_LIFE_TAP)
    return true
end
