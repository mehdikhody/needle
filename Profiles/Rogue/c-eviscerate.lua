-- SpellId: MK_EVISCERATE
-- Target: target
local cp = ni.player.powerraw("combopoints")
local ttd = ni.unit.ttd("target")
local dyingSoon = ttd >= 0 and ttd < 16
local capping = cp == 5 and UnitPower("player") >= UnitPowerMax("player") - 10

if
    cp >= 4
    and (not MK_AOE or ni.unit.buff("player", MK_BLADE_FLURRY))
    and (
        dyingSoon
        or capping
        or (
            ni.unit.debuffremaining("target", MK_RUPTURE, "player") > 6
            and ni.unit.buffremaining("player", MK_SLICE_AND_DICE) > 4
        )
    )
then
    return true
end
