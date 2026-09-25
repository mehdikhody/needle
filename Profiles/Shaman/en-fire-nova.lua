-- SpellId: MK_FIRE_NOVA
local hasTotem, name = GetTotemInfo(1)

if hasTotem and name ~= "" then
    return true
end
