-- SpellId: MK_IMMOLATION_AURA
if
    ni.unit.buff("player", MK_METAMORPHOSIS)
    and ni.unit.distance("player", "target") <= 8
then
    return true
end
