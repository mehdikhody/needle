if not MK_AOE_KEYDOWN then MK_AOE_KEYDOWN = 0 end
if not IsLeftAltKeyDown() then MK_AOE_KEYDOWN = 0 end
if MK_AOE == nil then MK_AOE = false end

if
    IsLeftAltKeyDown()
    and not IsRightControlKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsRightShiftKeyDown()
    and not IsRightAltKeyDown()
    and GetTime() - MK_AOE_KEYDOWN > 0.5
then
    MK_AOE_KEYDOWN = GetTime()
    MK_AOE = not MK_AOE
end

if MK_FRAME_LINES then
    local label = "(L Alt) AOE: "
    if MK_AOE then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
