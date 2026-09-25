-- SpellId: MK_THUNDER_CLAP
if
    MK_AOE
    and #ni.unit.enemiesinrange("player", 8) >= 3
then
    return true
end
