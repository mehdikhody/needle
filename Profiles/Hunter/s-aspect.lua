local function ShouldSwitchAspect()
    local isInCombat = UnitAffectingCombat("player")
    local isMelee = ni.spell.valid("target", MK_MONGOOSE_BITE, true, true)
    local isRange = ni.spell.valid("target", MK_EXPLOSIVE_SHOT, true, true)
    local isTargetBoss = ni.unit.isboss("target")
    local hasTarget = UnitExists("target")
    local hasDragonhawkAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_DRAGONHAWK) ~= nil
    local hasViperAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_VIPER) ~= nil
    local hasWildAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_WILD) ~= nil
    local hasLockAndLoad = ni.unit.buff("player", MK_LOCK_AND_LOAD) ~= nil
    local hasRapidFire = ni.unit.buff("player", MK_RAPID_FIRE) ~= nil
    local hasKillCommand = ni.unit.buff("player", MK_KILL_COMMAND) ~= nil
    local hasFuriousHowl = ni.unit.buff("player", MK_FURIOUS_HOWL) ~= nil
    local serpentStingDebuff = ni.unit.debuff("target", MK_SERPENT_STING, "player") ~= nil
    local explosiveShotCD = ni.spell.cd(MK_EXPLOSIVE_SHOT)
    local explosiveTrapCD = ni.spell.cd(MK_EXPLOSIVE_TRAP)
    local multiShotCD = ni.spell.cd(MK_MULTI_SHOT)
    local hasEnoughMana = ni.spell.available(MK_VOLLEY)
    local mana = ni.unit.power("player")

    -- Do not switch if Aspect of the Wild is active
    if hasWildAspect then
        return nil
    end

    -- Out-of-combat logic
    if not isInCombat then
        if mana <= 60 and hasDragonhawkAspect then
            return MK_ASPECT_OF_THE_VIPER
        elseif mana == 100 and hasViperAspect then
            return MK_ASPECT_OF_THE_DRAGONHAWK
        end
        return nil
    end

    -- In-combat: no target scenario
    if not hasTarget then
        if mana <= 90 and not hasViperAspect then
            return MK_ASPECT_OF_THE_VIPER
        end
        return nil
    end

    -- Basic control for clearing mobs (non-boss targets)
    if not isTargetBoss then
        if mana <= 15 and not hasViperAspect then
            return MK_ASPECT_OF_THE_VIPER
        elseif mana >= 60 and not hasDragonhawkAspect then
            return MK_ASPECT_OF_THE_DRAGONHAWK
        end
        return nil
    end

    -- Determine mana threshold for switching to Dragonhawk
    local activateMana = 20
    if ni.unit.hp("target") <= 20 then
        activateMana = 10
    end

    -- Switch to Dragonhawk if mana is sufficient
    if mana >= activateMana and not hasDragonhawkAspect then
        return MK_ASPECT_OF_THE_DRAGONHAWK
    end

    -- Switch to Viper if mana is too low for Volley
    if not hasEnoughMana and not hasViperAspect then
        return MK_ASPECT_OF_THE_VIPER
    end

    -- Switch to Dragonhawk if key abilities are available
    if
        mana >= 10
        and (
            hasLockAndLoad or
            explosiveShotCD == 0 or
            multiShotCD == 0 or
            hasRapidFire or
            hasKillCommand or
            hasFuriousHowl
        )
        and not hasDragonhawkAspect
    then
        return MK_ASPECT_OF_THE_DRAGONHAWK
    end

    -- Switch to Viper during filler periods with low mana
    if
        isRange
        and not hasLockAndLoad
        and explosiveShotCD > 1
        and multiShotCD > 1
        and serpentStingDebuff
        and not hasViperAspect
        and mana <= activateMana
    then
        return MK_ASPECT_OF_THE_VIPER
    end

    -- Switch to Dragonhawk for Explosive Trap in melee range
    if
        isMelee
        and hasEnoughMana
        and explosiveTrapCD == 0
        and not hasDragonhawkAspect
    then
        return MK_ASPECT_OF_THE_DRAGONHAWK
    end

    -- No switch needed
    return nil
end

-- Main execution block
if MK_LAST_ASPECT_CHANGE == nil then
    MK_LAST_ASPECT_CHANGE = 0
end

if
    MK_ROTATION
    and not MK_PAUSE
    and UnitChannelInfo("player") == nil
    and GetTime() - MK_LAST_ASPECT_CHANGE > 2
then
    local aspectToSwitch = ShouldSwitchAspect()
    if aspectToSwitch then
        ni.spell.cast(aspectToSwitch)
        MK_LAST_ASPECT_CHANGE = GetTime()
        return true
    end
end
