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

if
    MK_MARK
    and UnitExists("target")
    and ni.unit.isboss("target")
    and not ni.unit.debuff("target", MK_HUNTERS_MARK)
    and not MK_Include(UnitName("target"), {
        "Left Arm",
        "Right Arm",
        "Ice Sphere"
    })
then
    return true
end