if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and IsSpellKnown(28730)
    and ni.spell.cd(28730) == 0
    and not MK.IsUsableSpell(MK_CRUSADER_STRIKE)
then
    ni.spell.cast(28730)
    return true
end
