-- SpellId: MK_DEATH_COIL
-- Target: target

-- spend before Runic Power caps
if UnitPower("player") >= UnitPowerMax("player") - 15 then
    return true
end
