-- SpellId: MK_ICY_TOUCH
-- Target: target
if ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") < 2 then
    return true
end
