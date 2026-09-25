-- SpellId: MK_MULTI_SHOT
if 
    MK_SHOT == "Multi"
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
then
    return true
end