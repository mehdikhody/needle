-- SpellId: MK_VANISH
if
    MK_COOLDOWNS
    and not MK_AOE
    and ni.unit.isboss("target")
    and not ni.unit.buff("player", MK_OVERKILL)
then
    return true
end
