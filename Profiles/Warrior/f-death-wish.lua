-- SpellId: MK_DEATH_WISH
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_BLOODTHIRST, true, true)
then
    return true
end
