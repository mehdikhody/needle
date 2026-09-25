-- SpellId: MK_FROSTFIRE_BOLT
-- Target: target
if
    GetUnitSpeed("player") == 0
    and ni.player.hasglyph(MK_GLYPH_OF_FROSTFIRE)
then
    return true
end
