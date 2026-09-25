-- SpellId: MK_BLOOD_STRIKE
local epidemic = { GetTalentInfo(3, 4) }

if 
    epidemic[5] == 2
    and ni.unit.debuffremaining("target", MK_FROST_FEVER, "player") >= 15
    and ni.unit.debuffremaining("target", MK_BLOOD_PLAGUE, "player") >= 15
    and (GetRuneType(1) == 4) ~= (GetRuneType(2) == 4)
    and (MK_GetRuneCooldown(1) == 0) ~= (MK_GetRuneCooldown(2) == 0)
    and ni.unit.buff("player", MK_UNBREAKABLE_ARMOR)
    and ni.spell.cd(MK_EMPOWER_RUNE_WEAPON) == 0
    and MK_GetRuneCooldown(3) > 0
    and MK_GetRuneCooldown(4) > 0
    and MK_GetRuneCooldown(5) > 0
    and MK_GetRuneCooldown(6) > 0
    and ni.unit.inmelee("player", "target")
    and not UnitChannelInfo("player")
then
    local equipped = 0
    local items = {
        48503, 48505, 48501, 48502, 48504, -- Set 232
        48498, 48496, 48500, 48499, 48497, -- Set 245
        48493, 48495, 48491, 48492, 48494  -- Set 258
    }

    for _, itemId in pairs(items) do
        if ni.player.hasitemequipped(itemId) then
            equipped = equipped + 1
        end
    end

    if equipped >= 2 then
        return true
    end
end
