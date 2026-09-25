if 
    MK_INTERRUPT
    and ni.spell.shouldinterrupt("target") 
then
    ni.spell.castinterrupt("target")
    return true
end