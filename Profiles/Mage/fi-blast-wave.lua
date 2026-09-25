-- SpellId: MK_BLAST_WAVE
if
    MK_AOE
    and #ni.unit.enemiesinrange("player", 10) >= 2
then
    return true
end
