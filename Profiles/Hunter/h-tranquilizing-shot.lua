-- SpellId: MK_TRANQUILIZING_SHOT
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
    return true
end