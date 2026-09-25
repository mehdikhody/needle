-- SpellId: MK_TRICKS_OF_THE_TRADE
-- Target: focus
if
    UnitExists("focus")
    and UnitIsFriend("player", "focus")
    and not UnitIsUnit("player", "focus")
    and not UnitIsDeadOrGhost("focus")
then
    return true
end
