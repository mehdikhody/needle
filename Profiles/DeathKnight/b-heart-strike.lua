-- SpellId: MK_HEART_STRIKE
-- Target: target
if not (MK_AOE and #ni.unit.enemiesinrange("target", 10) >= 4) then
    return true
end
