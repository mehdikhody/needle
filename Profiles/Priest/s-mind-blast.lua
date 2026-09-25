-- SpellId: MK_MIND_BLAST
-- Target: target
if
    GetUnitSpeed("player") == 0
    and (MK_USE_MIND_BLAST or ni.unit.buff("player", MK_INNER_FOCUS))
then
    return true
end
