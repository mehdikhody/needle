-- SpellId: MK_VAMPIRIC_TOUCH
-- Target: target
if
    GetUnitSpeed("player") == 0
    and ni.unit.debuffremaining("target", MK_VAMPIRIC_TOUCH, "player") <= 0.8
then
    return true
end
