if
    ni.unit.isboss("target")
    and ni.unit.power("player") <= 20
    and ni.unit.hp("target") > 20
    and select(2, UnitPowerType("target")) == "MANA"
    and UnitPower("target") > 250000
    and ni.spell.valid("target", MK_CHIMERA_SHOT, true, true)
    and ni.spell.cd(MK_CHIMERA_SHOT) == 0
then
    ni.spell.cast(MK_VIPER_STING, "target")
    return true
end