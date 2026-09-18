if
    MK_AOE
    and MK_USE_HURRICANE
    and not GetCurrentKeyBoardFocus()
    and not UnitChannelInfo("player")
then
    ni.spell.castat(MK_HURRICANE, "target")
    return true
end
