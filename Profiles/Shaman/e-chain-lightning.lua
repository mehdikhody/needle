-- SpellId: MK_CHAIN_LIGHTNING
if
    MK_AOE
    and ni.unit.power("player") >= 20
then
    return true
end
