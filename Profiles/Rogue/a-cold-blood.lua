-- SpellId: MK_COLD_BLOOD
if
    MK_COOLDOWNS
    and not MK_AOE
    and ni.unit.isboss("target")
    and ni.player.powerraw("combopoints") == 5
    and ni.unit.buff("player", MK_SLICE_AND_DICE)
    and ni.unit.buff("player", MK_HUNGER_FOR_BLOOD)
    and ni.spell.valid("target", MK_MUTILATE, true, true)
    and not ni.unit.buff("player", MK_ENVENOM)
then
    return true
end
