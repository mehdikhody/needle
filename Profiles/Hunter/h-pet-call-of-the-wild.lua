-- SpellId: MK_CALL_OF_THE_WILD
if
    MK_COOLDOWNS
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and ni.unit.isboss("target")
    and ni.unit.power("player") >= 20
    and ni.spell.valid("target", MK_STEADY_SHOT, true, true)
    and not ni.unit.buff("player", MK_CALL_OF_THE_WILD)
    and ni.spell.cd(MK_CALL_OF_THE_WILD) == 0
then
    return true
end