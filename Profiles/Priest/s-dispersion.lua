-- SpellId: MK_DISPERSION
if
    MK_COOLDOWNS
    and (ni.unit.hp("player") <= 20 or ni.unit.power("player") <= 10)
then
    return true
end
