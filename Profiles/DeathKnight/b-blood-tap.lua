-- SpellId: MK_BLOOD_TAP
local bloodOnCd = ni.rune.bloodrunecd()

if
    ni.unit.inmelee("player", "target")
    and bloodOnCd > 0
then
    return true
end
