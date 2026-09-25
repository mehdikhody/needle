-- SpellId: MK_CURSE_OF_AGONY
-- Target: mouseover
if MK_AOE and UnitExists("mouseover") then
    if
        not ni.unit.debuff("mouseover", MK_CURSE_OF_THE_ELEMENTS, "player")
        and not ni.unit.debuff("mouseover", MK_CURSE_OF_DOOM, "player")
        and not ni.unit.debuff("mouseover", MK_CURSE_OF_AGONY, "player")
    then
        return true
    end
end
