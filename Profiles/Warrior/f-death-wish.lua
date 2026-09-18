if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_BLOODTHIRST, true, true)
then
    ni.spell.cast(MK_DEATH_WISH)
    return true
end
