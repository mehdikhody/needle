-- SpellId: MK_ARCANE_EXPLOSION
if
    MK_AOE
    and GetUnitSpeed("player") > 0
    and #ni.unit.enemiesinrange("player", 10) >= 2
then
    return true
end
