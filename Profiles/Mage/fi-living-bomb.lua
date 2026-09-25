-- SpellId: MK_LIVING_BOMB
-- Target: target
local ttd = ni.unit.ttd("target")

if
    not ni.unit.debuff("target", MK_LIVING_BOMB, "player")
    and (ttd < 0 or ttd >= 12)
then
    return true
end
