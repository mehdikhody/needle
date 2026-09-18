if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_HEROIC_STRIKE, true, true)
    and ni.player.slotusable(10)
    and not ni.unit.buff("player", 54758)
    and not UnitChannelInfo("player")
    and not UnitCastingInfo("player")
then
    ni.player.useinventoryitem(10)
    return true
end
