if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_HEROIC_STRIKE, true, true)
    and not UnitChannelInfo("player")
    and not UnitCastingInfo("player")
then
    MK.UseHands()
end
