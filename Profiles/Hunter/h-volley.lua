if
    MK_AOE
    and not GetCurrentKeyBoardFocus()
    and not UnitChannelInfo("player")
then
    ni.spell.castat(MK_VOLLEY, "target")
    return true
end