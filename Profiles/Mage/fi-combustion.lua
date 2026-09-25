-- SpellId: MK_COMBUSTION
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and not ni.unit.buff("player", MK_COMBUSTION)
then
    return true
end
