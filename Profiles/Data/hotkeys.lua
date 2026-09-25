local MODIFIERS = {
    LCTRL = IsLeftControlKeyDown,
    LSHIFT = IsLeftShiftKeyDown,
    LALT = IsLeftAltKeyDown,
    RCTRL = IsRightControlKeyDown,
    RSHIFT = IsRightShiftKeyDown,
    RALT = IsRightAltKeyDown
}

local pressedAt = {}

-- Reports whether exactly the given modifiers are held, e.g. { "RSHIFT", "RALT" }.
function MK.Pressed(keys)
    local wanted = {}
    for _, key in ipairs(keys) do
        wanted[key] = true
    end

    for key, isDown in pairs(MODIFIERS) do
        if (isDown() and true or false) ~= (wanted[key] or false) then
            return false
        end
    end

    return true
end

-- Fires once when keys are pressed, then again every delay seconds (default
-- 0.5) while they stay held. name keeps each hotkey's timing separate.
function MK.KeyPress(name, keys, delay)
    if not MK.Pressed(keys) then
        pressedAt[name] = 0
        return false
    end

    if GetTime() - (pressedAt[name] or 0) <= (delay or 0.5) then
        return false
    end

    pressedAt[name] = GetTime()
    return true
end

-- Returns value flipped on each key press, or default while value is nil.
function MK.Toggle(name, keys, value, default, delay)
    if value == nil then
        value = default
    end

    if MK.KeyPress(name, keys, delay) then
        value = not value
    end

    return value
end

-- Numbered hotkeys get R Ctrl + <slot>, handed out in the order hotkeys first
-- ask for one (so rotation order decides the numbers).
local SLOTS = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }
local binds = {}
local bySlot = {}
local bindCount = 0

local function getBind(name)
    local bind = binds[name]
    if bind or bindCount >= #SLOTS then
        return bind
    end

    bindCount = bindCount + 1
    local slot = SLOTS[bindCount]
    bind = {
        label = "R Ctrl + " .. slot,
        presses = 0
    }

    binds[name] = bind
    bySlot[slot] = bind
    return bind
end

-- Normalizes NI's key to a digit string, whether it arrives as a virtual key
-- code (48-57) or as text.
local function toDigit(key)
    if type(key) == "number" and key >= 48 and key <= 57 then
        return string.char(key)
    end
    if type(key) == "string" and key:match("^%d$") then
        return key
    end
end

-- The first event for a key is its press; key repeat resends the same type
-- while held, and a different type means release. This avoids depending on
-- NI's (undocumented) keyType values. A long gap also counts as a new press,
-- in case a release was missed.
local held = {}
local lastSeen = {}

-- NI's native key hook sees every key before the game does. Returning true
-- swallows it, so R Ctrl + number never reaches the player's own binding,
-- while L Ctrl + number passes through untouched.
local function onKey(keyType, key)
    if MK_KEY_DEBUG then
        print("MK key", tostring(keyType), tostring(key), IsRightControlKeyDown() and "RCtrl" or "")
    end

    local digit = toDigit(key)
    local bind = digit and bySlot[digit]
    if not bind then
        return false
    end

    local now = GetTime()
    if now - (lastSeen[digit] or 0) > 1.5 then
        held[digit] = nil
    end
    lastSeen[digit] = now

    local press = held[digit]
    if press == nil then
        local ours = IsRightControlKeyDown()
            and not GetCurrentKeyBoardFocus()
            and ni.vars.profiles.enabled
        press = { type = keyType, ours = ours and true or false }
        held[digit] = press
        if press.ours then
            bind.presses = bind.presses + 1
        end
        return press.ours
    end

    -- repeat and release follow whoever owned the press
    if keyType ~= press.type then
        held[digit] = nil
    end
    return press.ours
end

ni.events.registerkeyevent("MK_HOTKEYS", onKey)

-- Returns true once per press of the hotkey's R Ctrl + number key, plus its
-- label, e.g. "R Ctrl + 1". The label is "no key" when all numbers are taken.
function MK.BindPress(name)
    local bind = getBind(name)
    if not bind then
        return false, "no key"
    end

    local pressed = bind.presses > 0
    bind.presses = 0
    return pressed, bind.label
end

-- MK.Toggle for R Ctrl + number hotkeys; also returns the key label.
function MK.BindToggle(name, value, default)
    if value == nil then
        value = default
    end

    local pressed, label = MK.BindPress(name)
    if pressed then
        value = not value
    end

    return value, label
end
