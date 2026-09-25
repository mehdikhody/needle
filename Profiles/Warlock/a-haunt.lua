-- SpellId: MK_HAUNT
local HB = ni.unit.debuff("target", MK_HAUNT, "player")
local hasTTL = ni.unit.ttd("target") >= 5

-- Refresh lead time scales with distance (old profile used 8/10/15/20/25 yard bands)
local HBT = 3
local distance = ni.unit.distance("player", "target")
if distance >= 8 then HBT = 4 end
if distance >= 10 then HBT = 4.5 end
if distance >= 15 then HBT = 5 end
if distance >= 20 then HBT = 5.5 end
if distance >= 25 then HBT = 6 end

if
    (not HB and hasTTL) or
    (
        HB
        and ni.unit.debuffremaining("target", MK_HAUNT, "player") <= HBT
        and hasTTL
    )
then
    return true
end
