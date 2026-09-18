if
    ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") >= 4 
    and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") >= 4 
then
    ni.spell.cast(MK_HOWLING_BLAST, "target")
    return true
end
