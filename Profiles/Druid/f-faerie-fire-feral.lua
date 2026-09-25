-- SpellId: MK_FAERIE_FIRE_FERAL
-- Target: target
if
    ni.unit.isboss("target")
    and not ni.unit.debuff("target", MK_FAERIE_FIRE)
    and not ni.unit.debuff("target", MK_FAERIE_FIRE_FERAL)
then
    return true
end
