local Elits = {
    "Mistress of Pain",
}

if MK_AOE then
    if MK_SB1_LAST_CAST == nil then MK_SB1_LAST_CAST = 0 end

    local cast = { UnitCastingInfo("player") }
    if cast[1] == "Shadow Bolt" and cast[2] == "Rank 1" then
        MK_SB1_LAST_CAST = GetTime()
    end

    if
        GetTime() - MK_SB1_LAST_CAST > 1
        and not ni.spell.isqueued()
        and not UnitCastingInfo("player")
    then
        for i = 1, 60 do
            local unit = 'nameplate' .. i
            if
                UnitExists(unit)
                and UnitCanAttack("player", unit)
                and not UnitIsUnit("target", unit)
                and not UnitChannelInfo("player")
                and ni.spell.valid(unit, MK_SHADOW_BOLT_1, true, true)
            then
                local isBoss = ni.unit.isboss(unit)
                -- local isElit = MK_Include(UnitName(unit), Elits)
                local isElit = true

                if isBoss or isElit then
                    -- Refresh lead time scales with distance (old profile used 8/10/15/20/25 yard bands)
                    local SBT = 3
                    local distance = ni.unit.distance("player", unit)
                    if distance >= 10 then SBT = 4 end
                    if distance >= 15 then SBT = 5 end
                    if distance >= 20 then SBT = 6 end
                    if distance >= 25 then SBT = 7 end

                    if
                        ni.unit.debuff(unit, MK_CORRUPTION, "player")
                        and ni.unit.debuffremaining(unit, MK_CORRUPTION, "player") <= SBT
                    then
                        ni.spell.cast(MK_SHADOW_BOLT_1, unit)
                        MK_SB1_LAST_CAST = GetTime()
                        return true
                    end
                end
            end
        end
    end
end
