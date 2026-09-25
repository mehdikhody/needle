-- SpellId: MK_ARCANE_SHOT
if 
    ni.spell.available(MK_ARCANE_SHOT)
    and not ni.unit.buff("player", MK_IMPROVED_STEADY_SHOT)
then
    return true
end