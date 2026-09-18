local epidemic = { GetTalentInfo(3, 4) }

if epidemic[5] == 2 then
    if
        ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") >= 4
        and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") >= 4
    then
        ni.spell.cast(MK_OBLITERATE, "target")
        return true
    end
else
    if ni.spell.available(MK_OBLITERATE) then
        ni.spell.cast(MK_OBLITERATE, "target")
    end
    return true
end
