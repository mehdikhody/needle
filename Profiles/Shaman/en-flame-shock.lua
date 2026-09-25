-- SpellId: MK_FLAME_SHOCK
-- Target: target
if not ni.unit.debuff("target", MK_FLAME_SHOCK, "player") then
    return true
end
