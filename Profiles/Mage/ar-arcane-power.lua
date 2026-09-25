-- SpellId: MK_ARCANE_POWER
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    return true
end
