-- SpellId: MK_PESTILENCE
-- Target: target
if
    MK_AOE
    and ni.unit.debuff("target", MK_FROST_FEVER, "player")
    and ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player")
    and #ni.unit.enemiesinrange("target", 10) > 1
then
    return true
end
