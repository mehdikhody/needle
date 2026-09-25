-- SpellId: MK_BLOOD_STRIKE
-- Target: target

-- one Blood Strike per cycle keeps Desolation up; other Blood runes go to
-- Blood Boil
if ni.unit.buffremaining("player", MK_DESOLATION) < 3 then
    return true
end
