-- SpellId: MK_RAISE_DEAD
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and (not UnitExists("pet") or UnitIsDead("pet"))
    and (ni.player.hasglyph(59313) or GetItemCount(37201) > 0)
then
    return true
end
