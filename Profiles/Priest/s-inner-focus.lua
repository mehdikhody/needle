-- SpellId: MK_INNER_FOCUS
if
    MK_COOLDOWNS
    and MK_USE_MIND_BLAST
    and ni.unit.isboss("target")
    and ni.spell.cd(MK_MIND_BLAST) == 0
    and ni.spell.valid("target", MK_MIND_BLAST, true, true)
then
    return true
end
