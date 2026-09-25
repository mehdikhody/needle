-- SpellId: MK_SILENCING_SHOT
-- Target: target
if
    not MK.Include(UnitName("target"), MK.YOGG_TARGETS)
    and (
        UnitName("target") ~= "Blistering Zombie"
        or UnitCastingInfo("target") == GetSpellInfo(70744) -- Acid Burst
    )
then
    return true
end
