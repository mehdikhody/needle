-- SpellId: MK_EVOCATION
if
    GetUnitSpeed("player") == 0
    and ni.unit.power("player") <= 10
then
    return true
end
