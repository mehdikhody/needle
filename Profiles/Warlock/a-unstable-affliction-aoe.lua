-- SpellId: MK_UNSTABLE_AFFLICTION
-- Target: mouseover
if MK_AOE and UnitExists("mouseover") then
    local hasDebuff = ni.unit.debuff("mouseover", MK_UNSTABLE_AFFLICTION, "player")
    local hasTTL = ni.unit.ttd("mouseover") >= 10
    local hasMinimumHP = ni.unit.hpraw("mouseover") >= 10000

    if not hasDebuff and hasTTL and hasMinimumHP then
        return true
    end
end
