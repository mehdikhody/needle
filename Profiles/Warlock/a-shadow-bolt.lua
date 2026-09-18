local hasDebuff = ni.unit.debuff("target", MK_SHADOW_MASTERY)
local hasTTL = ni.unit.ttd("target") >= 25

if not hasDebuff and hasTTL then
    ni.spell.cast(MK_SHADOW_BOLT, "target")
    return true
end
