-- SpellId: MK_MUTILATE
if
    UnitExists("target")
    and ni.unit.buff("player", 26888)
    and ni.unit.buff("player", MK_OVERKILL)
then
    return true
end
