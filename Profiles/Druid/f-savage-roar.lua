-- SpellId: MK_SAVAGE_ROAR
if
    ni.unit.inmelee("player", "target")
    and ni.player.powerraw("combopoints") >= 1
    and ni.unit.buffremaining("player", MK_SAVAGE_ROAR) < 1
then
    return true
end
