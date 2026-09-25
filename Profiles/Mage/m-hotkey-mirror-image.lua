local label
MK_USE_MIRROR_IMAGE, label = MK.BindToggle("mirror-image", MK_USE_MIRROR_IMAGE, true)
MK.Status("(" .. label .. ") Mirror Image", MK_USE_MIRROR_IMAGE)
