if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_HEROIC_STRIKE, true, true)
    and not UnitChannelInfo("player")
    and not UnitCastingInfo("player")
then
    -- 20572 - Blood Fury
    if
        IsSpellKnown(20572)
        and ni.spell.cd(20572) == 0
        and ni.spell.cd(MK_DEATH_WISH) == 0
    then
        ni.spell.cast(20572)
        return true
    end
end
