if not MK_RAGING_KEYDOWN then MK_RAGING_KEYDOWN = 0 end
if MK_RAGING == nil then MK_RAGING = false end

if not IsRightControlKeyDown() then
    MK_RAGING_KEYDOWN = 0
end

if
    IsRightControlKeyDown()
    and not IsRightShiftKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftAltKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsRightAltKeyDown()
    and GetTime() - MK_RAGING_KEYDOWN > 0.5
then
    MK_RAGING_KEYDOWN = GetTime()
    MK_RAGING = not MK_RAGING
end

if MK_FRAME_LINES then
    local label = "(R Ctrl) Raging: "
    if MK_RAGING then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
