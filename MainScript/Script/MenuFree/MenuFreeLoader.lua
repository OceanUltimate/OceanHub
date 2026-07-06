--[[
    OceanHub — MenuFree/MenuFreeLoader.lua
    Loads the free script for the current game.
]]

local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local SCRIPTS_PATH = "MainScript/Script/MenuFree/FreeScript/"

local placeId = game.PlaceId

-- Map PlaceId → folder name
local gameMap = {
    [2753915549] = "Blox Fruits",
    [6284583030] = "Pet Simulator X",
    [7329895630] = "Anime Adventures",
    [2788229376] = "Da Hood",
    [286090429]  = "Arsenal",
}

local function loadScript(folder)
    local mainPath = REPO_RAW .. SCRIPTS_PATH .. folder .. "/Main.lua"
    local ok, err = pcall(function()
        local src = game:HttpGet(mainPath)
        if not src or src == "" then error("Empty response") end
        local fn, compErr = loadstring(src)
        if not fn then error("Compile: " .. tostring(compErr)) end
        fn()
    end)
    if not ok then
        warn("[OceanHub Free] Failed to load " .. folder .. ": " .. tostring(err))
    end
end

local folder = gameMap[placeId]
if folder then
    print("[OceanHub Free] Loading script for: " .. folder)
    loadScript(folder)
else
    -- Try Default fallback
    print("[OceanHub Free] No specific script for PlaceId " .. placeId .. ", loading Default.")
    loadScript("Default")
end
