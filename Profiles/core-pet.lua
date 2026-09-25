local AERIAL_COMMAND_UNIT_CHANNEL = 63293

local function isAerialCommandUnitChanneling()
    return MK.EachNameplate(function(unit)
        if
            UnitName(unit) == "Aerial Command Unit"
            and select(8, UnitChannelInfo(unit)) == AERIAL_COMMAND_UNIT_CHANNEL
        then
            return true
        end
    end) or false
end

local function isPetOnPriorityTarget()
    return (
        UnitExists("pettarget")
        and not UnitIsDead("pettarget")
        and MK.Include(UnitName("pettarget"), MK.PET_PRIORITY)
    )
end

local function shouldPetAttack(targetName)
    if
        not MK_ROTATION
        or not UnitExists("target")
        or not UnitAffectingCombat("player")
        or ni.unit.hp("pet") <= 20
        or MK.Include(targetName, MK.PET_IGNORED)
    then
        return false
    end

    if
        MK.Include(targetName, MK.MIMIRON_TARGETS)
        and isAerialCommandUnitChanneling()
    then
        return false
    end

    return true
end

local targetName = UnitName("target")

if
    not MK_ROTATION
    or MK.Include(targetName, MK.PET_IGNORED)
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
