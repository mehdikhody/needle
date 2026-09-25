-- SpellId: MK_DRAIN_SOUL
local isExecutable = ni.unit.hp("target") <= 25
local isBoss = ni.unit.isboss("target")
local isEfficient = ni.unit.hpraw("target") > 10000
local isBossOrEfficient = isBoss or isEfficient

if isExecutable and isBossOrEfficient then
    return true
end
