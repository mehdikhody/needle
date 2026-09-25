-- SpellId: MK_CLEAVE
if
    MK_AOE
    and ni.unit.power("player") >= 30
    and ni.spell.valid("target", MK_BLOODTHIRST, true, true)
then
    return true
end
