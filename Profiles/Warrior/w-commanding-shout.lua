if ni.unit.buffremaining("player", MK_COMMANDING_SHOUT, "player") < 10 then
    ni.spell.cast(MK_COMMANDING_SHOUT)
    return true
end
