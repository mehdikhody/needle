if MK_AOE then
    local enemies = ni.unit.enemiesinrange("target", 10)
    if #enemies > 1 then
        ni.spell.cast(MK_HOWLING_BLAST, "target")
        return true
    end
end
