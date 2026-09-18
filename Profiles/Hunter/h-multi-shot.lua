if 
    MK_SHOT == "Multi"
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
then
    ni.spell.cast(MK_MULTI_SHOT, "target")
    return true
end