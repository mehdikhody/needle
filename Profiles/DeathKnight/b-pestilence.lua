-- SpellId: MK_PESTILENCE
-- Target: target
if
    ni.player.hasglyph(63334)
    and ni.unit.debuff("target", MK_FROST_FEVER, "player")
    and ni.unit.debuff("target", MK_BLOOD_PLAGUE, "player")
    and math.min(
        ni.unit.debuffremaining("target", MK_FROST_FEVER, "player"),
        ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player")
    ) <= 3
then
    return true
end
