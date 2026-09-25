-- SpellId: MK_ARCANE_MISSILES
-- Target: target
local stacks = ni.unit.debuffstacks("player", MK_ARCANE_BLAST_DEBUFF)
local needed = ni.unit.power("player") < 35 and 3 or 4

if
    ni.unit.buff("player", MK_MISSILE_BARRAGE)
    and (
        stacks >= needed
        or ni.unit.buffremaining("player", MK_MISSILE_BARRAGE) < 3
    )
then
    return true
end
