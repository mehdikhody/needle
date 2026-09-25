-- SpellId: MK_KILL_SHOT
if 
    not UnitChannelInfo("player")
    and ni.spell.available(MK_KILL_SHOT)
    and ni.spell.cd(MK_KILL_SHOT) == 0
    and ni.spell.valid("target", MK_KILL_SHOT, true, true)
    and MK.IsUsableSpell(MK_KILL_SHOT)
then
    return true
end