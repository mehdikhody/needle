local hasDebuff = ni.unit.debuff("target", MK_UNSTABLE_AFFLICTION, "player")
local hasTTL = ni.unit.ttd("target") >= 10
local hasMinimumHP = ni.unit.hpraw("target") >= 10000

if not hasDebuff and hasTTL and hasMinimumHP then
    ni.spell.cast(MK_UNSTABLE_AFFLICTION, "target")
    return true
end
