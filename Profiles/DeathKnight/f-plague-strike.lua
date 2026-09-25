-- SpellId: MK_PLAGUE_STRIKE
if not ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player") then
    return true
end
