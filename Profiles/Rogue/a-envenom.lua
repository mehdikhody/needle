if
    (
        ni.player.powerraw("combopoints") == 5
        and ni.unit.buff("player", MK_COLD_BLOOD)
    ) or (
        ni.player.powerraw("combopoints") >= 4
        and not ni.unit.buff("player", MK_COLD_BLOOD)
        and ni.spell.cd(MK_COLD_BLOOD) > 0
    ) or (
        not MK_COOLDOWNS
        and ni.player.powerraw("combopoints") >= 4
    )
then
    ni.spell.cast(MK_ENVENOM, "target")
    return true
end
