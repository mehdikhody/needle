-- SpellId: MK_HEROIC_STRIKE
if
    not MK_AOE
    and ni.unit.power("player") >= 60
    and ni.unit.inmelee("player", "target")
then
    return true
end
