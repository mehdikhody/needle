if
    not MK_ROTATION
    or UnitName("target") == "Crusher Tentacle"
then
    PetStopAttack()
end

if
    MK_PET_CONTROL
    and UnitExists("pet")
    and not UnitIsDead("pet")
then
    local targetName = UnitName("target")
    local shouldAttack = (
        MK_ROTATION
        and UnitExists("target")
        and UnitAffectingCombat("player")
        and ni.unit.hp("pet") > 20
        and targetName ~= "Crusher Tentacle"
    )

    if
        shouldAttack
        and MK_Include(targetName, {
            "Aerial Command Unit",
            "VX-001",
            "Leviathan Mk II"
        })
    then
        for i = 1, 60 do
            local unit = 'nameplate' .. i
            if
                UnitName(unit) == "Aerial Command Unit"
                and UnitChannelInfo(unit)
                and select(8, UnitChannelInfo(unit)) == 63293
            then
                shouldAttack = false
            end
        end
    end

    if shouldAttack then
        if
            not UnitIsUnit("pettarget", "target")
            and not MK_Include(targetName, {
                'Ice Sphere'
            })
        then
            PetAttack()
        end
    else
        if IsPetAttackActive() then
            PetStopAttack()
        end
    end
end
