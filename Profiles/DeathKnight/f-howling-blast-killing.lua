if
    MK_AOE
    and ni.unit.buff("player", MK_KILLING_MACHINE)
    and not (
        ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") > 8
        and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") > 8
        and GetRuneType(1) == 4
        and GetRuneType(2) == 4
        and ni.spell.cd(MK_OBLITERATE) == 0
    )
then
    local enemies = ni.unit.enemiesinrange("target", 10)
    if
        #enemies > 1
        and ni.spell.cd(MK_HOWLING_BLAST) == 0
    then
        ni.spell.cast(MK_HOWLING_BLAST, "target")
        return true
    end
end
