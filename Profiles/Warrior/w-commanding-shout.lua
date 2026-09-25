-- SpellId: MK_COMMANDING_SHOUT
if ni.unit.buffremaining("player", MK_COMMANDING_SHOUT, "player") < 10 then
    return true
end
