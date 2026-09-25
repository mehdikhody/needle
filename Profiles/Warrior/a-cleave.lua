-- SpellId: MK_CLEAVE
if
    MK_AOE
    and ni.unit.power("player") >= 60
    and ni.unit.inmelee("player", "target")
then
    return true
end
