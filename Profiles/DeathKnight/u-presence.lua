local wantsUnholy = MK.GargoyleActive() or (
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.spell.cd(MK_SUMMON_GARGOYLE) == 0
    and UnitPower("player") >= 60
)

local presence = wantsUnholy and MK_UNHOLY_PRESENCE or MK_BLOOD_PRESENCE

if
    not ni.unit.buff("player", MK_FROST_PRESENCE)
    and not ni.unit.buff("player", presence)
    and ni.spell.available(presence)
    and MK.IsUsableSpell(presence)
then
    ni.spell.cast(presence)
    return true
end
