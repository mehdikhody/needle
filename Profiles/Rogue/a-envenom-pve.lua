-- SpellId: MK_ENVENOM
local cp = ni.player.powerraw("combopoints")
local canRefresh = not ni.unit.buff("player", MK_ENVENOM)
    or UnitPower("player") >= UnitPowerMax("player") - 10

if
    (
        cp == 5
        and ni.unit.buff("player", MK_COLD_BLOOD)
    ) or (
        cp >= 4
        and canRefresh
        and not ni.unit.buff("player", MK_COLD_BLOOD)
        and (not MK_COOLDOWNS or ni.spell.cd(MK_COLD_BLOOD) > 0)
    )
then
    return true
end
