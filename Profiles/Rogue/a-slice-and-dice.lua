-- SpellId: MK_SLICE_AND_DICE
if
    ni.spell.valid("target", MK_MUTILATE, true, true)
    and not ni.unit.buff("player", MK_SLICE_AND_DICE)
then
    return true
end
