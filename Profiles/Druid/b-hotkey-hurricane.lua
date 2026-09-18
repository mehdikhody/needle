if not MK_HURRICANE_KEYDOWN then MK_HURRICANE_KEYDOWN = 0 end
if not IsRightControlKeyDown() then MK_HURRICANE_KEYDOWN = 0 end
if MK_USE_HURRICANE == nil then MK_USE_HURRICANE = false end

if
    IsRightControlKeyDown()
    and not IsRightAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsLeftAltKeyDown()
    and not IsRightShiftKeyDown()
    and GetTime() - MK_HURRICANE_KEYDOWN > 1
then
    MK_HURRICANE_KEYDOWN = GetTime()
    MK_USE_HURRICANE = not MK_USE_HURRICANE
end

if MK_FRAME_LINES ~= nil then
    local label = "(R Ctrl) Hurricane: "
    if MK_USE_HURRICANE then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
