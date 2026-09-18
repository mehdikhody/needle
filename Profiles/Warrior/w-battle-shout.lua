if ni.unit.buffremaining("player", MK_BATTLE_SHOUT, "player") < 10 then
    ni.spell.cast(MK_BATTLE_SHOUT)
    return true
end
