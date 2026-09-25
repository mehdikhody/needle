-- SpellId: MK_KILLING_SPREE
-- Target: target
if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and not ni.unit.buff("player", MK_ADRENALINE_RUSH)
then
    return true
end
