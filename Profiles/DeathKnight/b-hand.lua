if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and (ni.unit.buff("player", MK_HYSTERIA) or not IsSpellKnown(MK_HYSTERIA))
then
    MK.UseHands()
end
