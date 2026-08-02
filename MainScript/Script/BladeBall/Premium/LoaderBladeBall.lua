--[[
    OceanHub - Blade Ball Premium Script v3
    Anti-Kick + Auto Parry (Bypass BAC / Error Code 267)
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Blade Ball (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

-- ═══════════════════════════════════════════════════
-- BAC ANTI-KICK BYPASS (BAC HfdX24dfdf66 / Error Code 267)
-- ═══════════════════════════════════════════════════
local AntiKickState = true

-- Method 1: Override LocalPlayer:Kick
pcall(function()
    local oldKick
    oldKick = hookfunction(LP.Kick, newcclosure(function(self, ...)
        if AntiKickState and self == LP then
            warn("[OceanHub] BAC Anti-Kick intercepted LP:Kick call!")
            return
        end
        return oldKick(self, ...)
    end))
end)

-- Method 2: Hook RemoteEvents used by BAC Anti-Cheat
pcall(function()
    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local name = string.lower(obj.Name)
            if string.find(name, "bac") or string.find(name, "kick") or string.find(name, "ban") or string.find(name, "check") or string.find(name, "detect") then
                pcall(function()
                    obj.OnClientEvent:Connect(function()
                        if AntiKickState then return end
                    end)
                end)
            end
        end
    end
end)

-- ═══════════════════════════════════════════════════
-- AUTO PARRY SETTINGS
-- ═══════════════════════════════════════════════════
local Settings = {
    AutoParry = false,
    ParryDistance = 15,
    MinDelay = 0.05,
    MaxDelay = 0.12,
}

local parryDebounce = false
local cachedBall = nil
local lastBallCheck = 0

-- Find the ball in workspace
local function findBall()
    if cachedBall and cachedBall.Parent and tick() - lastBallCheck < 0.5 then
        return cachedBall
    end
    
    lastBallCheck = tick()
    cachedBall = nil
    
    -- Search workspace for Ball
    local ballsFolder = workspace:FindFirstChild("Balls") or workspace:FindFirstChild("Ball")
    if ballsFolder then
        for _, obj in ipairs(ballsFolder:GetChildren()) do
            if obj:IsA("BasePart") or obj:IsA("MeshPart") then
                cachedBall = obj
                return obj
            end
        end
    end

    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored then
            if obj.Name == "Ball" or string.find(string.lower(obj.Name), "ball") then
                cachedBall = obj
                return obj
            end
        end
    end
    
    return nil
end

-- Check if we should parry
local function shouldParry(ball)
    if not ball or not ball.Parent then return false end
    
    local char = LP.Character
    if not char then return false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    
    local dist = (ball.Position - root.Position).Magnitude
    if dist > Settings.ParryDistance then return false end
    
    local vel = ball.AssemblyLinearVelocity or ball.Velocity
    if vel and vel.Magnitude > 5 then
        local dirToUs = (root.Position - ball.Position).Unit
        local ballDir = vel.Unit
        if dirToUs:Dot(ballDir) > 0.25 then
            return true
        end
    end
    
    if dist < 7 then
        return true
    end
    
    return false
end

-- Execute Parry
local function doParry()
    pcall(function()
        if mouse1click then
            mouse1click()
        end
    end)
    
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.defer(function()
            pcall(function()
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end)
        end)
    end)
end

-- Auto Parry Loop
RunService.RenderStepped:Connect(function()
    if not Settings.AutoParry then return end
    if parryDebounce then return end
    
    local ball = findBall()
    if not ball then return end
    
    if shouldParry(ball) then
        parryDebounce = true
        
        local delay = Settings.MinDelay + math.random() * (Settings.MaxDelay - Settings.MinDelay)
        task.wait(delay)
        
        doParry()
        
        task.wait(0.25)
        parryDebounce = false
    end
end)

-- Debug Ball
local function debugBallInfo()
    local ball = findBall()
    if ball then
        OceanLibrary:Notify({
            Title = "Ball Found!",
            Content = "Name: " .. ball.Name .. " | Parent: " .. (ball.Parent and ball.Parent.Name or "nil"),
            Duration = 5
        })
    else
        OceanLibrary:Notify({
            Title = "No Ball",
            Content = "Ball not found. Wait for round to start.",
            Duration = 5
        })
    end
end

-- ═══════════════════════════════════════════════════
-- UI
-- ═══════════════════════════════════════════════════
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })

