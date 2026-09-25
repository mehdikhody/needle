-- SpellId: MK_CHAIN_LIGHTNING
if
    ni.unit.power("player") >= 50
    and ni.spell.cd(MK_LAVA_BURST) > 7
    and not ni.unit.buff("player", MK_ELEMENTAL_MASTERY)
then
    return true
end
