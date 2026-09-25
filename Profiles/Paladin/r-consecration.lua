-- SpellId: MK_CONSECRATION
if
    ni.unit.power("player") >= 40
    and GetUnitSpeed("player") == 0
    and ni.unit.inmelee("player", "target")
then
    return true
end
