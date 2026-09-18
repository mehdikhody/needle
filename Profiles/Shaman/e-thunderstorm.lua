if
    MK_AOE
    and ni.player.hasglyph(62132)
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

    if count > 2 then
        ni.spell.cast(MK_THUNDERSTORM)
        return true
    end
end
