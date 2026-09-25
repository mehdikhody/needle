-- SpellId: MK_SILENCING_SHOT
-- Target: target
if
    not MK_Include(UnitName("target"), {
        "Yogg-Saron",
        "Immortal Guardian",
        "Unknown"
    })
    and (
        UnitName("target") ~= "Blistering Zombie"
        or UnitCastingInfo("target") == GetSpellInfo(70744) -- Acid Burst
    )
then
    return true
end
