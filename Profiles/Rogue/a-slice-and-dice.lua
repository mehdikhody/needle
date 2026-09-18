if
    ni.spell.valid("target", MK_MUTILATE, true, true)
    and not ni.unit.buff("player", MK_SLICE_AND_DICE)
then
    ni.spell.cast(MK_SLICE_AND_DICE)
    return true
end
