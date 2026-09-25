-- SpellId: MK_ICY_VEINS
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and not ni.unit.buff("player", MK_ICY_VEINS)
then
    return true
end
