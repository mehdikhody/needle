if
    not ni.unit.debuff("target", MK_SERPENT_STING, "player")
    and not ni.unit.debuff("target", MK_VIPER_STING, "player")
    and UnitName("target") ~= "Amanitar"
then
    ni.spell.cast(MK_SERPENT_STING, "target")
    return true
end