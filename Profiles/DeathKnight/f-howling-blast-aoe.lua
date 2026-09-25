-- SpellId: MK_HOWLING_BLAST
if MK_AOE then
    local enemies = ni.unit.enemiesinrange("target", 10)
    if #enemies > 1 then
        return true
    end
end
