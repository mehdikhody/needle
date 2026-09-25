if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_VAMPIRIC_TOUCH, true, true)
then
    MK.UseHands()
end
