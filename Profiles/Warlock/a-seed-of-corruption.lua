if
    ni.unit.isboss("target")
    and MK_ShouldSnapshot("target")
    and ni.unit.debuff("target", MK_CORRUPTION, "player")
then
    ni.spell.cast(MK_SEED_OF_CORRUPTION, "target")
    return true
end
