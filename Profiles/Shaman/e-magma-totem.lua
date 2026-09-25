-- SpellId: MK_MAGMA_TOTEM
local T1 = { GetTotemInfo(1) }

if
    MK_AOE
    and T1[1]
    and T1[2] == ""
then
    local count = 0

    MK.EachNameplate(function(unit)
        if
            not UnitIsDeadOrGhost(unit)
            and CheckInteractDistance(unit, 2)
        then
            count = count + 1
        end
    end)

    if count > 2 then
        return true
    end
end
