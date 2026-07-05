--[[
    OceanHub — Loader/DeviceConfig/DeviceConfig.lua
    Detects the user's device type and returns matching UI scale config.

    Returns:
        {
            type        = "PC"|"Laptop"|"Mac"|"HP",
            scale       = number,   -- UI scale multiplier
            cardWidth   = number,   -- Main card width (px)
            cardHeight  = number,   -- Main card height (px)
            fontSize    = number,   -- Base font size
            isMobile    = bool,
        }
]]

local UserInputService = game:GetService("UserInputService")
local GuiService       = game:GetService("GuiService")
local Players          = game:GetService("Players")

-- ── Read device presets ──────────────────────────────────────────────────
local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local DEVICE_DIR = "MainScript/Loader/DeviceConfig/Device/"

local presets = {}
for _, name in ipairs({"PC", "Laptop", "Mac", "HP"}) do
    local ok, result = pcall(function()
        local src = game:HttpGet(REPO_RAW .. DEVICE_DIR .. name .. ".lua")
        local fn = loadstring(src)
        if fn then return fn() end
    end)
    if ok and result then
        presets[name] = result
    end
end

-- ── Detect device ────────────────────────────────────────────────────────
local function detect()
    -- Mobile check first
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        return "HP"   -- HP preset is used for mobile/tablet
    end

    -- Get viewport size
    local vp = workspace.CurrentCamera.ViewportSize
    local w   = vp.X

    if w >= 1920 then
        return "PC"
    elseif w >= 1440 then
        return "Mac"
    elseif w >= 1280 then
        return "Laptop"
    else
        return "HP"
    end
end

local deviceType = detect()

-- ── Merge preset with defaults ───────────────────────────────────────────
local defaults = {
    PC     = { scale = 1.0,  cardWidth = 420, cardHeight = 320, fontSize = 15, isMobile = false },
    Laptop = { scale = 0.92, cardWidth = 400, cardHeight = 310, fontSize = 14, isMobile = false },
    Mac    = { scale = 0.96, cardWidth = 410, cardHeight = 315, fontSize = 14, isMobile = false },
    HP     = { scale = 0.82, cardWidth = 340, cardHeight = 280, fontSize = 13, isMobile = true  },
}

local cfg = defaults[deviceType] or defaults.PC

-- Overlay with loaded preset if available
if presets[deviceType] then
    for k, v in pairs(presets[deviceType]) do
        cfg[k] = v
    end
end

cfg.type = deviceType

return cfg
