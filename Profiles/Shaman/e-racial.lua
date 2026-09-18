if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_LIGHTNING_BOLT, true, true)
    and ni.unit.buff("player", 54758)
then
    -- 20572 - Blood Fury
    if
        IsSpellKnown(33697)
        and ni.spell.cd(33697) == 0
        and ni.spell.cd(MK_LAVA_BURST) == 0
    then
        ni.spell.cast(33697)
        return true
    end
end
