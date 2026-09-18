local T1 = { GetTotemInfo(1) }

if
    MK_AOE
    and T1[1]
    and T1[2] == "Magma Totem VII"
then
    ni.spell.cast(MK_FIRE_NOVA)
    return true
end
