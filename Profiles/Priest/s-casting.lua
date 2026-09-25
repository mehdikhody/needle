local spell, _, _, _, startTime, endTime = UnitChannelInfo("player")

if spell then
    local elapsed = GetTime() * 1000 - startTime
    if spell ~= GetSpellInfo(MK_MIND_FLAY) or elapsed < (endTime - startTime) * 2 / 3 then
        return true
    end
end

if UnitCastingInfo("player") then
    return true
end
