-- SpellId: MK_MANGLE_CAT
-- Target: target
if
    not ni.unit.debuff("target", MK_MANGLE_CAT)
    and not ni.unit.debuff("target", MK_MANGLE_BEAR)
    and not ni.unit.debuff("target", MK_TRAUMA)
then
    return true
end
