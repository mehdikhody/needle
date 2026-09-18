if
    UnitExists("target")
    and ni.unit.buff("player", 26888)
    and ni.unit.buff("player", MK_OVERKILL)
then
    ni.spell.cast(MK_MUTILATE, "target")
    return true
end
