if
    ni.unit.inmelee("player", "target")
    and ni.spell.cd(MK_DEATH_AND_DECAY) == 0
    and ni.spell.available(MK_DEATH_AND_DECAY)
    and MK.IsUsableSpell(MK_DEATH_AND_DECAY)
then
    ni.spell.castat(MK_DEATH_AND_DECAY, "target")
    return true
end
