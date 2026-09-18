if
    ni.spell.available(MK_FROST_STRIKE)
    and ni.spell.valid("target", MK_FROST_STRIKE, true, true)
then
    ni.spell.cast(MK_FROST_STRIKE, "target")
end
return true
