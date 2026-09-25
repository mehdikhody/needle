-- SpellId: MK_FLASH_OF_LIGHT
-- Target: player
if
    ni.unit.hp("player") <= 20
    and ni.unit.buff("player", MK_ART_OF_WAR)
then
    return true
end
