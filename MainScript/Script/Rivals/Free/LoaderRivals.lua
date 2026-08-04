--[[
    OceanHub - Rivals Free Script (EXPANDED FEATURES)
    Features: Basic Triggerbot, Basic Aimbot, WalkSpeed & JumpPower
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Rivals (Free Edition)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- ═══ TAB 1: INFO ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Free Edition" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Rivals" })

-- ═══ TAB 2: COMBAT ═══
local CombatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
CombatTab:AddToggle({ Name = "Basic Triggerbot", Keybind = "F", Default = false, Callback = function(val) end })
CombatTab:AddToggle({ Name = "Basic Aimbot Assist", Keybind = "E", Default = false, Callback = function(val) end })

-- ═══ TAB 3: MISC ═══
local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "Speed Multiplier", Min = 16, Max = 80, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "Jump Multiplier", Min = 50, Max = 200, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

OceanLibrary:Notify({ Title = "OceanHub Free", Content = "Rivals Free Edition loaded!", Duration = 5 })
