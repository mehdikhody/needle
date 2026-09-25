-- SpellId: MK_MIND_FLAY
-- Target: target
if
    GetUnitSpeed("player") == 0
    and not UnitChannelInfo("player")
then
    return true
end
