if
    not MK_ROTATION
    or MK_PAUSE
    or ni.spell.gcd()
    or ni.unit.ismounted("player")
    or UnitIsDeadOrGhost("player")
    or UnitHasVehicleUI("player")
then
    if not MK_ROTATION or MK_PAUSE then
        ni.player.runtext("/stopattack")
    end
    return true
end
