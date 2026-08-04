--[[
    OceanHub - Blade Ball Free Script (EXPANDED FEATURES)
    Features: Basic Auto Parry, BAC Protection, WalkSpeed & JumpPower, Auto Click
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Blade Ball (Free)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local AntiKickState = true
pcall(function()
    local oldKick
    oldKick = hookfunction(LP.Kick, newcclosure(function(self, ...)
        if AntiKickState and self == LP then return end
        return oldKick(self, ...)
    end))
end)

local Settings = {
    AutoParry = false,
    ParryDistance = 15,
}

local parryDebounce = false
local cachedBall = nil

local function findBall()
    if cachedBall and cachedBall.Parent then return cachedBall end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored and (obj.Name == "Ball" or string.find(string.lower(obj.Name), "ball")) then
            cachedBall = obj; return obj
        end
    end
    return nil
end

local function doParry()
    pcall(function() if mouse1click then mouse1click() end end)
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.defer(function() pcall(function() vim:SendMouseButtonEvent(0, 0, 0, false, game, 1) end) end)
    end)
end

RunService.RenderStepped:Connect(function()
    if not Settings.AutoParry or parryDebounce then return end
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local ball = findBall()
    if not ball then return end

    local dist = (ball.Position - root.Position).Magnitude
    if dist <= Settings.ParryDistance or dist < 7 then
        parryDebounce = true
        doParry()
        task.wait(0.2)
        parryDebounce = false
    end
end)

-- ═══ TAB 1: INFO ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Free Edition" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Blade Ball" })

-- ═══ TAB 2: PROTECTION & AUTO PARRY ═══
local MainTab = Window:MakeTab({ Name = "Protection", Icon = "rbxassetid://6031763426" })
MainTab:AddToggle({ Name = "Basic Auto Parry", Keybind = "F", Default = false, Callback = function(val) Settings.AutoParry = val end })
MainTab:AddSlider({ Name = "Parry Distance", Min = 10, Max = 30, Default = 15, Callback = function(val) Settings.ParryDistance = val end })
MainTab:AddToggle({ Name = "BAC Anti-Kick Protection", Default = true, Callback = function(val) AntiKickState = val end })

-- ═══ TAB 3: MISC ═══
local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 100, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 250, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

OceanLibrary:Notify({ Title = "OceanHub Free", Content = "Blade Ball Free Edition loaded!", Duration = 5 })
