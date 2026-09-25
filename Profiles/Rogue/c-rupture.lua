-- SpellId: MK_RUPTURE
-- Target: target
local ttd = ni.unit.ttd("target")

if
    ni.player.powerraw("combopoints") == 5
    and ni.unit.debuffremaining("target", MK_RUPTURE, "player") < 2
    and (ttd < 0 or ttd >= 16)
then
    return true
end
