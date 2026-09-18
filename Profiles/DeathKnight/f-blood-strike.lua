local epidemic = { GetTalentInfo(3, 4) }
if epidemic[5] == 0 then
    ni.spell.cast(MK_BLOOD_STRIKE, "target")
    return true
end
