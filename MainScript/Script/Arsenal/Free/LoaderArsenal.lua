--[[
    OceanHub - Arsenal Free Script
    Features: Basic Aimbot & ESP Box
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Arsenal (Free Edition)"
})

local MainTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://6031763426"
})

MainTab:AddToggle({
    Name = "Basic Aimbot",
    Default = false,
    Callback = function(val)
        print("[Arsenal Free] Aimbot set to:", val)
    end
})

local VisualTab = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://6031068452"
})

VisualTab:AddToggle({
    Name = "ESP Box",
    Default = false,
    Callback = function(val)
        print("[Arsenal Free] ESP Box set to:", val)
    end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Arsenal Free Edition loaded!",
    Duration = 5
})
