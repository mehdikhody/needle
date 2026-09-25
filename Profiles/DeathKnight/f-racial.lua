if 
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
then
    -- 20572 - Blood Fury
    if
        IsSpellKnown(20572)
        and ni.spell.cd(20572) == 0
        and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
    then
        ni.spell.cast(20572)
        return true
    end

    -- 26297 - Berserking
    if
        IsSpellKnown(26297)
        and ni.spell.cd(26297) == 0
        and ni.unit.debuff("player", MK_SATED)
        and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
        and not ni.unit.buff("player", MK_BLOOD_LUST)
    then
        ni.spell.cast(26297)
        return true
    end
end