-- SpellId: 64495
if
    UnitExists("pet")
    and not UnitIsDead("pet")
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
    and not ni.unit.buff("player", 64495)
then
    return true
end