function MK_IsUsableSpell(spellId)
    local spell = GetSpellInfo(spellId)
    if spell then
        local usable = IsUsableSpell(spell)
        return usable == 1
    end

    return false
end

function MK_HasPowerToCast(spellId)
    local power = UnitPower("player")
    local cost = select(4, GetSpellInfo(spellId))
    return power >= cost
end

function MK_GetRuneCooldown(runeId)
    local start, duration, isReady = GetRuneCooldown(runeId)
    local endTime = start + duration

    if isReady == true then return 0 end
    return endTime - GetTime()
end

function MK_Include(str, arr)
    for _, value in ipairs(arr) do
        if value == str then
            return true
        end
    end
    return false
end
