function MK.IsUsableSpell(spellId)
    local spell = GetSpellInfo(spellId)
    if spell then
        local usable = IsUsableSpell(spell)
        return usable == 1
    end

    return false
end

function MK.HasPowerToCast(spellId)
    local power = UnitPower("player")
    local cost = select(4, GetSpellInfo(spellId))
    return power >= cost
end

function MK.GetRuneCooldown(runeId)
    local start, duration, isReady = GetRuneCooldown(runeId)
    local endTime = start + duration

    if isReady == true then return 0 end
    return endTime - GetTime()
end

function MK.Include(str, arr)
    for _, value in ipairs(arr) do
        if value == str then
            return true
        end
    end
    return false
end

-- Calls fn for every existing nameplate unit and stops at the first non-nil
-- result, which is returned.
function MK.EachNameplate(fn)
    for i = 1, 60 do
        local unit = "nameplate" .. i
        if UnitExists(unit) then
            local result = fn(unit)
            if result ~= nil then
                return result
            end
        end
    end
end

function MK.TalentRank(spellId)
    local name = GetSpellInfo(spellId)
    for tab = 1, GetNumTalentTabs() do
        for index = 1, GetNumTalents(tab) do
            local talent, _, _, _, rank = GetTalentInfo(tab, index)
            if talent == name then
                return rank
            end
        end
    end
    return 0
end

local HYPERSPEED_ACCELERATION = 54758

-- Uses the glove tinker unless it is on cooldown or its buff is still up.
function MK.UseHands()
    if
        ni.player.slotusable(10)
        and not ni.unit.buff("player", HYPERSPEED_ACCELERATION)
    then
        ni.player.useinventoryitem(10)
    end
end
