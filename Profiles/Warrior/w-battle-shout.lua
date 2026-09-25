-- SpellId: MK_BATTLE_SHOUT
if MK_RAGING and ni.unit.buffremaining("player", MK_BATTLE_SHOUT, "player") < 10 then
    return true
end
