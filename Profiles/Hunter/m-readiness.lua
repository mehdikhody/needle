if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.cd(MK_RAPID_FIRE) > 20
    and ni.spell.cd(MK_KILL_COMMAND) > 0
    and ni.spell.cd(MK_EXPLOSIVE_TRAP) > 10
    and ni.spell.cd(MK_CHIMERA_SHOT) > 7
then
    ni.spell.cast(MK_READINESS)
    return true
end