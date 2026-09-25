local SHADOW_BEACON = 64465

local function canSilence(unit)
    return (
        UnitChannelInfo(unit)
        and IsSpellKnown(MK_SILENCING_SHOT)
        and ni.spell.available(MK_SILENCING_SHOT)
        and ni.spell.cd(MK_SILENCING_SHOT) == 0
        and ni.spell.valid(unit, MK_SILENCING_SHOT, true, true)
        and MK.IsUsableSpell(MK_SILENCING_SHOT)
    )
end

local function canDistract(unit)
    return (
        not UnitIsUnit("player", unit .. "target")
        and ni.unit.buffremaining(unit, SHADOW_BEACON) <= 6
        and ni.spell.cd(MK_DISTRACTING_SHOT) == 0
    )
end

local function handleBeacon(unit)
    if canSilence(unit) then
        ni.spell.cast(MK_SILENCING_SHOT, unit)
        return true
    end

    if canDistract(unit) then
        ni.spell.cast(MK_DISTRACTING_SHOT, unit)
        return true
    end

    return false
end

if MK.Include(UnitName("target"), MK.YOGG_TARGETS) then
    if
        UnitExists("focus")
        and UnitCanAttack("player", "focus")
    then
        if handleBeacon("focus") then
            return true
        end
    else
        return MK.EachNameplate(function(unit)
            if
                ni.unit.buffremaining(unit, SHADOW_BEACON) <= 6
                and handleBeacon(unit)
            then
                return true
            end
        end)
    end
end
