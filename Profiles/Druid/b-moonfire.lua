-- SpellId: MK_MOONFIRE
if
    MK_ECLIPSE == "lunar"
    and not ni.unit.debuff("target", MK_MOONFIRE, "player")
then
    return true
end
