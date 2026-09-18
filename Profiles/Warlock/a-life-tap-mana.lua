if
    ni.unit.hp("player") >= 20
    and ni.unit.power("player") <= 30
then
    if not UnitExists("target") or not ni.spell.available(MK_SHADOW_BOLT) then
        ni.spell.cast(MK_LIFE_TAP)
        return true
    end

    if
        UnitExists("target")
        and ni.unit.hp("target") >= 30
        and not ni.unit.buff("player", MK_ERADICATION)
    then
        ni.spell.cast(MK_LIFE_TAP)
        return true
    end
end
