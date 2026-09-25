-- SpellId: MK_BLADESTORM
if
    MK_AOE
    and #ni.unit.enemiesinrange("player", 8) >= 3
then
    return true
end
