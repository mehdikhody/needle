if
    MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    for _, racial in ipairs({ 33702, 26297 }) do
        if IsSpellKnown(racial) and ni.spell.cd(racial) == 0 then
            ni.spell.cast(racial)
            return true
        end
    end
end
