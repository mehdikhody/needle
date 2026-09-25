if
    MK_AOE
    and ni.unit.buff("player", MK_FIRESTARTER)
    and ni.spell.available(MK_FLAMESTRIKE)
    and MK.IsUsableSpell(MK_FLAMESTRIKE)
then
    ni.spell.castat(MK_FLAMESTRIKE, "target")
    return true
end
