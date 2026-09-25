local seal = MK_SEAL_OF_COMMAND

if not MK_AOE then
    seal = IsSpellKnown(MK_SEAL_OF_VENGEANCE) and MK_SEAL_OF_VENGEANCE or MK_SEAL_OF_CORRUPTION
end

if
    not ni.unit.buff("player", seal)
    and ni.spell.available(seal)
    and MK.IsUsableSpell(seal)
then
    ni.spell.cast(seal)
    return true
end
