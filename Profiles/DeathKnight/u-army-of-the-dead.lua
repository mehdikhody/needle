-- SpellId: MK_ARMY_OF_THE_DEAD
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.hp("target") >= 85
    and MK.GargoyleActive()
then
    return true
end
