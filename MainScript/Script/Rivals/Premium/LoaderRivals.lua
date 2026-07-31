--[[
    OceanHub - Rivals Premium Script
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Rivals (Premium VIP)"
})

local CombatTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://6031763426"
})

CombatTab:AddToggle({
    Name = "Triggerbot",
    Default = false,
    Callback = function(val)
        print("[Rivals Premium] Triggerbot set to:", val)
    end
})

CombatTab:AddToggle({
    Name = "No Recoil",
    Default = false,
    Callback = function(val)
        print("[Rivals Premium] No Recoil set to:", val)
    end
})

CombatTab:AddSlider({
    Name = "Hitbox Expander",
    Min = 1,
    Max = 15,
    Default = 3,
    Callback = function(val)
        print("[Rivals Premium] Hitbox set to:", val)
    end
})

local MiscTab = Window:MakeTab({
    Name = "Movement",
    Icon = "rbxassetid://6031068426"
})

MiscTab:AddSlider({
    Name = "Speed Multiplier",
    Min = 16,
    Max = 120,
    Default = 16,
    Callback = function(val)
        print("[Rivals Premium] Speed set to:", val)
    end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Rivals Premium Script loaded!",
    Duration = 5
})
