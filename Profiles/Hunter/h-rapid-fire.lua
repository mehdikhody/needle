-- SpellId: MK_RAPID_FIRE
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.power("player") >= 20
    and ni.spell.cd(MK_RAPID_FIRE) == 0
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
    and not ni.unit.buff("player", MK_RAPID_FIRE)
then
    return true
end