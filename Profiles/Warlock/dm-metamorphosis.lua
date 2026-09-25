-- SpellId: MK_METAMORPHOSIS
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    return true
end
