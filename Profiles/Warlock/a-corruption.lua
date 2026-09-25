-- SpellId: MK_CORRUPTION
if not ni.unit.debuff("target", MK_CORRUPTION, "player") then
    MK_TakeSnapshot("target")
    return true
end
