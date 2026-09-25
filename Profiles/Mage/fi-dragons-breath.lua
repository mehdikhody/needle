-- SpellId: MK_DRAGONS_BREATH
if
    MK_AOE
    and ni.unit.distance("player", "target") <= 8
    and ni.unit.isfacing("player", "target", 90)
then
    return true
end
