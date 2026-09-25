-- SpellId: MK_BLADE_FLURRY
if
    (MK_COOLDOWNS or MK_AOE)
    and ni.unit.inmelee("player", "target")
then
    return true
end
