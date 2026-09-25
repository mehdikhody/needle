-- SpellId: MK_CONE_OF_COLD
if
    MK_AOE
    and GetUnitSpeed("player") > 0
    and ni.unit.distance("player", "target") <= 10
    and ni.unit.isfacing("player", "target", 90)
then
    return true
end
