-- SpellId: MK_ELEMENTAL_MASTERY
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.cd(MK_LAVA_BURST) == 0
    and ni.spell.valid("target", MK_LIGHTNING_BOLT, true, true)
    and ni.unit.buff("player", 54758)
then
    return true
end
