if 
    GetUnitSpeed("player") == 0
    and ni.spell.available(MK_STEADY_SHOT)
then
    ni.spell.cast(MK_STEADY_SHOT, "target")
    return true
end