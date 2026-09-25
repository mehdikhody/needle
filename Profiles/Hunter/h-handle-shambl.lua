local function isShambling(unit)
    return (
        UnitExists(unit)
        and UnitName(unit) == "Shambling Horror"
        and UnitCanAttack("player", unit)
    )
end

local function getShamblings()
    local shamblings = {}

    MK.EachNameplate(function(unit)
        if isShambling(unit) then
            table.insert(shamblings, unit)
        end
    end)

    return shamblings
end

local function tranquilizeBestShambling(shamblings)
    local targets = {}

    for _, unit in ipairs(shamblings) do
        if ni.unit.buff(unit, "Enrage") then
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

    return false
end

if
    UnitExists("target")
    and ni.spell.cd(MK_TRANQUILIZING_SHOT) == 0
    and MK.Include(UnitName("target"), {
        "The Lich King",
        "Drudge Ghoul",
        "Shambling Horror"
    })
then
    if isShambling("focus") then
        if ni.unit.buff("focus", "Enrage") then
            ni.spell.cast(MK_TRANQUILIZING_SHOT, "focus")
            return true
        end
    elseif tranquilizeBestShambling(getShamblings()) then
        return true
    end
end
