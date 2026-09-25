-- SpellId: MK_FEIGN_DEATH
local function isHalfwayThroughMark(unit)
    local spell, _, _, _, startTime, endTime = UnitCastingInfo(unit)

    if spell ~= "Mark of the Fallen Champion" then
        return false
    end

    return GetTime() * 1000 >= (startTime + endTime) / 2
end

return MK.EachNameplate(function(unit)
    if
        UnitName(unit) == "Deathbringer Saurfang"
        and UnitIsUnit(unit .. "target", "player")
        and isHalfwayThroughMark(unit)
    then
        return true
    end
end)
