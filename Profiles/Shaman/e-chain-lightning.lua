if
    MK_AOE
    and ni.unit.power("player") >= 20
then
    ni.spell.cast(MK_CHAIN_LIGHTNING, "target")
    return true
end
