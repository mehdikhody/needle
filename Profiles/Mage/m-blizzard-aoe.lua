if
    MK_AOE
    and GetUnitSpeed("player") == 0
    and ni.spell.available(MK_BLIZZARD)
    and MK.IsUsableSpell(MK_BLIZZARD)
then
    ni.spell.castat(MK_BLIZZARD, "target")
    return true
end
