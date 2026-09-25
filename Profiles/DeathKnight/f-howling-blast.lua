-- SpellId: MK_HOWLING_BLAST
if
    ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") >= 4 
    and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") >= 4 
then
    return true
end
