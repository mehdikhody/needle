MK_AOE = false

if
    IsLeftAltKeyDown()
    and not IsRightControlKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsRightShiftKeyDown()
    and not IsRightAltKeyDown()
then
    MK_AOE = true
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
