--[[
    OceanHub - Blade Ball Premium Script
    Anti-Kick + Auto Parry (Xeno Executor Compatible)
    
    How it works:
    - Finds the ball in workspace (checks all descendants)
    - Checks if ball is targeting LocalPlayer via Attributes/ObjectValue
    - When ball is close + coming at us → simulate mouse click to parry
    - Uses humanized random delays to avoid anti-cheat detection
    - Uses mouse1click() which works on Xeno
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
-- ANTI-KICK (Xeno compatible)
-- ═══════════════════════════════════════════════════
local antiKickDone = false

local function enableAntiKick()
    if antiKickDone then return end
    antiKickDone = true

    pcall(function()
        local oldKick = hookfunction(LP.Kick, function(self, ...)
            if self == LP then return end
            return oldKick(self, ...)
        end)
    end)

    pcall(function()
        local oldNC
        oldNC = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" and self == LP then return end
            if (method == "Teleport" or method == "TeleportToPlaceInstance") then
                local args = {...}
                if typeof(args[1]) == "number" and args[1] ~= game.PlaceId then return end
            end
            return oldNC(self, ...)
        end))
    end)

    pcall(function()
        for _, v in ipairs(ReplicatedStorage:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                local n = string.lower(v.Name)
                if string.find(n, "kick") or string.find(n, "ban") or string.find(n, "detect") or string.find(n, "anti") then
                    v.OnClientEvent:Connect(function() return end)
                end
            end
        end
    end)
end

enableAntiKick()

-- ═══════════════════════════════════════════════════
-- AUTO PARRY SETTINGS
-- ═══════════════════════════════════════════════════
local Settings = {
    AutoParry = false,
    ParryDistance = 15,
    MinDelay = 0.08,
    MaxDelay = 0.18,
}

local parryDebounce = false
local lastBall = nil

-- ═══════════════════════════════════════════════════
-- FIND THE BALL (multiple methods)
-- ═══════════════════════════════════════════════════
local function findBall()
    -- Method 1: Check for known ball names in workspace
    local ballNames = {"ball", "blade", "soccerball", "dodgeball"}
    
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("UnionOperation")) then
            local name = string.lower(obj.Name)
            for _, bname in ipairs(ballNames) do
                if string.find(name, bname) then
                    -- Verify it's actually moving (real ball has velocity)
                    local vel = obj.AssemblyLinearVelocity
                    if vel and vel.Magnitude > 1 then
                        return obj
                    end
                    -- Even if not moving fast, if it exists return it
                    return obj
                end
            end
        end
    end
    
    -- Method 2: Look for any fast-moving small part (likely the ball)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored then
            local vel = obj.AssemblyLinearVelocity
            if vel and vel.Magnitude > 50 then
                local size = obj.Size
                if size.X < 10 and size.Y < 10 and size.Z < 10 then
                    -- Small fast-moving unanchored part = likely the ball
                    return obj
                end
            end
        end
    end
    
    return nil
end

-- ═══════════════════════════════════════════════════
-- CHECK IF BALL IS TARGETING US
-- ═══════════════════════════════════════════════════
local function isBallTargetingUs(ball)
    if not ball or not ball.Parent then return false end
    
    -- Method 1: Check Attributes on ball
    pcall(function()
        local target = ball:GetAttribute("Target") or ball:GetAttribute("target")
        if target then
            if typeof(target) == "Instance" and target == LP then return true end
            if typeof(target) == "string" and target == LP.Name then return true end
        end
    end)
    
    -- Method 2: Check ObjectValue children
    pcall(function()
        for _, child in ipairs(ball:GetChildren()) do
            if child:IsA("ObjectValue") and child.Value == LP then
                return true
            end
            if child:IsA("StringValue") and child.Value == LP.Name then
                return true
            end
        end
        -- Also check parent model if ball is inside a model
        if ball.Parent and ball.Parent:IsA("Model") then
            for _, child in ipairs(ball.Parent:GetChildren()) do
                if child:IsA("ObjectValue") and child.Value == LP then
                    return true
                end
            end
        end
    end)
    
    -- Method 3: Check direction + distance (fallback)
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return false end
    local root = char.HumanoidRootPart
    local dist = (ball.Position - root.Position).Magnitude
    
    if dist > Settings.ParryDistance then return false end
    
    -- Check velocity direction towards us
    local vel = ball.AssemblyLinearVelocity
    if vel and vel.Magnitude > 10 then
        local dirToUs = (root.Position - ball.Position).Unit
        local ballDir = vel.Unit
        local dot = dirToUs:Dot(ballDir)
        if dot > 0.4 then
            return true
        end
    end
    
    -- Very close = probably targeting us
    if dist < Settings.ParryDistance * 0.35 then
        return true
    end
    
    return false
end

-- ═══════════════════════════════════════════════════
-- DO PARRY (Xeno compatible - uses mouse1click)
-- ═══════════════════════════════════════════════════
local function doParry()
    -- Method 1: mouse1click (works on most executors including Xeno)
    pcall(function()
        if mouse1click then
            mouse1click()
        end
    end)
    
    -- Method 2: Fire parry/block remote directly
    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                local n = string.lower(remote.Name)
                if string.find(n, "parry") or string.find(n, "block")
                    or string.find(n, "deflect") or string.find(n, "swing") then
                    remote:FireServer()
                    break
                end
            end
        end
    end)
    
    -- Method 3: VirtualInputManager fallback
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait(0.03)
        vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end)
end

-- ═══════════════════════════════════════════════════
-- AUTO PARRY LOOP
-- ═══════════════════════════════════════════════════
RunService.Heartbeat:Connect(function()
    if not Settings.AutoParry then return end
    if parryDebounce then return end
    
    local ball = findBall()
    if not ball then return end
    
    if isBallTargetingUs(ball) then
        parryDebounce = true
        
        -- Humanized delay (random between min and max to avoid detection)
        local delay = Settings.MinDelay + math.random() * (Settings.MaxDelay - Settings.MinDelay)
        task.wait(delay)
        
        -- Execute parry
        doParry()
        
        -- Cooldown to prevent spam (anti-cheat evasion)
        task.wait(0.4 + math.random() * 0.2)
        parryDebounce = false
    end
end)

-- ═══════════════════════════════════════════════════
-- UI
-- ═══════════════════════════════════════════════════
local ProtectTab = Window:MakeTab({
    Name = "Protection",
    Icon = "rbxassetid://6031763426"
})

ProtectTab:AddLabel({ Text = "ANTI-KICK" })
ProtectTab:AddToggle({
    Name = "Anti-Kick (Always On)",
    Default = true,
    Callback = function(val) if val then enableAntiKick() end end
})

local ParryTab = Window:MakeTab({
    Name = "Auto Parry",
    Icon = "rbxassetid://6031068452"
})

ParryTab:AddToggle({
    Name = "Smart Auto Parry",
    Default = false,
    Callback = function(val) Settings.AutoParry = val end
})

ParryTab:AddSlider({
    Name = "Parry Distance",
    Min = 5,
    Max = 35,
    Default = 15,
    Callback = function(val) Settings.ParryDistance = val end
})

ParryTab:AddSlider({
    Name = "Min Delay (ms)",
    Min = 30,
    Max = 300,
    Default = 80,
    Callback = function(val) Settings.MinDelay = val / 1000 end
})

ParryTab:AddSlider({
    Name = "Max Delay (ms)",
    Min = 50,
    Max = 500,
    Default = 180,
    Callback = function(val) Settings.MaxDelay = val / 1000 end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Blade Ball Premium loaded! Anti-Kick + Smart Parry (Xeno OK)",
    Duration = 7
})
