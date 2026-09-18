if not MK_PET_CONTROL_KEYDOWN then MK_PET_CONTROL_KEYDOWN = 0 end
if not IsRightControlKeyDown() then MK_PET_CONTROL_KEYDOWN = 0 end
if MK_PET_CONTROL == nil then MK_PET_CONTROL = true end

if
    IsRightControlKeyDown()
    and not IsRightAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsLeftAltKeyDown()
    and not IsRightShiftKeyDown()
    and GetTime() - MK_PET_CONTROL_KEYDOWN > 0.5
then
    MK_PET_CONTROL_KEYDOWN = GetTime()
    MK_PET_CONTROL = not MK_PET_CONTROL
end

if MK_FRAME_LINES and HasPetSpells() then
    local label = "(R Ctrl) Pet Control: "
    if MK_PET_CONTROL then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
