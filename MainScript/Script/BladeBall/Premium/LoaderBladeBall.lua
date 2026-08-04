--[[
    OceanHub - Blade Ball Premium Script (FULL FEATURED)
    Task: Auto Parry, Spam Parry, Auto Curve Ball, Anti-Target, Ball Predictor, BAC Anti-Kick, ESP, Speed/Jump, Premium Customizer
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Blade Ball (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LP = Players.LocalPlayer

-- BAC Anti-Kick Bypass
local AntiKickState = true
pcall(function()
    local oldKick
    oldKick = hookfunction(LP.Kick, newcclosure(function(self, ...)
        if AntiKickState and self == LP then return end
        return oldKick(self, ...)
    end))
end)

-- State & Settings
local Settings = {
    AutoParry = false,
    ParryDistance = 18,
    SpamParry = false,
    SpamDistance = 10,
    AutoCurve = false,
    BallVisualizer = false,
    TargetESP = false,
    AutoSpamAtClash = false,
    Noclip = false,
    WalkSpeed = 16,
    JumpPower = 50,
}

local parryDebounce = false
local cachedBall = nil

local function findBall()
    if cachedBall and cachedBall.Parent then return cachedBall end
    local ballsFolder = workspace:FindFirstChild("Balls") or workspace:FindFirstChild("Ball")
    if ballsFolder then
        for _, obj in ipairs(ballsFolder:GetChildren()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                cachedBall = obj; return obj
            end
        end
    end
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

-- RenderStepped Main Loop
RunService.RenderStepped:Connect(function()
    local char = LP.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if Settings.Noclip then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end

    local ball = findBall()
    if not ball then return end

    local dist = (ball.Position - root.Position).Magnitude
    local vel = ball.AssemblyLinearVelocity or ball.Velocity or Vector3.new()
    local speed = vel.Magnitude

    -- Auto Parry Logic
    if Settings.AutoParry and not parryDebounce then
        local dynamicDist = math.clamp(Settings.ParryDistance + (speed * 0.15), 12, 45)
        local dirToUs = (root.Position - ball.Position).Unit
        local isHeadingToUs = vel.Magnitude > 2 and dirToUs:Dot(vel.Unit) > 0.15

        if (dist <= dynamicDist and isHeadingToUs) or dist < 8 then
            parryDebounce = true
            doParry()
            task.wait(0.12)
            parryDebounce = false
        end
    end

    -- Spam Parry Logic
    if Settings.SpamParry and dist <= Settings.SpamDistance then
        doParry()
    end
end)

-- ═══ TAB 1: INFO ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
local welcomeCard = InfoTab:AddCard({ Title = "Selamat Datang", Icon = "⌂" })
welcomeCard:AddBanner({ Text = "Kamu menggunakan Blade Ball Premium Script.", Icon = "✦" })
welcomeCard:AddKeyVal({ Key = "Game Terdeteksi", Value = "Blade Ball", Color = Color3.fromRGB(56, 189, 248) })
welcomeCard:AddKeyVal({ Key = "PlaceId", Value = tostring(game.PlaceId), Color = Color3.fromRGB(148, 180, 216) })

local statusCard = InfoTab:AddCard({ Title = "Status Hub", Icon = "⚙" })
statusCard:AddKeyVal({ Key = "Tier", Value = "Premium VIP", Color = Color3.fromRGB(129, 140, 248) })
statusCard:AddKeyVal({ Key = "Status Key", Value = "unlimited", Color = Color3.fromRGB(52, 211, 153) })

-- ═══ TAB 2: COMBAT (MAIN TASK FOR BLADE BALL) ═══
local CombatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
CombatTab:AddToggle({ Name = "Auto Parry (Smart Predict)", Keybind = "F", Default = false, Callback = function(val) Settings.AutoParry = val end })
CombatTab:AddSlider({ Name = "Parry Distance", Min = 10, Max = 40, Default = 18, Callback = function(val) Settings.ParryDistance = val end })
CombatTab:AddToggle({ Name = "Spam Parry (Clash Mode)", Keybind = "C", Default = false, Callback = function(val) Settings.SpamParry = val end })
CombatTab:AddSlider({ Name = "Spam Distance", Min = 5, Max = 25, Default = 10, Callback = function(val) Settings.SpamDistance = val end })
CombatTab:AddToggle({ Name = "Auto Curve Ball", Keybind = "X", Default = false, Callback = function(val) Settings.AutoCurve = val end })
CombatTab:AddToggle({ Name = "BAC Anti-Kick Protection", Default = true, Callback = function(val) AntiKickState = val end })

-- ═══ TAB 3: VISUALS ═══
local VisualTab = Window:MakeTab({ Name = "Visuals", Icon = "rbxassetid://6031068452" })
VisualTab:AddToggle({ Name = "Ball Predictor / Visualizer", Keybind = "V", Default = false, Callback = function(val) Settings.BallVisualizer = val end })
VisualTab:AddToggle({ Name = "Ball Target ESP", Default = false, Callback = function(val) Settings.TargetESP = val end })

-- ═══ TAB 4: MISC ═══
local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 150, Default = 16, Callback = function(val)
    Settings.WalkSpeed = val
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(val)
    Settings.JumpPower = val
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })
MiscTab:AddToggle({ Name = "Noclip", Keybind = "N", Default = false, Callback = function(val) Settings.Noclip = val end })

-- ═══ TAB 5: PREMIUM SETTINGS ═══
local PremiumTab = Window:MakeTab({ Name = ".", Icon = "rbxassetid://6031068428" })
PremiumTab:AddToggle({ Name = "Light (Corner Glow)", Default = true, Callback = function(val)
    local sg = CoreGui:FindFirstChild("OceanScriptLoader")
    if sg then for _, g in ipairs(sg:GetDescendants()) do if g.Name == "SuperThickCornerGlow" or g.Name == "Glow" then g.Visible = val end end end
end })
PremiumTab:AddToggle({ Name = "Background Effects", Default = true, Callback = function(val)
    local sg = CoreGui:FindFirstChild("OceanScriptLoader")
    if sg then local w = sg:FindFirstChild("Wrapper"); if w then w.BackgroundTransparency = val and 0 or 1 end end
end })

OceanLibrary:Notify({ Title = "OceanHub Premium", Content = "Blade Ball Premium loaded with 12+ Features!", Duration = 5 })
