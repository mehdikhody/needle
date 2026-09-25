-- SpellId: MK_REND
-- Target: target
local ttd = ni.unit.ttd("target")

if
    not ni.unit.debuff("target", MK_REND, "player")
    and (ttd < 0 or ttd >= 9)
then
    return true
end
