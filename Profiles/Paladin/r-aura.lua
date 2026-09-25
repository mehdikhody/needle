local AURAS = {
    MK_RETRIBUTION_AURA,
    MK_DEVOTION_AURA,
    MK_CONCENTRATION_AURA,
    MK_CRUSADER_AURA,
    MK_SHADOW_RESISTANCE_AURA,
    MK_FROST_RESISTANCE_AURA,
    MK_FIRE_RESISTANCE_AURA
}

for _, aura in ipairs(AURAS) do
    if ni.unit.buff("player", aura, "player") then
        return false
    end
end

if ni.spell.available(MK_RETRIBUTION_AURA) and MK.IsUsableSpell(MK_RETRIBUTION_AURA) then
    ni.spell.cast(MK_RETRIBUTION_AURA)
    return true
end
