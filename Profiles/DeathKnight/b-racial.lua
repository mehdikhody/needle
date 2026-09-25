if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and (ni.unit.buff("player", MK_HYSTERIA) or not IsSpellKnown(MK_HYSTERIA))
then
    if
        IsSpellKnown(20572)
        and ni.spell.cd(20572) == 0
    then
        ni.spell.cast(20572)
        return true
    end

    if
        IsSpellKnown(26297)
        and ni.spell.cd(26297) == 0
        and ni.unit.debuff("player", MK_SATED)
        and not ni.unit.buff("player", MK_BLOOD_LUST)
    then
        ni.spell.cast(26297)
        return true
    end
end
