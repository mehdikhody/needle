-- SpellId: MK_COLD_SNAP
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and not ni.unit.buff("player", MK_ICY_VEINS)
    and ni.spell.cd(MK_ICY_VEINS) > 20
then
    return true
end
