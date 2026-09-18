if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_BLOODTHIRST, true, true)
    and ni.unit.buff("player", MK_DEATH_WISH)
    and ni.spell.cd(MK_WHIRLWIND) == 0
then
    ni.spell.cast(MK_RECKLESSNESS)
    return true
end
