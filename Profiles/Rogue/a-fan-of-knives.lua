-- SpellId: MK_FAN_OF_KNIVES
if
    MK_AOE
    and ni.player.powerraw("combopoints") >= 4
    and ni.unit.buffremaining("player", MK_SLICE_AND_DICE) > 5
    and ni.spell.valid("target", MK_MUTILATE, true, true)
then
    return true
end
