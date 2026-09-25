-- SpellId: MK_MIND_SEAR
-- Target: target
if
    MK_AOE
    and GetUnitSpeed("player") == 0
    and #ni.unit.enemiesinrange("target", 10) >= 4
then
    return true
end
