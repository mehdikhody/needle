if MK_SNAPSHOT_TARGETS == nil then
    MK_SNAPSHOT_TARGETS = {}
end

function MK_TakeSnapshot(unit)
    local crit = GetSpellCritChance(2) * 0.7
    local damage = select(3, UnitRangedDamage("player"))

    if ni.unit.hp(unit) <= 35 then
        damage = damage * 1.12
    end

    local points = damage + crit
    local guid = UnitGUID(unit)
    local entry = nil

    for _, _entry in ipairs(MK_SNAPSHOT_TARGETS) do
        if _entry.guid == guid then
            entry = _entry
        end
    end

    if entry and type(entry) == "table" then
        entry.points = points
        return
    end

    table.insert(MK_SNAPSHOT_TARGETS, {
        guid = UnitGUID(unit),
        points = points
    })
end

function MK_ShouldSnapshot(unit)
    local crit = GetSpellCritChance(2) * 0.7
    local damage = select(3, UnitRangedDamage("player"))

    if ni.unit.hp(unit) <= 35 then
        damage = damage * 1.12
    end

    local points = damage + crit
    local guid = UnitGUID(unit)
    local entry = nil

    for _, _entry in ipairs(MK_SNAPSHOT_TARGETS) do
        if _entry.guid == guid then
            entry = _entry
        end
    end

    return entry and points > entry.points * 1.1
end

for i = 1, 60 do
    local unit = "nameplate" .. i
    local guid = UnitGUID(unit)
    if not ni.unit.debuff(unit, MK_CORRUPTION, "player") then
        for j = #MK_SNAPSHOT_TARGETS, 1, -1 do
            if MK_SNAPSHOT_TARGETS[j].guid == guid then
                table.remove(MK_SNAPSHOT_TARGETS, j)
            end
        end
    end
end
