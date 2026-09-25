-- SpellId: MK_SLICE_AND_DICE
if
    ni.spell.valid("target", MK_SINISTER_STRIKE, true, true)
    and ni.unit.buffremaining("player", MK_SLICE_AND_DICE) < 2
then
    return true
end
