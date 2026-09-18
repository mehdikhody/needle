if
    MK_AOE
    and ni.unit.power("player") >= 30
    and ni.spell.valid("target", MK_BLOODTHIRST, true, true)
then
    local count = 0

    for i = 1, 60 do
        local unit = 'nameplate' .. i

        if
            not UnitIsDeadOrGhost(unit)
            and CheckInteractDistance(unit, 2)
        then
            count = count + 1
        end
    end

    if count > 1 then
        ni.spell.cast(MK_CLEAVE)
    else
        ni.spell.cast(MK_HEROIC_STRIKE)
    end
end
