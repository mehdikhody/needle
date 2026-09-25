-- SpellId: MK_SOUL_FIRE
-- Target: target
if
    ni.unit.hp("target") <= 35
    and ni.unit.buff("player", MK_DECIMATION)
    and (GetUnitSpeed("player") == 0 or ni.unit.buff("player", MK_MOLTEN_CORE))
then
    return true
end
