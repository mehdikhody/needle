if ni.unit.hp("player") <= 25 then
    local stones = { 36892, 36893, 36894 }
    for i = 1, #stones do
        if ni.player.itemready(stones[i]) then
            ni.player.useitem(stones[i])
            break
        end
    end
end
