-- SpellId: MK_HUNGER_FOR_BLOOD
if
    ni.spell.valid("target", MK_MUTILATE, true, true)
    and not ni.unit.buff("player", MK_HUNGER_FOR_BLOOD)
then
    return true
end
