if
    MK_PET_CONTROL
    and UnitExists("target")
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and MK.Include(UnitName("target"), {
        "Aerial Command Unit",
        "Assault Bot",
        "Junk Bot",
        "Bomb Bot"
    })
then
    local enemies = ni.unit.enemiesinrange("player", 30)
    for i = 1, #enemies do
        if
            enemies[i].name == "Bomb Bot"
            and not UnitIsUnit("pettarget", enemies[i].guid)
        then
            ni.player.runtext("/petattack Bomb Bot")
        end
        if
            ni.spell.cd(61676) == 0
            and enemies[i].name == "Bomb Bot"
        then
            ni.spell.cast(61676, enemies[i].guid)
            return true
        end
    end
end
