if MK_ECLIPSE == nil then MK_ECLIPSE = "solar" end
if MK_SOULAR_TIMER == nil then MK_SOULAR_TIMER = 0 end
if MK_LUNAR_TIMER == nil then MK_LUNAR_TIMER = 0 end
if not UnitAffectingCombat("player") then MK_ECLIPSE = "solar" end

if
    MK_ECLIPSE == "solar"
    and ni.unit.buff("player", MK_LUNAR)
then
    MK_ECLIPSE = "lunar"
    MK_LUNAR_TIMER = GetTime()
end

if
    (MK_ECLIPSE == "lunar" or MK_SOULAR_TIMER == 0)
    and ni.unit.buff("player", MK_SOLAR)
then
    MK_ECLIPSE = "solar"
    MK_SOULAR_TIMER = GetTime()
end
