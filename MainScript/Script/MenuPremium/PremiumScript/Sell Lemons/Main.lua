--[[
    OceanHub — PremiumScript/Sell Lemons/Main.lua
]]

local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"

local OceanUI = loadstring(game:HttpGet(REPO_RAW .. "MainUI/LoaderUI/Main.lua"))()
local Fn      = loadstring(game:HttpGet(
    REPO_RAW .. "MainScript/Script/MenuPremium/PremiumScript/Sell Lemons/Funtion/Function.lua"
))()

local Window = OceanUI:CreateWindow({
    Title    = "OceanHub",
    Subtitle = "Premium — Sell Lemons",
    Icon     = "rbxassetid://84718341622420",
})

local tab = Window:CreateTab({ Name = "🍋 Lemons", Icon = "🍋" })

tab:CreateToggle({
    Name     = "Auto Sell",
    Default  = false,
    Callback = function(v)
        if v then Fn.StartAutoSell(0.3) else Fn.StopAutoSell() end
    end,
})

tab:CreateSlider({
    Name     = "Sell Interval (s)",
    Min      = 0.1,
    Max      = 5,
    Default  = 0.3,
    Callback = function(v)
        Fn.StopAutoSell(); Fn.StartAutoSell(v)
    end,
})

tab:CreateToggle({
    Name     = "Auto Collect Lemons",
    Default  = false,
    Callback = function(v)
        if v then Fn.StartAutoCollect(20) else Fn.StopAutoCollect() end
    end,
})

tab:CreateSlider({
    Name     = "Collect Range (studs)",
    Min      = 5,
    Max      = 100,
    Default  = 20,
    Callback = function(v)
        Fn.StopAutoCollect(); Fn.StartAutoCollect(v)
    end,
})
