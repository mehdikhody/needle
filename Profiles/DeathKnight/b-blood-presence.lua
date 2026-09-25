-- SpellId: MK_BLOOD_PRESENCE
if
    not ni.unit.buff("player", MK_FROST_PRESENCE)
    and not ni.unit.buff("player", MK_BLOOD_PRESENCE)
then
    return true
end
