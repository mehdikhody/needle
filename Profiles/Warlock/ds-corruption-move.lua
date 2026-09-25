-- SpellId: MK_CORRUPTION
-- Target: target
if
    GetUnitSpeed("player") > 0
    and not ni.unit.debuff("target", MK_CORRUPTION, "player")
then
    return true
end
