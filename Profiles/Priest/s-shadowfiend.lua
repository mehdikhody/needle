-- SpellId: MK_SHADOWFIEND
-- Target: target
if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    return true
end
