if MK_MARK == nil then MK_MARK = true end
if not MK_MARK_KEYDOWN then MK_MARK_KEYDOWN = 0 end
if not IsRightShiftKeyDown() or not IsRightControlKeyDown() then MK_MARK_KEYDOWN = 0 end

if
    IsRightShiftKeyDown()
    and IsRightControlKeyDown()
    and not IsRightAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsLeftAltKeyDown()
    and GetTime() - MK_MARK_KEYDOWN > 0.5
then
    MK_MARK_KEYDOWN = GetTime()
    MK_MARK = not MK_MARK
end

if MK_FRAME_LINES then
    local label = "(R Shift + R Ctrl) Mark: "
    if MK_MARK then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
