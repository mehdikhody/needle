-- SpellId: MK_ARCANE_BLAST
-- Target: target
if
    GetUnitSpeed("player") == 0
    or ni.unit.buff("player", MK_PRESENCE_OF_MIND)
then
    return true
end
