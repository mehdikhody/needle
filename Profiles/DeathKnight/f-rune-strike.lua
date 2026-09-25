-- SpellId: MK_RUNE_STRIKE
if
    ni.spell.available(MK_RUNE_STRIKE)
    and ni.spell.valid("target", MK_RUNE_STRIKE, true, true)
then
    return true
end
