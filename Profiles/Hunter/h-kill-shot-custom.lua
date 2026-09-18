if ni.spell.cd(MK_KILL_SHOT) == 0 then
    for i = 1, 60 do
        local unit = "nameplate" .. i

        if
            UnitExists(unit)
            and ni.unit.hp(unit) <= 20
            and ni.unit.hpraw(unit) > 10000
            and UnitCanAttack("player", unit)
            and ni.spell.valid(unit, MK_KILL_SHOT, true, true)
            and not UnitChannelInfo("player")
            and (
                ni.unit.isboss("target")
                and ni.unit.hp("target") >= 30
                or not ni.unit.isboss("target")
            )
            and not MK_Include(UnitName("target"), {
                "Aerial Command Unit",
                "Collapsing Star",
            })
        then
            ni.spell.cast(MK_KILL_SHOT, unit)
            return true
        end
    end
end
