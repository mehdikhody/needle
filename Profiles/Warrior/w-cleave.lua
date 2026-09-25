if
    MK_AOE
    and ni.unit.power("player") >= 30
    and ni.spell.valid("target", MK_BLOODTHIRST, true, true)
then
    ni.spell.cast(MK_CLEAVE)
    return true
end
