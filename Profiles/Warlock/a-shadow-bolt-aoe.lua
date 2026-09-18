if MK_AOE and UnitExists("mouseover") then
    -- Refresh lead time scales with distance (old profile used 8/10/15/20 yard bands)
    local SBT = 5
    local distance = ni.unit.distance("player", "mouseover")
    if distance >= 10 then SBT = 6 end
    if distance >= 15 then SBT = 7 end
    if distance >= 20 then SBT = 8 end

    if
        ni.unit.debuff("mouseover", MK_CORRUPTION, "player")
        and ni.unit.debuffremaining("mouseover", MK_CORRUPTION, "player") <= SBT
    then
        ni.spell.cast(MK_SHADOW_BOLT, "mouseover")
        return true
    end
end
