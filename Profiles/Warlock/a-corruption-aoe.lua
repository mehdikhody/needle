if MK_AOE and UnitExists("mouseover") then
    if not ni.unit.debuff("mouseover", MK_CORRUPTION, "player") then
        MK_TakeSnapshot("mouseover")
        ni.spell.cast(MK_CORRUPTION, "mouseover")
        return true
    end
end
