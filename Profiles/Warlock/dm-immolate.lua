-- SpellId: MK_IMMOLATE
-- Target: target
local ttd = ni.unit.ttd("target")

if
    GetUnitSpeed("player") == 0
    and not ni.unit.debuff("target", MK_IMMOLATE, "player")
    and (ttd < 0 or ttd >= 15)
then
    return true
end
