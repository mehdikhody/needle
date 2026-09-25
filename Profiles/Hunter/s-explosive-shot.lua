-- SpellId: MK_EXPLOSIVE_SHOT
if not ni.unit.debuff("target", MK_EXPLOSIVE_SHOT, "player") then
    return true
end
