-- SpellId: MK_FIRE_BLAST
-- Target: target
local ttd = ni.unit.ttd("target")

if GetUnitSpeed("player") > 0 or (ttd >= 0 and ttd < 3) then
    return true
end
