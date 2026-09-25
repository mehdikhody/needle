-- SpellId: MK_FLAMETONGUE_WEAPON
local hasMainHand, _, _, hasOffHand = GetWeaponEnchantInfo()

if
    hasMainHand
    and not hasOffHand
    and OffhandHasWeapon()
then
    return true
end
