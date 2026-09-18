if
    (
        not ni.unit.buff("player", MK_HUNGER_FOR_BLOOD)
        or ni.unit.buffremaining("player", MK_HUNGER_FOR_BLOOD) <= 5
    )
    and not ni.unit.debuff("target", MK_GARROTE)
    and not ni.unit.debuff("target", MK_RUPTURE)
    and not ni.unit.debuff("target", MK_REND)
    and not ni.unit.debuff("target", MK_DEEP_WOUNDS)
    and not ni.unit.debuff("target", MK_RAKE)
    and not ni.unit.debuff("target", MK_RIP)
    and not ni.unit.debuff("target", MK_LACERATE)
then
    ni.spell.cast(MK_RUPTURE, "target")
    return true
end
