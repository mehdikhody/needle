-- SpellId: MK_DIVINE_PLEA
if
    MK_COOLDOWNS
    and ni.unit.power("player") <= 80
then
    return true
end
