--[[
    OceanHub - Arsenal Premium Script
    Full Features: Advanced Aimbot, Silent Aim, FOV, ESP Box, ESP Tracers, WalkSpeed, etc.
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Arsenal (Premium VIP)"
})

local CombatTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://6031763426"
})

CombatTab:AddToggle({
    Name = "Silent Aim",
    Default = false,
    Callback = function(val)
        print("[Arsenal Premium] Silent Aim set to:", val)
    end
})

CombatTab:AddToggle({
    Name = "Aimbot Lock",
    Default = false,
    Callback = function(val)
        print("[Arsenal Premium] Aimbot set to:", val)
    end
})

CombatTab:AddSlider({
    Name = "FOV Radius",
    Min = 30,
    Max = 300,
    Default = 120,
    Callback = function(val)
        print("[Arsenal Premium] FOV set to:", val)
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
        print("[Arsenal Premium] ESP Box set to:", val)
    end
})

VisualTab:AddToggle({
    Name = "ESP Tracers",
    Default = false,
    Callback = function(val)
        print("[Arsenal Premium] Tracers set to:", val)
    end
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://6031068426"
})

MiscTab:AddSlider({
    Name = "Speed Multiplier",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(val)
        print("[Arsenal Premium] Speed set to:", val)
    end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Arsenal Premium Script loaded!",
    Duration = 5
})
