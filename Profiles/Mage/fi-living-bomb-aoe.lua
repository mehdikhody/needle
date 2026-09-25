if
    MK_AOE
    and ni.spell.available(MK_LIVING_BOMB)
    and MK.IsUsableSpell(MK_LIVING_BOMB)
then
    for _, enemy in ipairs(ni.unit.enemiesinrange("target", 10)) do
        local ttd = ni.unit.ttd(enemy.guid)
        if
            not ni.unit.debuff(enemy.guid, MK_LIVING_BOMB, "player")
            and (ttd < 0 or ttd >= 12)
            and ni.spell.valid(enemy.guid, MK_LIVING_BOMB, false, true)
        then
            ni.spell.cast(MK_LIVING_BOMB, enemy.guid)
            return true
        end
    end
end
