-- SpellId: MK_CHAIN_LIGHTNING
-- Target: target
if
    MK_AOE
    and ni.unit.buffstacks("player", MK_MAELSTROM_WEAPON) >= 5
then
    return true
end
