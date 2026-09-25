-- SpellId: MK_SEED_OF_CORRUPTION
-- Target: target
if
    MK_AOE
    and GetUnitSpeed("player") == 0
    and #ni.unit.enemiesinrange("target", 15) >= 3
    and not ni.unit.debuff("target", MK_SEED_OF_CORRUPTION, "player")
then
    return true
end
