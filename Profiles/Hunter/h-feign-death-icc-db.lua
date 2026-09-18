for i = 1, 60 do
    local unit = "nameplate" .. i

    if
        UnitExists(unit)
        and UnitExists(unit .. "target")
        and UnitName(unit) == "Deathbringer Saurfang"
        and ni.unit.iscasting(unit)
        and UnitIsUnit(unit .. "target", "player")
    then
        local spell, _, _, _, startTime, endTime = UnitCastingInfo(unit)
        local now = GetTime() * 1000

        if
            spell == "Mark of the Fallen Champion"
            and now >= startTime + ((endTime - startTime) / 2)
        then
            ni.spell.cast(MK_FEIGN_DEATH)
            return true
        end
    end
end
