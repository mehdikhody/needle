if
    MK_AOE
    and GetUnitSpeed("player") == 0
    and ni.unit.debuffremaining("target", MK_FLAMESTRIKE, "player") < 2
    and ni.spell.available(MK_FLAMESTRIKE)
    and MK.IsUsableSpell(MK_FLAMESTRIKE)
then
    ni.spell.castat(MK_FLAMESTRIKE, "target")
    return true
end
