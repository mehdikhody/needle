-- SpellId: MK_SHATTERING_THROW
-- Target: target
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and GetUnitSpeed("player") == 0
then
    return true
end
