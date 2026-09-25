-- SpellId: MK_PESTILENCE
-- Target: target
if MK_BLOOD_PESTILENCE_READY == nil then
    MK_BLOOD_PESTILENCE_READY = true
end

if
    MK_AOE
    and MK_BLOOD_PESTILENCE_READY
    and ni.unit.debuff("target", MK_FROST_FEVER, "player")
    and ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player")
    and #ni.unit.enemiesinrange("target", 10) > 1
then
    MK_BLOOD_PESTILENCE_READY = false
    ni.delayfor(10, function()
        MK_BLOOD_PESTILENCE_READY = true
    end)
    return true
end
