if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
    and ni.unit.inmelee("player", "target")
    and ni.unit.buff("player", 54758)
then
    for _, racial in ipairs({ 33697, 26297 }) do
        if IsSpellKnown(racial) and ni.spell.cd(racial) == 0 then
            ni.spell.cast(racial)
            return true
        end
    end
end
