-- SpellId: MK_SHADOW_WORD_PAIN
-- Target: target
if not ni.unit.debuff("target", MK_SHADOW_WORD_PAIN, "player") then
    return true
end
