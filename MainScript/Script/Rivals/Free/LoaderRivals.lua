--[[
    OceanHub - Rivals Free Script
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Rivals (Free Edition)"
})

local CombatTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://6031763426"
})

CombatTab:AddToggle({
    Name = "Basic Triggerbot",
    Default = false,
    Callback = function(val)
        print("[Rivals Free] Triggerbot set to:", val)
    end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Rivals Free Edition loaded!",
    Duration = 5
})
