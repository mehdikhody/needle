local IGNORED_TARGETS = {
    "Crusher Tentacle"
}

local MIMIRON_TARGETS = {
    "Aerial Command Unit",
    "VX-001",
    "Leviathan Mk II"
}

-- once the pet is on one of these, it stays there until the unit dies
local PRIORITY_PET_TARGETS = {
    "Kinetic Bomb",
    "Raging Spirit"
}

local AERIAL_COMMAND_UNIT_CHANNEL = 63293

local function isAerialCommandUnitChanneling()
    for i = 1, 60 do
        local unit = "nameplate" .. i
        if
            UnitName(unit) == "Aerial Command Unit"
            and select(8, UnitChannelInfo(unit)) == AERIAL_COMMAND_UNIT_CHANNEL
        then
            return true
        end
    end
    return false
end

local function isPetOnPriorityTarget()
    return (
        UnitExists("pettarget")
        and not UnitIsDead("pettarget")
        and MK_Include(UnitName("pettarget"), PRIORITY_PET_TARGETS)
    )
end

local function shouldPetAttack(targetName)
    if
        not MK_ROTATION
        or not UnitExists("target")
        or not UnitAffectingCombat("player")
        or ni.unit.hp("pet") <= 20
        or MK_Include(targetName, IGNORED_TARGETS)
    then
        return false
    end

    if
        MK_Include(targetName, MIMIRON_TARGETS)
        and isAerialCommandUnitChanneling()
    then
        return false
    end

    return true
end

local targetName = UnitName("target")

if
    not MK_ROTATION
    or MK_Include(targetName, IGNORED_TARGETS)
then
    PetStopAttack()
end

if
    MK_PET_CONTROL
    and UnitExists("pet")
    and not UnitIsDead("pet")
    and not isPetOnPriorityTarget()
then
    if shouldPetAttack(targetName) then
        if not UnitIsUnit("pettarget", "target") then
            PetAttack()
        end
    elseif IsPetAttackActive() then
        PetStopAttack()
    end
end
