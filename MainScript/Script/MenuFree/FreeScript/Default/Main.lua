--[[
    OceanHub — FreeScript/Default/Main.lua
    Default free hub UI. Loads OceanUI and builds a basic tab.
]]

local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"

-- Load OceanUI
local OceanUI = loadstring(game:HttpGet(REPO_RAW .. "MainUI/LoaderUI/Main.lua"))()
local Fn      = loadstring(game:HttpGet(REPO_RAW .. "MainScript/Script/MenuFree/FreeScript/Default/Function/Funtion.lua"))()

local Window = OceanUI:CreateWindow({
    Title    = "OceanHub",
    Subtitle = "Free — Default",
    Icon     = "rbxassetid://84718341622420",
})

local tab = Window:CreateTab({ Name = "⚡ Movement", Icon = "⚡" })

tab:CreateSlider({
    Name    = "Walk Speed",
    Min     = 16,
    Max     = 300,
    Default = 16,
    Callback = function(v) Fn.SetWalkSpeed(v) end,
})

tab:CreateSlider({
    Name    = "Jump Power",
    Min     = 50,
    Max     = 500,
    Default = 50,
    Callback = function(v) Fn.SetJumpPower(v) end,
})

tab:CreateToggle({
    Name     = "Noclip",
    Default  = false,
    Callback = function(v) Fn.SetNoclip(v) end,
})

tab:CreateToggle({
    Name     = "Infinite Jump",
    Default  = false,
    Callback = function(v) Fn.SetInfJump(v) end,
})
