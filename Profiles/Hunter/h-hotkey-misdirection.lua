local label
MK_MD, label = MK.BindToggle("misdirection", MK_MD, false)

local text = "(" .. label .. ") Misdirection"
MK.Status(text, MK_MD)
