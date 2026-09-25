-- SpellId: MK_CORRUPTION
-- Target: mouseover
if
    MK_AOE
    and not UnitIsUnit("mouseover", "target")
    and not ni.unit.debuff("mouseover", MK_CORRUPTION, "player")
then
    return true
end
