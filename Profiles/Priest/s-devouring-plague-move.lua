-- SpellId: MK_DEVOURING_PLAGUE
-- Target: target
if
    ni.unit.isboss("target")
    and GetUnitSpeed("player") >= 3
    and ni.unit.power("player") >= 30
    and ni.unit.debuffremaining("target", MK_DEVOURING_PLAGUE, "player") < 4
then
    return true
end
