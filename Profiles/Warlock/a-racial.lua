if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_SHADOW_BOLT, true, true)
    and ni.unit.buff("player", 54758)
then
    -- Blood Fury (orc racial, checked by the old profile)
    if
        IsSpellKnown(33702)
        and ni.spell.cd(33702) == 0
    then
        ni.spell.cast(33702)
        return true
    end
end
