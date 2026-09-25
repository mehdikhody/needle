-- SpellId: MK_BLOOD_TAP
local _, unholyReady = ni.rune.unholyrunecd()

if
    UnitExists("pet")
    and not UnitIsDead("pet")
    and ni.unit.buffremaining("pet", MK_GHOUL_FRENZY, "player") <= 10
    and ni.spell.cd(MK_GHOUL_FRENZY) == 0
    and unholyReady == 0
then
    return true
end
