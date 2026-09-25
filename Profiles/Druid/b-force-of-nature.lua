-- SpellId: MK_FORCE_OF_NATURE
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    return true
end
