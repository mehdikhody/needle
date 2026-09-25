-- SpellId: MK_DEATH_COIL
-- Target: target
local drwSoon = MK_COOLDOWNS
    and ni.unit.isboss("target")
    and IsSpellKnown(MK_DANCING_RUNE_WEAPON)
    and ni.spell.cd(MK_DANCING_RUNE_WEAPON) < 10

if not drwSoon or UnitPower("player") >= UnitPowerMax("player") - 15 then
    return true
end
