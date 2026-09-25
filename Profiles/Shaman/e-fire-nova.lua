-- SpellId: MK_FIRE_NOVA
local T1 = { GetTotemInfo(1) }

if
    MK_AOE
    and T1[1]
    and T1[2] == "Magma Totem VII"
then
    return true
end
