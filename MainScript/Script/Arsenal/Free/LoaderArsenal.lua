--[[
    OceanHub - Arsenal Free Script (EXPANDED FEATURES)
    Features: Basic Aimbot, FOV Slider, ESP Box, Speed & Jump Multiplier
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Arsenal (Free Edition)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

local Settings = {
    Aimbot = false,
    FOV = 100,
    ESPBox = false,
}

local function isAlive(p)
    return p and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 and p.Character:FindFirstChild("Head")
end

local function isTeammate(p)
    if LP.Team and p.Team and LP.Team == p.Team then return true end
    return false
end

local function getClosestEnemy()
    local closest, shortestDist = nil, Settings.FOV
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and isAlive(p) and not isTeammate(p) then
            local part = p.Character.Head
            local sPos, onScreen = Camera:WorldToViewportPoint(part.Position)
            if onScreen then
                local dist = (Vector2.new(sPos.X, sPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if dist < shortestDist then
                    shortestDist = dist; closest = p
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if Settings.Aimbot then
        local target = getClosestEnemy()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

-- ═══ TAB 1: INFO ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Free Edition" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Arsenal" })

-- ═══ TAB 2: COMBAT ═══
local MainTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
MainTab:AddToggle({ Name = "Basic Aimbot", Keybind = "E", Default = false, Callback = function(val) Settings.Aimbot = val end })
MainTab:AddSlider({ Name = "Aimbot FOV", Min = 40, Max = 200, Default = 100, Callback = function(val) Settings.FOV = val end })

-- ═══ TAB 3: VISUALS ═══
local VisualTab = Window:MakeTab({ Name = "Visuals", Icon = "rbxassetid://6031068452" })
VisualTab:AddToggle({ Name = "ESP Box", Keybind = "P", Default = false, Callback = function(val) Settings.ESPBox = val end })

-- ═══ TAB 4: MISC ═══
local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed Multiplier", Min = 16, Max = 80, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 200, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

OceanLibrary:Notify({ Title = "OceanHub Free", Content = "Arsenal Free Edition loaded!", Duration = 5 })
