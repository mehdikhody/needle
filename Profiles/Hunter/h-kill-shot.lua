if 
    not UnitChannelInfo("player")
    and ni.spell.available(MK_KILL_SHOT)
    and ni.spell.cd(MK_KILL_SHOT) == 0
    and ni.spell.valid("target", MK_KILL_SHOT, true, true)
    and MK_IsUsableSpell(MK_KILL_SHOT)
then
    ni.spell.cast(MK_KILL_SHOT, "target")
    return true
end