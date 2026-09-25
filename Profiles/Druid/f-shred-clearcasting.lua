-- SpellId: MK_SHRED
-- Target: target
if
    ni.unit.buff("player", MK_CLEARCASTING)
    and ni.unit.isbehind("player", "target")
then
    return true
end
