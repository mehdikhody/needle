if
    MK_RAGING
    and not UnitAffectingCombat("player")
then
    if
        ni.unit.power("player") <= 70
        and ni.spell.cd(MK_BERSERKER_RAGE) == 0
    then
        ni.spell.cast(MK_BERSERKER_RAGE)
        return true
    end

    if
        ni.unit.power("player") <= 80
        and ni.spell.cd(MK_BLOODRAGE) == 0
    then
        ni.spell.cast(MK_BLOODRAGE)
        return true
    end
end
