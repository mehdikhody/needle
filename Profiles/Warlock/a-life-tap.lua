if
    ni.unit.hp("player") >= 20
    and ni.player.hasglyph(MK_GLYPH_OF_LIFE_TAP)
    and not ni.unit.buff("player", MK_ERADICATION)
    and (
        not ni.unit.buff("player", MK_LIFE_TAP_BUFF)
        or ni.unit.buffremaining("player", MK_LIFE_TAP_BUFF, "player") <= 5
    )
then
    ni.spell.cast(MK_LIFE_TAP)
    return true
end
