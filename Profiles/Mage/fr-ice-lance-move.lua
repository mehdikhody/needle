-- SpellId: MK_ICE_LANCE
-- Target: target
local ttd = ni.unit.ttd("target")

if GetUnitSpeed("player") > 0 or (ttd >= 0 and ttd < 3) then
    return true
end
