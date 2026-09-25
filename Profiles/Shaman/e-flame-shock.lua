-- SpellId: MK_FLAME_SHOCK
if not ni.unit.debuff("target", MK_FLAME_SHOCK, "player") then
    return true
end
