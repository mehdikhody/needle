-- SpellId: MK_SHADOW_WORD_PAIN
-- Target: mouseover
if
    MK_AOE
    and not UnitIsUnit("mouseover", "target")
    and not ni.unit.debuff("mouseover", MK_SHADOW_WORD_PAIN, "player")
then
    return true
end
