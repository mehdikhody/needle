-- SpellId: MK_RAISE_DEAD

-- needs Glyph of Raise Dead or Corpse Dust
if
    (not UnitExists("pet") or UnitIsDead("pet"))
    and (ni.player.hasglyph(59313) or GetItemCount(37201) > 0)
then
    return true
end
