-- SpellId: MK_CONFLAGRATE
-- Target: target
if ni.unit.debuff("target", MK_IMMOLATE, "player") then
    return true
end
