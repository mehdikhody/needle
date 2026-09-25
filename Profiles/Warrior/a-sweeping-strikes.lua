-- SpellId: MK_SWEEPING_STRIKES
if
    MK_AOE
    and ni.unit.inmelee("player", "target")
then
    return true
end
