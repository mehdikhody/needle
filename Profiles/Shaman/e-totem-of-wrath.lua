local T1 = { GetTotemInfo(1) }

if
    not MK_AOE
    and T1[1] and T1[2] == ""
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_LIGHTNING_BOLT, true, true)
then
    ni.spell.cast(MK_TOTEM_OF_WRATH)
    return true
end
