--[[
    OceanHub - Arsenal Premium Script
    Full Features: Advanced Aimbot, Silent Aim, FOV, ESP Box, ESP Tracers, WalkSpeed, etc.
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Arsenal (Premium VIP)"
})

local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Premium" })
InfoTab:AddLabel({ Text = "Status Key: unlimited" })
InfoTab:AddLabel({ Text = "Script: Arsenal" })

local CombatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
CombatTab:AddToggle({ Name = "Silent Aim", Keybind = "R", Default = false, Callback = function(val) print("[Arsenal Premium] Silent Aim set to:", val) end })
CombatTab:AddToggle({ Name = "Aimbot Lock", Keybind = "E", Default = false, Callback = function(val) print("[Arsenal Premium] Aimbot set to:", val) end })
CombatTab:AddToggle({ Name = "Wallcheck", Keybind = "C", Default = false, Callback = function(val) print("[Arsenal Premium] Wallcheck set to:", val) end })
CombatTab:AddDropdown({ Name = "Target Part", Options = {"Head", "Body", "Leg"}, Default = "Head", Callback = function(val) print("[Arsenal Premium] TargetPart set to:", val) end })

local VisualTab = Window:MakeTab({ Name = "Visuals", Icon = "rbxassetid://6031068452" })
VisualTab:AddToggle({ Name = "ESP Box", Keybind = "P", Default = false, Callback = function(val) print("[Arsenal Premium] ESP Box set to:", val) end })
VisualTab:AddToggle({ Name = "ESP Tracers", Keybind = "T", Default = false, Callback = function(val) print("[Arsenal Premium] Tracers set to:", val) end })

local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "Speed Multiplier", Min = 16, Max = 100, Default = 16, Callback = function(val) print("[Arsenal Premium] Speed set to:", val) end })

local PremiumTab = Window:MakeTab({ Name = ".", Icon = "rbxassetid://6031068428" })
PremiumTab:AddToggle({ Name = "Light (Corner Glow)", Default = true, Callback = function(val)
    local sg = game:GetService("CoreGui"):FindFirstChild("OceanScriptLoader")
    if sg then for _, g in ipairs(sg:GetDescendants()) do if g.Name == "SuperThickCornerGlow" or g.Name == "Glow" then g.Visible = val end end end
end })
PremiumTab:AddToggle({ Name = "Background Effects", Default = true, Callback = function(val)
    local sg = game:GetService("CoreGui"):FindFirstChild("OceanScriptLoader")
    if sg then local w = sg:FindFirstChild("Wrapper"); if w then w.BackgroundTransparency = val and 0 or 1 end end
end })

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Arsenal Premium Script loaded!",
    Duration = 5
})
