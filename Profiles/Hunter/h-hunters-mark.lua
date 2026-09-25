-- SpellId: MK_HUNTERS_MARK
if UnitExists("target") then
    for i = 1, GetNumTrackingTypes() do
        local n, t, a, c = GetTrackingInfo(i)
        if string.find(n, UnitCreatureType('target')) then
            if a ~= 1 then
                SetTracking(i)
            end
        end
    end
end

local IMPROVED_HUNTERS_MARK = 19423

-- Returns the Improved Hunter's Mark rank (0-3), found by its localized name
-- so it doesn't depend on the talent's position in the tree.
local function improvedMarkRank()
    local improved = GetSpellInfo(IMPROVED_HUNTERS_MARK)
    for tab = 1, GetNumTalentTabs() do
        for index = 1, GetNumTalents(tab) do
            local name, _, _, _, rank = GetTalentInfo(tab, index)
            if name == improved then
                return rank
            end
        end
    end
    return 0
end

-- With the talent, only our own mark gives the bonus, so another hunter's
-- mark doesn't count and gets replaced.
local function hasMark()
    if improvedMarkRank() > 0 then
        return ni.unit.debuff("target", MK_HUNTERS_MARK, "player")
    end
    return ni.unit.debuff("target", MK_HUNTERS_MARK)
end

-- after each mark, wait 10s before marking again so target swaps don't spam it
if MK_HUNTERS_MARK_READY == nil then
    MK_HUNTERS_MARK_READY = true
end

if
    MK_HUNTERS_MARK_READY
    and UnitExists("target")
    and ni.unit.isboss("target")
    and not hasMark()
    and not MK.Include(UnitName("target"), {
        "Left Arm",
        "Right Arm",
        "Ice Sphere"
    })
then
    MK_HUNTERS_MARK_READY = false
    ni.delayfor(10, function()
        MK_HUNTERS_MARK_READY = true
    end)
    return true
end
