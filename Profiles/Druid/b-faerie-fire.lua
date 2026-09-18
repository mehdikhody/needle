if
    ni.unit.isboss("target")
    and not ni.unit.debuff("target", MK_FAERIE_FIRE)
then
    ni.spell.cast(MK_FAERIE_FIRE, "target")
    return true
end
