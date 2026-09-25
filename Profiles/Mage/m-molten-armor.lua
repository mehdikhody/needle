-- SpellId: MK_MOLTEN_ARMOR
if
    MK_USE_MOLTEN_ARMOR
    and not ni.unit.buff("player", MK_MOLTEN_ARMOR)
then
    return true
end
