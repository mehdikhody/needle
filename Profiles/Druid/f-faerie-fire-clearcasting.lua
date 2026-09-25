-- SpellId: MK_FAERIE_FIRE_FERAL
-- Target: target
if
    ni.unit.power("player") < 30
    and not ni.unit.buff("player", MK_CLEARCASTING)
then
    return true
end
