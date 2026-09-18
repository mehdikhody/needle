if
    not MK_AOE
    and ni.unit.buff("player", MK_KILLING_MACHINE)
    and ni.power.currentraw("player") >= 32
    and not (
        ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") > 8
        and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") > 8
        and GetRuneType(1) == 4
        and GetRuneType(2) == 4
        and ni.spell.cd(MK_OBLITERATE) == 0
    )
then
    ni.spell.cast(MK_FROST_STRIKE, "target")
    return true
end
