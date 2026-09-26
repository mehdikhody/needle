-- SpellId: MK_BESTIAL_WRATH
if
    MK_COOLDOWNS
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_MULTI_SHOT, true, true)
then
    return true
end
