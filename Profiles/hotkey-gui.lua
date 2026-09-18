if not MK_GUI_KEYDOWN then MK_GUI_KEYDOWN = 0 end
if not IsRightShiftKeyDown() or not IsLeftShiftKeyDown() then
    MK_GUI_KEYDOWN = 0
end

if MK_GUI == nil then MK_GUI = true end

if
    IsLeftShiftKeyDown()
    and IsRightShiftKeyDown()
    and not IsRightControlKeyDown()
    and not IsRightAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftAltKeyDown()
    and GetTime() - MK_GUI_KEYDOWN > 0.5
then
    MK_GUI_KEYDOWN = GetTime()
    MK_GUI = not MK_GUI
    if MK_GUI then MK_FRAME_BASE_LAYER:Show() end
    if not MK_GUI then MK_FRAME_BASE_LAYER:Hide() end
end

if MK_FRAME_LINES then
    local label = "(LR Shift) Toggle Frame"
    table.insert(MK_FRAME_LINES, label)
end
