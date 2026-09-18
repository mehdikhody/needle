if not ni.unit.debuff("target", MK_FLAME_SHOCK, "player") then
    ni.spell.cast(MK_FLAME_SHOCK, "target")
    return true
end
