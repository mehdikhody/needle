if MK_AOE and UnitExists("mouseover") then
    if
        not ni.unit.debuff("mouseover", MK_CURSE_OF_THE_ELEMENTS, "player")
        and not ni.unit.debuff("mouseover", MK_CURSE_OF_DOOM, "player")
        and not ni.unit.debuff("mouseover", MK_CURSE_OF_AGONY, "player")
    then
        ni.spell.cast(MK_CURSE_OF_AGONY, "mouseover")
        return true
    end
end
