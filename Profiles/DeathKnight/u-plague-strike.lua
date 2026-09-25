-- SpellId: MK_PLAGUE_STRIKE
-- Target: target
if ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") < 2 then
    return true
end
