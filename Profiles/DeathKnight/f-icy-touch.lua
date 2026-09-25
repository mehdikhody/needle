-- SpellId: MK_ICY_TOUCH
if not ni.unit.debuff("target", MK_FROST_FEVER, "player") then
    return true
end
