-- SpellId: MK_CORRUPTION
-- Target: mouseover
if MK_AOE and UnitExists("mouseover") then
    if not ni.unit.debuff("mouseover", MK_CORRUPTION, "player") then
        MK_TakeSnapshot("mouseover")
        return true
    end
end
