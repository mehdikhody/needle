-- SpellId: MK_IMMOLATE
-- Target: mouseover
if
    MK_AOE
    and GetUnitSpeed("player") == 0
    and not UnitIsUnit("mouseover", "target")
    and not ni.unit.debuff("mouseover", MK_IMMOLATE, "player")
then
    return true
end
