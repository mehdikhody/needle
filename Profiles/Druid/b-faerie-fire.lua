-- SpellId: MK_FAERIE_FIRE
if
    ni.unit.isboss("target")
    and not ni.unit.debuff("target", MK_FAERIE_FIRE)
then
    return true
end
