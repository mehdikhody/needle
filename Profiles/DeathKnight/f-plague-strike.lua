if not ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player") then
    ni.spell.cast(MK_PLAGUE_STRIKE, "target")
    return true
end