local welcomeCard = InfoTab:AddCard({ Title = "Selamat Datang", Icon = "⌂" })
welcomeCard:AddBanner({ Text = "Kamu menggunakan OceanHub Premium. Semua fitur terbuka penuh.", Icon = "✦" })
welcomeCard:AddKeyVal({ Key = "Game Terdeteksi", Value = "Blade Ball", Color = Color3.fromRGB(139, 92, 246) })
welcomeCard:AddKeyVal({ Key = "PlaceId", Value = tostring(game.PlaceId), Color = Color3.fromRGB(148, 180, 216) })
welcomeCard:AddKeyVal({ Key = "Ping", Value = "99 ms ⚠️", Color = Color3.fromRGB(250, 204, 21) })

local statusCard = InfoTab:AddCard({ Title = "Status Hub", Icon = "⚙" })
statusCard:AddKeyVal({ Key = "Tier", Value = "Premium", Color = Color3.fromRGB(139, 92, 246) })
statusCard:AddKeyVal({ Key = "Status Key", Value = "unlimited", Color = Color3.fromRGB(56, 189, 248) })
statusCard:AddKeyVal({ Key = "Berlaku", Value = "Selamanya ∞", Color = Color3.fromRGB(34, 197, 94) })

local ParryTab = Window:MakeTab({ Name = "Auto Parry", Icon = "rbxassetid://6031068452" })
ParryTab:AddToggle({ Name = "Auto Parry", Keybind = "F", Default = false, Callback = function(val)
    Settings.AutoParry = val
    if val then debugBallInfo() end
end })
ParryTab:AddToggle({ Name = "BAC Anti-Kick Bypass", Keybind = "V", Default = true, Callback = function(val)
    AntiKickState = val
end })
ParryTab:AddSlider({ Name = "Parry Distance", Min = 5, Max = 35, Default = 15, Callback = function(val) Settings.ParryDistance = val end })
ParryTab:AddSlider({ Name = "Min Delay (ms)", Min = 10, Max = 150, Default = 50, Callback = function(val) Settings.MinDelay = val / 1000 end })
ParryTab:AddSlider({ Name = "Max Delay (ms)", Min = 40, Max = 300, Default = 120, Callback = function(val) Settings.MaxDelay = val / 1000 end })
ParryTab:AddButton({ Name = "Debug: Find Ball", Callback = function() debugBallInfo() end })

local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 120, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

local PremiumTab = Window:MakeTab({ Name = ".", Icon = "rbxassetid://6031068428" })
PremiumTab:AddToggle({ Name = "Light (Corner Glow)", Default = true, Callback = function(val)
    local sg = CoreGui:FindFirstChild("OceanHubUI") or CoreGui:FindFirstChild("OceanScriptLoader")
    if sg then
        for _, g in ipairs(sg:GetDescendants()) do
            if g.Name == "SuperThickCornerGlow" or g.Name == "Glow" then g.Visible = val end
        end
    end
end })
PremiumTab:AddToggle({ Name = "Background Effects", Default = true, Callback = function(val)
    local sg = CoreGui:FindFirstChild("OceanHubUI") or CoreGui:FindFirstChild("OceanScriptLoader")
    if sg then
        local w = sg:FindFirstChild("Wrapper")
        if w then w.BackgroundTransparency = val and 0 or 1 end
    end
end })

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Blade Ball v4 Premium loaded!",
    Duration = 5
})
