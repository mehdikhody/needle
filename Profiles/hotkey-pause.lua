MK_PAUSE = false

if
    IsLeftShiftKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftAltKeyDown()
    and not IsRightShiftKeyDown()
    and not IsRightControlKeyDown()
    and not IsRightAltKeyDown()
then
    MK_PAUSE = true
end

if MK_FRAME_LINES then
    local label = "(L Shift) Pause: "
    if MK_PAUSE then
        local text = label .. "\124cFFC70039Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFF3EC205Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
