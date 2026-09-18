local group = "party"
local members = GetNumPartyMembers()

if GetNumRaidMembers() > 0 then
    group = "raid"
    members = GetNumRaidMembers()
end

local function hasCurseDebuff(unit)
    local debuffs, i = {}, 1
    local debuff = { UnitDebuff(unit, i) }

    while debuff[1] do
        debuffs[#debuffs + 1] = debuff
        i = i + 1
        debuff = { UnitDebuff(unit, i) }
    end

    for j = 1, #debuffs do
        if debuffs[j][5] == "Curse" then
            return true
        end
    end

    return false
end

if
    group == "party"
    and hasCurseDebuff("player")
then
    ni.vars.customtarget = "player"
    ni.spell.cast(MK_REMOVE_CURSE, ni.vars.customtarget)
    return true
end

for i = 1, members, 1 do
    local member = group .. tostring(i)
    if
        UnitInRange(member)
        and UnitIsFriend("player", member)
        and not UnitIsDeadOrGhost(member)
        and hasCurseDebuff(member)
    then
        ni.vars.customtarget = member
        ni.spell.cast(MK_REMOVE_CURSE, ni.vars.customtarget)
        return true
    end
end
