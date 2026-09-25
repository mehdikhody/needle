if
    MK_COOLDOWNS
    and ni.unit.inmelee("player", "target")
    and MK.GargoyleActive()
then
    MK.UseHands()
end
