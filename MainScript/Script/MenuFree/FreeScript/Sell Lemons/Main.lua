--[[
    OceanHub — FreeScript/Sell Lemons/Main.lua
]]

local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"

local OceanUI = loadstring(game:HttpGet(REPO_RAW .. "MainUI/LoaderUI/Main.lua"))()
local Fn      = loadstring(game:HttpGet(
    REPO_RAW .. "MainScript/Script/MenuFree/FreeScript/Sell Lemons/Funtion/Funtion.lua"
))()

local Window = OceanUI:CreateWindow({
    Title    = "OceanHub",
    Subtitle = "Free — Sell Lemons",
    Icon     = "rbxassetid://84718341622420",
})

local tab = Window:CreateTab({ Name = "🍋 Lemons", Icon = "🍋" })

tab:CreateToggle({
    Name     = "Auto Sell",
    Default  = false,
    Callback = function(v)
        if v then Fn.StartAutoSell(0.5) else Fn.StopAutoSell() end
    end,
})

tab:CreateSlider({
    Name     = "Sell Interval (s)",
    Min      = 0.1,
    Max      = 5,
    Default  = 0.5,
    Callback = function(v)
        Fn.StopAutoSell()
        Fn.StartAutoSell(v)
    end,
})
