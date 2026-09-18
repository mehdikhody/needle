MK_FRAME_LINES = {}

if MK_FRAME_BASE_LAYER == nil then
    local side = MK_FRAME_SIDE or "TOPLEFT"
    local x, y = MK_FRAME_X or 20, MK_FRAME_Y or -20

    local FRAME = CreateFrame("Frame", "MK_FRAME_BASE_LAYER", UIParent)
    FRAME:SetPoint(side, UIParent, side, x, y)
    FRAME:SetSize(200, 50)
    FRAME:SetMovable(true)
    FRAME:EnableMouse(true)
    FRAME:Show()
    FRAME:SetScript("OnUpdate", function()
        if 
            MK_FRAME_BASE_LAYER 
            and MK_FRAME_TEXT_LAYER 
            and not ni.vars.profiles.enabled
        then
            MK_FRAME_TEXT_LAYER:Hide()
            MK_FRAME_BASE_LAYER:Hide()
            MK_FRAME_TEXT_LAYER = nil
            MK_FRAME_BASE_LAYER = nil
        end
    end)

    local DragHandle = CreateFrame("Frame", nil, FRAME)
    DragHandle:SetPoint("TOPLEFT", FRAME, "TOPLEFT", 0, 0)
    DragHandle:SetSize(20, 20)
    DragHandle:EnableMouse(true)
    DragHandle:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
    DragHandle:SetBackdropColor(0, 0, 0, 0)
    DragHandle:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            FRAME:StartMoving()
        end
    end)
    DragHandle:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            FRAME:StopMovingOrSizing()
            local frameSide, _, _, frameX, frameY = FRAME:GetPoint()
            MK_FRAME_SIDE = frameSide
            MK_FRAME_X = frameX
            MK_FRAME_Y = frameY
        end
    end)

    local fontpath = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\PTSansNarrow.ttf"
    local TEXT_FRAME = FRAME:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    TEXT_FRAME:SetPoint("TOPLEFT", FRAME, "TOPLEFT")
    TEXT_FRAME:SetJustifyH("LEFT")
    TEXT_FRAME:SetFont(fontpath, 16, "OUTLINE")
    TEXT_FRAME:SetTextColor(1, 1, 1)
    TEXT_FRAME:SetSpacing(5)
    TEXT_FRAME:SetShadowOffset(1, -1)
    TEXT_FRAME:SetShadowColor(0, 0, 0, 0.5)

    MK_FRAME_BASE_LAYER = FRAME
    MK_FRAME_TEXT_LAYER = TEXT_FRAME
end
