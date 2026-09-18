if
    MK_AOE
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
then
    ni.spell.cast(MK_MULTI_SHOT, "target")
    return true
end
