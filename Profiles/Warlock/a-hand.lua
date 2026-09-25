if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_SHADOW_BOLT, true, true)
then
    MK.UseHands()
end
