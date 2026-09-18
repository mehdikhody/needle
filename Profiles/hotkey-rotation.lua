if not MK_ROTATION_KEYDOWN then MK_ROTATION_KEYDOWN = 0 end
if not IsLeftControlKeyDown() then MK_ROTATION_KEYDOWN = 0 end
if MK_ROTATION == nil then MK_ROTATION = true end

if
    IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsLeftAltKeyDown()
    and not IsRightShiftKeyDown()
    and not IsRightControlKeyDown()
    and not IsRightAltKeyDown()
    and GetTime() - MK_ROTATION_KEYDOWN > 0.5
then
    MK_ROTATION_KEYDOWN = GetTime()
    MK_ROTATION = not MK_ROTATION
end

if MK_FRAME_LINES then
    local label = "(L Ctrl) Rotation: "
    if MK_ROTATION then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
