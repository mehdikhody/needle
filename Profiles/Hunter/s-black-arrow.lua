if
    MK_COOLDOWNS
    and ni.unit.debuffremaining("target", MK_EXPLOSIVE_TRAP_EFFECT, "player") > 5
then
    ni.spell.cast(MK_BLACK_ARROW, "target")
    return true
end
