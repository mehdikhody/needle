local function ShouldSwitchAspect()    
    local hasDragonhawkAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_DRAGONHAWK)
    local hasViperAspect = ni.unit.buff("player", MK_ASPECT_OF_THE_VIPER)
    local mana = ni.unit.power("player")

    if ni.unit.buff("player", MK_ASPECT_OF_THE_WILD) then
        return nil
    end

    if not UnitAffectingCombat("player") then
        if ni.unit.buff("player", MK_ASPECT_OF_THE_PACK) then
            return nil
        end
        if mana < 100 then
            if not hasViperAspect then
                return MK_ASPECT_OF_THE_VIPER
            end
            return nil
        end
        if not hasDragonhawkAspect then
            return MK_ASPECT_OF_THE_DRAGONHAWK
        end
        return nil
    end

    if not UnitExists("target") and mana < 90 then
        if not hasViperAspect then
            return MK_ASPECT_OF_THE_VIPER
        end
        return nil
    end

    if mana >= 30 then
        if not hasDragonhawkAspect then
            return MK_ASPECT_OF_THE_DRAGONHAWK
        end
        return nil
    end

    local function ready(spell)
        return ni.spell.cd(spell) == 0 and ni.spell.valid("target", spell, true, true)
    end

    local killShotReady = ni.unit.hp("target") <= 20 and ready(MK_KILL_SHOT)
    local minMana = 15
    if killShotReady and ni.unit.isboss("target") then
        minMana = 10
    end

    if mana >= minMana then
        if
            killShotReady
            or ready(MK_CHIMERA_SHOT)
            or ready(MK_AIMED_SHOT)
            or ni.unit.buff("player", MK_RAPID_FIRE)
            or ni.unit.buff("player", 20572)
            or ni.unit.buff("player", MK_CALL_OF_THE_WILD)
        then
            if not hasDragonhawkAspect then
                return MK_ASPECT_OF_THE_DRAGONHAWK
            end
            return nil
        end
    end

    if not hasViperAspect then
        return MK_ASPECT_OF_THE_VIPER
    end

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
