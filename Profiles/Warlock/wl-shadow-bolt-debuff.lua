-- SpellId: MK_SHADOW_BOLT
-- Target: target
if
    GetUnitSpeed("player") == 0
    and ni.unit.isboss("target")
    and MK.TalentRank(MK_IMPROVED_SHADOW_BOLT) > 0
    and not ni.unit.debuff("target", MK_SHADOW_MASTERY)
    and not ni.unit.debuff("target", MK_IMPROVED_SCORCH)
then
    return true
end
