-- SpellId: MK_RIP
-- Target: target
local ttd = ni.unit.ttd("target")

if
    ni.player.powerraw("combopoints") == 5
    and not ni.unit.debuff("target", MK_RIP, "player")
    and (ttd < 0 or ttd >= 10)
then
    return true
end
