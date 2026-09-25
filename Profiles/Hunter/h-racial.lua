if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
    and not UnitChannelInfo("player")
    and not UnitCastingInfo("player")
then
    -- 20572 - Blood Fury
    if
        IsSpellKnown(20572)
        and ni.spell.cd(20572) == 0
    then
        ni.spell.cast(20572)
        return true
    end

    -- 26297 - Berserking
    if
        IsSpellKnown(26297)
        and ni.spell.cd(26297) == 0
        and ni.unit.debuff("player", 57724)
        and ni.unit.buff("player", MK_RAPID_FIRE)
        and not ni.unit.buff("player", 2825)
    then
        ni.spell.cast(26297)
        return true
    end
end