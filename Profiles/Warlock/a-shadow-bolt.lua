-- SpellId: MK_SHADOW_BOLT
local hasDebuff = ni.unit.debuff("target", MK_SHADOW_MASTERY)
local hasTTL = ni.unit.ttd("target") >= 25

if not hasDebuff and hasTTL then
    return true
end
