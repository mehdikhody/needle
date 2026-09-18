if
    ni.unit.hp("target") <= 20
    and ni.unit.power("player") >= 30
then
    -- 47471 is max-rank Execute; MK_EXECUTE (5308) is rank 1
    ni.spell.cast(47471, "target")
    return true
end
