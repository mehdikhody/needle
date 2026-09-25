-- SpellId: MK_SCORCH
-- Target: target
if
    GetUnitSpeed("player") == 0
    and MK.TalentRank(MK_IMPROVED_SCORCH) > 0
    and ni.unit.debuffremaining("target", MK_IMPROVED_SCORCH) < 4
    and not ni.unit.debuff("target", MK_WINTERS_CHILL)
    and not ni.unit.debuff("target", MK_SHADOW_MASTERY)
then
    return true
end
