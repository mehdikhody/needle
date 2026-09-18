if
    MK_COOLDOWNS
    and not MK_AOE
    and ni.unit.isboss("target")
    and not ni.unit.buff("player", MK_OVERKILL)
then
    ni.spell.cast(MK_VANISH)
    return true
end
