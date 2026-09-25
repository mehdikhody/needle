local SUMMON_GARGOYLE = 49206
local DEATH_AND_DECAY = 49938

function MK.GargoyleActive()
    local start, duration = GetSpellCooldown(SUMMON_GARGOYLE)
    return start ~= nil and start > 0 and duration > 2 and GetTime() - start < 30
end

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

function MK.PoolForDeathAndDecay()
    return ni.unit.inmelee("player", "target")
        and ni.spell.cd(DEATH_AND_DECAY) < 3
end
