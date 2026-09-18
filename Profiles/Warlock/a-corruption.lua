if not ni.unit.debuff("target", MK_CORRUPTION, "player") then
    MK_TakeSnapshot("target")
    ni.spell.cast(MK_CORRUPTION, "target")
    return true
end
