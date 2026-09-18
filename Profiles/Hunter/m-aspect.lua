local function ShouldSwitchAspect()    
    local isInCombat = UnitAffectingCombat("player")
    local hasTarget = UnitExists("target")
    local hasDragonhawkAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_DRAGONHAWK)
    local hasViperAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_VIPER)
    local hasWildAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_WILD)
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

    -- In-combat: determine mana threshold for switching to Dragonhawk
    local activateMana = 30
    if
        ni.unit.isboss("target")
        and ni.unit.hp("target") <= 20
    then
        activateMana = 15
    end

    -- Switch to Dragonhawk if mana is sufficient
    if mana >= activateMana and not hasDragonhawkAspect then
        return MK_ASPECT_OF_THE_DRAGONHAWK
    end

    -- Switch to Viper if mana is too low for Volley
    if not hasEnoughMana and not hasViperAspect then
        return MK_ASPECT_OF_THE_VIPER
    end

    -- Switch to Dragonhawk for Kill Shot opportunity
    if
        ni.unit.hp("target") <= 20
        and ni.spell.cd(MK_KILL_SHOT) == 0
        and ni.spell.valid("target", MK_KILL_SHOT, true, true)
        and not hasDragonhawkAspect
    then
        return MK_ASPECT_OF_THE_DRAGONHAWK
    end

    -- Switch to Dragonhawk if Chimera Shot is available
    if
        mana > 10
        and ni.spell.cd(MK_CHIMERA_SHOT) == 0
        and ni.spell.valid("target", MK_CHIMERA_SHOT, true, true)
        and not hasDragonhawkAspect
    then
        return MK_ASPECT_OF_THE_DRAGONHAWK
    end

    -- No switch needed
    return nil
end

if MK_LAST_ASPECT_CHANGE == nil then
    MK_LAST_ASPECT_CHANGE = 0
end

if
    MK_ROTATION
    and not MK_PAUSE
    and not UnitChannelInfo("player")
    and not UnitCastingInfo("player")
    and GetTime() - MK_LAST_ASPECT_CHANGE > 1
then
    local aspectToSwitch = ShouldSwitchAspect()
    if aspectToSwitch then
        ni.spell.cast(aspectToSwitch)
        MK_LAST_ASPECT_CHANGE = GetTime()
        return true
    end
end
