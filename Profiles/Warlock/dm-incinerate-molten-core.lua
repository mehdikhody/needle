-- SpellId: MK_INCINERATE
-- Target: target
if
    GetUnitSpeed("player") == 0
    and ni.unit.buff("player", MK_MOLTEN_CORE)
then
    return true
end
