-- SpellId: MK_MAGMA_TOTEM
local hasTotem, name = GetTotemInfo(1)

if
    ni.unit.inmelee("player", "target")
    and (not hasTotem or name == "")
then
    return true
end
