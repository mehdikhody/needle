if MK_SHOT == nil then MK_SHOT = "Multi" end
if not MK_SHOT_KEYDOWN then MK_SHOT_KEYDOWN = 0 end
if not IsLeftAltKeyDown() or not IsRightShiftKeyDown() then MK_SHOT_KEYDOWN = 0 end

if
    IsLeftAltKeyDown()
    and IsRightShiftKeyDown()
    and not IsRightAltKeyDown()
    and not IsLeftControlKeyDown()
    and not IsLeftShiftKeyDown()
    and not IsRightControlKeyDown()
    and GetTime() - MK_SHOT_KEYDOWN > 0.5
then
    MK_SHOT_KEYDOWN = GetTime()
    if MK_SHOT == "Multi" then
        MK_SHOT = "Aimed"
    else
        MK_SHOT = "Multi"
    end
end

if not IsSpellKnown(MK_AIMED_SHOT) then
    MK_SHOT = "Multi"
end

if MK_FRAME_LINES and IsSpellKnown(MK_AIMED_SHOT) then
    local label = "(R Shift + L Alt) Shot: "
    table.insert(MK_FRAME_LINES, label .. " " .. MK_SHOT)
end
