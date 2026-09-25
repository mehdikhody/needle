-- SpellId: MK_SHADOWFLAME
if
    MK_AOE
    and ni.unit.distance("player", "target") <= 10
    and ni.unit.isfacing("player", "target", 90)
then
    return true
end
