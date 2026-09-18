if ni.unit.debuff("target", MK_FLAME_SHOCK, "player") then
    ni.spell.cast(MK_LAVA_BURST, "target")
    return true
end
