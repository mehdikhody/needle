-- SpellId: MK_SERPENT_STING
if
    not ni.unit.debuff("target", MK_SERPENT_STING, "player")
    and not ni.unit.debuff("target", MK_VIPER_STING, "player")
    and UnitName("target") ~= "Amanitar"
then
    return true
end