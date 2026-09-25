-- SpellId: MK_VAMPIRIC_TOUCH
-- Target: mouseover
if
    MK_AOE
    and GetUnitSpeed("player") == 0
    and not UnitIsUnit("mouseover", "target")
    and ni.unit.debuffremaining("mouseover", MK_VAMPIRIC_TOUCH, "player") <= 0.8
then
    return true
end
