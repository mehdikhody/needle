if MK_SHOT == nil or not IsSpellKnown(MK_AIMED_SHOT) then
    MK_SHOT = "Multi"
end

if IsSpellKnown(MK_AIMED_SHOT) then
    local pressed, label = MK.BindPress("shot")
    if pressed then
        MK_SHOT = MK_SHOT == "Multi" and "Aimed" or "Multi"
    end

    MK.Line("(" .. label .. ") Shot: " .. MK_SHOT)
end
