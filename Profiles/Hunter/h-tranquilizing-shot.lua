if
    not MK_Include(UnitName("target"), {
        "Acidmaw",
        "Dreadscale"
    })
    and (
        ni.unit.buff("target", "Enrage")
        or ni.unit.buff("target", "Sara's Anger")
    )
then
    ni.spell.cast(MK_TRANQUILIZING_SHOT, "target")
    return true
end