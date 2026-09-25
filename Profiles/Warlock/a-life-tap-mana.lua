-- SpellId: MK_LIFE_TAP
if
    ni.unit.hp("player") >= 20
    and ni.unit.power("player") <= 30
then
    if not UnitExists("target") or not ni.spell.available(MK_SHADOW_BOLT) then
        return true
    end

    if
        ni.unit.hp("target") >= 30
        and not ni.unit.buff("player", MK_ERADICATION)
    then
        return true
    end
end
