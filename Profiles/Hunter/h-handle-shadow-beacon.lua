if
    UnitExists("target")
    and MK_Include(UnitName("target"), {
        "Yogg-Saron",
        "Immortal Guardian",
        "Unknown"
    })
then
    local instance = { GetInstanceInfo() }

    if instance[5] == 10 then
        for i = 1, 60 do
            local unit = "nameplate" .. i

            if 
                UnitExists(unit) 
                and ni.unit.buffremaining(unit, 64465) <= 6 
            then
                if
                    UnitChannelInfo(unit)
                    and IsSpellKnown(MK_SILENCING_SHOT)
                    and ni.spell.available(MK_SILENCING_SHOT)
                    and ni.spell.cd(MK_SILENCING_SHOT) == 0
                    and ni.spell.valid(unit, MK_SILENCING_SHOT, true, true)
                    and MK_IsUsableSpell(MK_SILENCING_SHOT)
                then
                    ni.spell.cast(MK_SILENCING_SHOT, unit)
                    return true
                end

                if
                    not UnitIsUnit("player", unit .. "target")
                    and ni.spell.cd(MK_DISTRACTING_SHOT) == 0
                then
                    ni.spell.cast(MK_DISTRACTING_SHOT, unit)
                    return true
                end
            end
        end
    end

    if
        instance[5] == 25
        and UnitExists("focus")
        and UnitCanAttack("player", "focus")
    then
        if
            UnitChannelInfo("focus")
            and IsSpellKnown(MK_SILENCING_SHOT)
            and ni.spell.available(MK_SILENCING_SHOT)
            and ni.spell.cd(MK_SILENCING_SHOT) == 0
            and ni.spell.valid("focus", MK_SILENCING_SHOT, true, true)
            and MK_IsUsableSpell(MK_SILENCING_SHOT)
        then
            ni.spell.cast(MK_SILENCING_SHOT, "focus")
            return true
        end

        if
            not UnitIsUnit("player", "focustarget")
            and ni.unit.buffremaining("focus", 64465) <= 6
            and ni.spell.cd(MK_DISTRACTING_SHOT) == 0
        then
            ni.spell.cast(MK_DISTRACTING_SHOT, "focus")
            return true
        end
    end
end