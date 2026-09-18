if
    ni.spell.available(MK_SILENCING_SHOT)
    and ni.spell.cd(MK_SILENCING_SHOT) == 0
    and ni.spell.valid("target", MK_SILENCING_SHOT, true, true)
    and MK_IsUsableSpell(MK_SILENCING_SHOT)
    and not MK_Include(UnitName("target"), {
        "Yogg-Saron",
        "Immortal Guardian",
        "Unknown"
    })
then
    ni.spell.cast(MK_SILENCING_SHOT, "target")
    return true
end