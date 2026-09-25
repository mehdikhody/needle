-- SpellId: MK_BLADESTORM
if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and ni.unit.power("player") < 30
then
    return true
end
