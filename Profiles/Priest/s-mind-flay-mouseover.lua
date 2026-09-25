-- SpellId: MK_MIND_FLAY
-- Target: mouseover
if
    MK_AOE
    and GetUnitSpeed("player") == 0
    and not UnitIsUnit("mouseover", "target")
    and ni.unit.debuff("mouseover", MK_SHADOW_WORD_PAIN, "player")
    and ni.unit.debuffremaining("mouseover", MK_SHADOW_WORD_PAIN, "player") <= 4
then
    return true
end
