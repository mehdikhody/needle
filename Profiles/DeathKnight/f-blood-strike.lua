-- SpellId: MK_BLOOD_STRIKE
local epidemic = { GetTalentInfo(3, 4) }
if epidemic[5] == 0 then
    return true
end
