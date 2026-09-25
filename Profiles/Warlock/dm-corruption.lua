-- SpellId: MK_CORRUPTION
-- Target: target
local ttd = ni.unit.ttd("target")

if
    not ni.unit.debuff("target", MK_CORRUPTION, "player")
    and (ttd < 0 or ttd >= 18)
then
    return true
end
