-- SpellId: MK_BLOOD_STRIKE
-- Target: target
if ni.unit.buffremaining("player", MK_DESOLATION) < 3 then
    return true
end
