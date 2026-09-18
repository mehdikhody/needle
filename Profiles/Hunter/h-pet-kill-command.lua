if
    MK_PET_CONTROL
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and UnitCanAttack("player", "target")
    and UnitCanAttack("pet", "target")
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
    and not ni.unit.buff("pet", MK_KILL_COMMAND_BUFF)
    and ni.spell.cd(MK_KILL_COMMAND) == 0
then
    ni.spell.cast(MK_KILL_COMMAND)
    return true
end