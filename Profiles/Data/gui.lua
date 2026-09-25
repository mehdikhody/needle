MK.FRAME = {
    SIDE = "TOPLEFT",
    X = 20,
    Y = -20,
    SHOWN = true,
    BASE = nil,
    TEXT = nil,
    LINES = {}
}

local FONT = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\PTSansNarrow.ttf"

local function destroy()
    MK.FRAME.TEXT:Hide()
    MK.FRAME.BASE:Hide()
    MK.FRAME.TEXT = nil
    MK.FRAME.BASE = nil
end

local function create()
    local state = MK.FRAME

    local frame = CreateFrame("Frame", nil, UIParent)
    frame:SetPoint(state.SIDE, UIParent, state.SIDE, state.X, state.Y)
    frame:SetSize(200, 50)
    frame:SetMovable(true)
    frame:EnableMouse(true)
    frame:Show()
    frame:SetScript("OnUpdate", function()
        if state.BASE and state.TEXT and not ni.vars.profiles.enabled then
            destroy()
        end
    end)

    local handle = CreateFrame("Frame", nil, frame)
    handle:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0)
    handle:SetSize(20, 20)
    handle:EnableMouse(true)
    handle:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
    handle:SetBackdropColor(0, 0, 0, 0)
    handle:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            frame:StartMoving()
        end
    end)
    handle:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            frame:StopMovingOrSizing()
            local side, _, _, x, y = frame:GetPoint()
            state.SIDE = side
            state.X = x
            state.Y = y
        end
    end)

    local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("TOPLEFT", frame, "TOPLEFT")
    text:SetJustifyH("LEFT")
    text:SetFont(FONT, 16, "OUTLINE")
    text:SetTextColor(1, 1, 1)
    text:SetSpacing(5)
    text:SetShadowOffset(1, -1)
    text:SetShadowColor(0, 0, 0, 0.5)

    state.BASE = frame
    state.TEXT = text
end

-- Starts a new tick: clears the lines and creates the frame if needed.
function MK.GuiBegin()
    MK.FRAME.LINES = {}

    if MK.FRAME.BASE == nil then
        create()
    end
end

-- Ends a tick: renders every line added since MK.GuiBegin.
function MK.GuiEnd()
    local state = MK.FRAME
    if not state.BASE or not state.TEXT then
        return
    end

    if state.SHOWN then
        state.BASE:Show()
    else
        state.BASE:Hide()
    end

    state.TEXT:SetText(table.concat(state.LINES, "\n"))
end

function MK.Line(text)
    table.insert(MK.FRAME.LINES, text)
end

-- Adds a "<label>: Enabled/Disabled" line. Enabled is green unless inverted.
function MK.Status(label, enabled, inverted)
    local good = enabled
    if inverted then
        good = not enabled
    end

    local color = good and "3EC205" or "C70039"
    local state = enabled and "Enabled" or "Disabled"
    MK.Line(label .. ": \124cFF" .. color .. state .. "\124r")
end
