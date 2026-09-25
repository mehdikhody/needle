-- SpellId: MK_RAKE
-- Target: target
local ttd = ni.unit.ttd("target")

if
    not ni.unit.debuff("target", MK_RAKE, "player")
    and (ttd < 0 or ttd >= 6)
then
    return true
end
