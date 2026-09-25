-- SpellId: MK_CALL_OF_ELEMENTS
local T1 = { GetTotemInfo(1) }
local T2 = { GetTotemInfo(2) }
local T3 = { GetTotemInfo(3) }
local T4 = { GetTotemInfo(4) }


if
    T1[1] and T1[2] == ""
    and T2[1] and T2[2] == ""
    and T3[1] and T3[2] == ""
    and T4[1] and T4[2] == ""
    and ni.unit.isboss("target")
    and ni.spell.valid("target", MK_LIGHTNING_BOLT, true, true)
then
    return true
end
