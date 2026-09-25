if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.distance("player", "target") <= 35
    and not UnitChannelInfo("player")
    and not UnitCastingInfo("player")
then
    MK.UseHands()
end
