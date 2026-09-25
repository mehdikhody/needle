-- SpellId: MK_FERAL_SPIRIT
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    return true
end
