if not ni.unit.debuff("target", MK_EXPLOSIVE_SHOT, "player") then
    ni.spell.cast(MK_EXPLOSIVE_SHOT, "target")
    return true
end
