--[[
    OceanHub - Arsenal Script Loader
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Arsenal",
    SubTitle = "ULTIMATE EDITION"
})

local MainTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://6031763426"
})

MainTab:AddToggle({
    Name = "Aimbot",
    Default = false,
    Callback = function(val)
        print("[Arsenal] Aimbot set to:", val)
    end
})

MainTab:AddToggle({
    Name = "Silent Aim",
    Default = false,
    Callback = function(val)
        print("[Arsenal] Silent Aim set to:", val)
    end
})

MainTab:AddSlider({
    Name = "FOV Radius",
    Min = 30,
    Max = 300,
    Default = 100,
    Callback = function(val)
        print("[Arsenal] FOV set to:", val)
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
        print("[Arsenal] ESP Box set to:", val)
    end
})

VisualTab:AddToggle({
    Name = "ESP Tracers",
    Default = false,
    Callback = function(val)
        print("[Arsenal] Tracers set to:", val)
    end
})

OceanLibrary:Notify({
    Title = "OceanHub",
    Content = "Arsenal script loaded successfully!",
    Duration = 5
})
