if not MK_INTERRUPT_KEYDOWN then MK_INTERRUPT_KEYDOWN = 0 end
if not IsRightShiftKeyDown() or not IsRightAltKeyDown() then
    MK_INTERRUPT_KEYDOWN = 0
end

if MK_INTERRUPT == nil then MK_INTERRUPT = true end

if
    IsRightAltKeyDown()
    and IsRightShiftKeyDown()
    and not IsLeftAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsRightControlKeyDown()
    and GetTime() - MK_INTERRUPT_KEYDOWN > 0.5
then
    MK_INTERRUPT_KEYDOWN = GetTime()
    MK_INTERRUPT = not MK_INTERRUPT
end

if MK_FRAME_LINES then
    local label = "(R Shift + R Alt) Interrupt: "
    if MK_INTERRUPT then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
