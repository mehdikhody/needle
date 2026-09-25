-- SpellId: MK_FROST_STRIKE
if
    ni.spell.available(MK_FROST_STRIKE)
    and ni.spell.valid("target", MK_FROST_STRIKE, true, true)
then
    return true
end
