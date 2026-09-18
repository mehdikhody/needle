if not ni.unit.debuff("target", MK_FROST_FEVER, "player") then
    ni.spell.cast(MK_ICY_TOUCH, "target")
    return true
end
