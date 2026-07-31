--[[
    OceanHub - Rivals Free Script
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Rivals (Free Edition)"
})

local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Free" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Rivals" })

local CombatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
CombatTab:AddToggle({ Name = "Basic Triggerbot", Keybind = "F", Default = false, Callback = function(val) print("[Rivals Free] Triggerbot set to:", val) end })

local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "Speed Multiplier", Min = 16, Max = 120, Default = 16,
    Callback = function(val) local char = game:GetService("Players").LocalPlayer.Character; if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = val end end })

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Rivals Free Edition loaded!",
    Duration = 5
})
