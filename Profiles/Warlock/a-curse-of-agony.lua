if
    not ni.unit.debuff("target", MK_CURSE_OF_THE_ELEMENTS, "player")
    and not ni.unit.debuff("target", MK_CURSE_OF_DOOM, "player")
    and not ni.unit.debuff("target", MK_CURSE_OF_AGONY, "player")
    and ni.unit.ttd("target") >= 5
then
    ni.spell.cast(MK_CURSE_OF_AGONY, "target")
    return true
end
