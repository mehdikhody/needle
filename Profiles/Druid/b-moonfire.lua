if
    MK_ECLIPSE == "lunar"
    and not ni.unit.debuff("target", MK_MOONFIRE, "player")
then
    ni.spell.cast(MK_MOONFIRE, "target")
    return true
end
