-- SpellId: MK_DEVOURING_PLAGUE
-- Target: target
local ttd = ni.unit.ttd("target")

if
    not ni.unit.debuff("target", MK_DEVOURING_PLAGUE, "player")
    and (ni.unit.isboss("target") or ttd < 0 or ttd >= 12)
then
    return true
end
