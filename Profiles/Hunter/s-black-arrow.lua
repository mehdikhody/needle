-- SpellId: MK_BLACK_ARROW
if
    MK_COOLDOWNS
    and ni.unit.debuffremaining("target", MK_EXPLOSIVE_TRAP_EFFECT, "player") > 5
then
    return true
end
