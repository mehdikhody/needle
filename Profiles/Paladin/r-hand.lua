if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and (
        ni.unit.buff("player", MK_AVENGING_WRATH)
        or ni.spell.cd(MK_AVENGING_WRATH) >= 60
    )
then
    MK.UseHands()
end
