-- SpellId: MK_MIRROR_IMAGE
if
    MK_USE_MIRROR_IMAGE
    and MK_COOLDOWNS
    and ni.unit.isboss("target")
then
    return true
end
