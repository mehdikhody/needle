if 
    MK_COOLDOWNS
    and ni.player.slotusable(10)
    and ni.unit.inmelee("player", "target")
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
    and not ni.unit.buff("player", 54758)
then
    ni.player.useinventoryitem(10)
end