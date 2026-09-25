-- SpellId: MK_STEADY_SHOT
if 
    GetUnitSpeed("player") == 0
    and ni.spell.available(MK_STEADY_SHOT)
then
    return true
end