if 
    ni.spell.available(MK_ARCANE_SHOT)
    and not ni.unit.buff("player", MK_IMPROVED_STEADY_SHOT)
then
    ni.spell.cast(MK_ARCANE_SHOT, "target")
    return true
end