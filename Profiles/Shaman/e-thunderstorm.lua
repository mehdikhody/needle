-- SpellId: MK_THUNDERSTORM
if
    MK_AOE
    and ni.player.hasglyph(62132)
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
