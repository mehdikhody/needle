-- SpellId: MK_FEROCIOUS_BITE
-- Target: target
local ttd = ni.unit.ttd("target")

if
    ni.player.powerraw("combopoints") == 5
    and (
        (ttd >= 0 and ttd < 10)
        or (
            ni.unit.debuffremaining("target", MK_RIP, "player") > 8
            and ni.unit.buffremaining("player", MK_SAVAGE_ROAR) > 8
        )
    )
then
    return true
end
