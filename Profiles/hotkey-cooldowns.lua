if not MK_COOLDOWNS_KEYDOWN then MK_COOLDOWNS_KEYDOWN = 0 end
if not IsRightAltKeyDown() then MK_COOLDOWNS_KEYDOWN = 0 end
if MK_COOLDOWNS == nil then MK_COOLDOWNS = true end

if
    IsRightAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsLeftAltKeyDown()
    and not IsRightShiftKeyDown()
    and not IsRightControlKeyDown()
    and GetTime() - MK_COOLDOWNS_KEYDOWN > 0.5
then
    MK_COOLDOWNS_KEYDOWN = GetTime()
    MK_COOLDOWNS = not MK_COOLDOWNS
end

if MK_FRAME_LINES then
    local label = "(R Alt) Cooldowns: "
    if MK_COOLDOWNS then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
