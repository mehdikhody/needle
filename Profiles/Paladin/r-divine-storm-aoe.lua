-- SpellId: MK_DIVINE_STORM
if
    MK_AOE
    and ni.unit.inmelee("player", "target")
then
    return true
end
