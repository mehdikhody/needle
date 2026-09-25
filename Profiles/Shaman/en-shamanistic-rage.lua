-- SpellId: MK_SHAMANISTIC_RAGE
if
    ni.unit.inmelee("player", "target")
    and ni.unit.power("player") <= 70
then
    return true
end
