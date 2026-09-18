if
    MK_ECLIPSE == "lunar"
    and not ni.unit.buff("player", 54758)
    and ni.spell.valid("target", MK_WRATH, true, true)
then
    if ni.player.slotusable(10) then
        ni.player.useinventoryitem(10)
        return true
    end
end
