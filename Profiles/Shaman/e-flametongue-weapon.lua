local WE = { GetWeaponEnchantInfo() }

if WE[2] == nil then
    ni.spell.cast(MK_FLAMETONGUE_WEAPON)
    return true
end
