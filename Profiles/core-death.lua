if MK_DEATH_TIME == nil then MK_DEATH_TIME = 0 end
if UnitAffectingCombat("player") then MK_DEATH_TIME = 0 end
if GetTime() - MK_DEATH_TIME > 20 then MK_DEATH_TIME = 0 end
if UnitIsDeadOrGhost("player") then MK_DEATH_TIME = GetTime() end
if MK_DEATH_TIME ~= 0 then return true end
