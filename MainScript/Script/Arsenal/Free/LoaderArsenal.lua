--[[
    OceanHub - Arsenal Free Script
    Features: Basic Aimbot & ESP Box
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Arsenal (Free Edition)"
})

local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Free" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Arsenal" })

local MainTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
MainTab:AddToggle({ Name = "Basic Aimbot", Keybind = "E", Default = false, Callback = function(val) print("[Arsenal Free] Aimbot set to:", val) end })

local VisualTab = Window:MakeTab({ Name = "Visuals", Icon = "rbxassetid://6031068452" })
VisualTab:AddToggle({ Name = "ESP Box", Keybind = "P", Default = false, Callback = function(val) print("[Arsenal Free] ESP Box set to:", val) end })

local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "Speed Multiplier", Min = 16, Max = 100, Default = 16,
    Callback = function(val) local char = game:GetService("Players").LocalPlayer.Character; if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = val end end })

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Arsenal Free Edition loaded!",
    Duration = 5
})
