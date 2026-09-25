-- Own copies of the spell IDs, so these helpers don't depend on a profile's
-- spell table globals.
local SUMMON_GARGOYLE = 49206
local DEATH_AND_DECAY = 49938

-- Summon Gargoyle lasts 30s; it's active while its 3 min cooldown is in
-- its first 30s.
function MK.GargoyleActive()
    local start, duration = GetSpellCooldown(SUMMON_GARGOYLE)
    return start ~= nil and start > 0 and duration > 2 and GetTime() - start < 30
end

-- Ready runes of a type (1 Blood, 2 Unholy, 3 Frost); Death runes count for
-- every type. Goes by GetRuneType, not rune slot order.
function MK.RunesReady(runeType)
    local ready = 0
    for i = 1, 6 do
        local kind = GetRuneType(i)
        local _, _, isReady = GetRuneCooldown(i)
        if isReady and (kind == runeType or kind == 4) then
            ready = ready + 1
        end
    end
    return ready
end

-- True while Death and Decay is about to come off cooldown: rune spenders
-- hold back so a Blood, Frost and Unholy rune are free the moment it's ready.
function MK.PoolForDeathAndDecay()
    return ni.unit.inmelee("player", "target")
        and ni.spell.cd(DEATH_AND_DECAY) < 3
end
