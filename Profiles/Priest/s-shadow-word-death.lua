-- SpellId: MK_SHADOW_WORD_DEATH
-- Target: target
local ttd = ni.unit.ttd("target")

if ni.unit.hp("target") <= 1 or (ttd >= 0 and ttd < 2) then
    return true
end
