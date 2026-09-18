local isExecutable = ni.unit.hp("target") <= 25
local isBoss = ni.unit.isboss("target")
local isEfficient = ni.unit.hpraw("target") > 10000
local isBossOrEfficient = isBoss or isEfficient

if isExecutable and isBossOrEfficient then
    ni.spell.cast(MK_DRAIN_SOUL, "target")
    return true
end
