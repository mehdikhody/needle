-- SpellId: 47471
if
    ni.unit.hp("target") <= 20
    and ni.unit.power("player") >= 30
then
    -- 47471 is max-rank Execute; MK_EXECUTE (5308) is rank 1
    return true
end
