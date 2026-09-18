if
    UnitExists("target")
    and ni.spell.cd(MK_TRANQUILIZING_SHOT) == 0
    and MK_Include(UnitName("target"), {
        "The Lich King",
        "Drudge Ghoul",
        "Shambling Horror"
    })
then
    local instance = { GetInstanceInfo() }

    if instance[5] == 10 then
        local targets = {}

        for i = 1, 60 do
            local unit = "nameplate" .. i

            if
                UnitExists(unit)
                and UnitName(unit) == "Shambling Horror"
                and UnitCanAttack("player", unit)
                and ni.unit.buff(unit, "Enrage")
            then
                table.insert(targets, {
                    unit     = unit,
                    health   = ni.unit.hp(unit),
                    stuned   = ni.unit.isstunned(unit),
                    necrotic = ni.unit.debuff(unit, 70337)
                })
            end
        end

        table.sort(targets, function(a, b)
            return a.health < b.health
        end)

        for _, target in ipairs(targets) do
            if not target.stuned and not target.necrotic then
                ni.spell.cast(MK_TRANQUILIZING_SHOT, target.unit)
                return true
            end
        end

        for _, target in ipairs(targets) do
            if not target.stuned then
                ni.spell.cast(MK_TRANQUILIZING_SHOT, target.unit)
                return true
            end
        end

        for _, target in ipairs(targets) do
            ni.spell.cast(MK_TRANQUILIZING_SHOT, target.unit)
            return true
        end

    elseif instance[5] == 25 then
        if
            UnitExists("focus")
            and UnitName("focus") == "Shambling Horror"
            and UnitCanAttack("player", "focus")
            and ni.unit.buff("focus", "Enrage")
        then
            ni.spell.cast(MK_TRANQUILIZING_SHOT, "focus")
            return true
        end
    end
end