if
    ni.spell.available(MK_RUNE_STRIKE)
    and ni.spell.valid("target", MK_RUNE_STRIKE, true, true)
then
    ni.spell.cast(MK_RUNE_STRIKE, "target")
end
return true
