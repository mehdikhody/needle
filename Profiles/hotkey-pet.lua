local label
MK_PET_CONTROL, label = MK.BindToggle("pet", MK_PET_CONTROL, true)

local text = "(" .. label .. ") Pet Control"
if not HasPetSpells() then
    text = text .. " (no pet)"
end

MK.Status(text, MK_PET_CONTROL)
