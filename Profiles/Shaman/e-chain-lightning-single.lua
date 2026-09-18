if
    ni.unit.power("player") >= 50
    and ni.spell.cd(MK_LAVA_BURST) > 7
    and not ni.unit.buff("player", MK_ELEMENTAL_MASTERY)
then
    ni.spell.cast(MK_CHAIN_LIGHTNING, "target")
    return true
end
