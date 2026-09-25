-- SpellId: MK_SEED_OF_CORRUPTION
if
    ni.unit.isboss("target")
    and MK_ShouldSnapshot("target")
    and ni.unit.debuff("target", MK_CORRUPTION, "player")
then
    return true
end
