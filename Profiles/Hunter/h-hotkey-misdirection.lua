if MK_MD == nil then MK_MD = false end
if not MK_MD_KEYDOWN then MK_MD_KEYDOWN = 0 end
if not IsRightShiftKeyDown() or not IsRightAltKeyDown() then MK_MD_KEYDOWN = 0 end

if
    IsRightShiftKeyDown()
    and IsRightAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsLeftAltKeyDown()
    and not IsRightControlKeyDown()
    and GetTime() - MK_MD_KEYDOWN > 0.5
then
    MK_MD_KEYDOWN = GetTime()
    MK_MD = not MK_MD
end

if
    MK_FRAME_LINES
    and UnitExists("focus")
    and UnitIsPlayer("focus")
    and UnitIsFriend("player", "focus")
    and not UnitIsUnit("player", "focus")
then
    local label = "(R Shift + R Alt) Misdirection: "
    if MK_MD then
        local text = label .. "\124cFF3EC205Enabled\124r"
        table.insert(MK_FRAME_LINES, text)
    else
        local text = label .. "\124cFFC70039Disabled\124r"
        table.insert(MK_FRAME_LINES, text)
    end
end
