if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_LIGHTNING_BOLT, true, true)
    and not ni.unit.buff("player", 54758)
then
    if ni.player.slotusable(10) then
        ni.player.useinventoryitem(10)
    end
end
