--[[
    OceanHub - Blade Ball Premium Script
    Anti-Kick Bypass + Smart Auto Parry (humanized delays to avoid detection)
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
-- ANTI-KICK BYPASS (Same as Free, always active)
-- ═══════════════════════════════════════════════════
local antiKickActive = false

local function enableAntiKick()
    if antiKickActive then return end
    antiKickActive = true

    pcall(function()
        local oldKick = hookfunction(LP.Kick, function(self, ...)
            if self == LP then return end
            return oldKick(self, ...)
        end)
    end)

    pcall(function()
        local oldNC = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" and self == LP then return end
            if (method == "TeleportToPlaceInstance" or method == "Teleport") then
                local args = {...}
                if typeof(args[1]) == "number" and args[1] ~= game.PlaceId then return end
            end
            return oldNC(self, ...)
        end)
    end)

    pcall(function()
        for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                local n = string.lower(remote.Name)
                if string.find(n, "kick") or string.find(n, "ban") or string.find(n, "detect") then
                    remote.OnClientEvent:Connect(function() return end)
                end
            end
        end
    end)
end

enableAntiKick()

-- ═══════════════════════════════════════════════════
-- SMART AUTO PARRY (Humanized - avoids detection)
-- ═══════════════════════════════════════════════════
local AutoParrySettings = {
    Enabled = false,
    ParryDistance = 18,
    MinDelay = 0.05,  -- Minimum reaction delay (humanized)
    MaxDelay = 0.15,  -- Maximum reaction delay (humanized)
}

local lastParryTime = 0
local parryDebounce = false

-- Find the ball object in workspace
local function findBall()
    -- Blade Ball typically has a ball in workspace
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
            local name = string.lower(obj.Name)
            if string.find(name, "ball") or string.find(name, "blade") then
                return obj
            end
        end
        if obj:IsA("Model") then
            local name = string.lower(obj.Name)
            if string.find(name, "ball") or string.find(name, "blade") then
                local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                if primary then return primary end
            end
        end
    end
    return nil
end

-- Find the parry remote
local function findParryRemote()
    for _, remote in ipairs(ReplicatedStorage:GetDescendants()) do
        if remote:IsA("RemoteEvent") then
            local name = string.lower(remote.Name)
            if string.find(name, "parry") or string.find(name, "block") or string.find(name, "deflect") then
                return remote
            end
        end
    end
    return nil
end

-- Check if ball is targeting us
local function isBallTargetingUs(ball)
    if not ball or not ball.Parent then return false end
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return false end

    local root = char.HumanoidRootPart
    local dist = (ball.Position - root.Position).Magnitude

    if dist > AutoParrySettings.ParryDistance then return false end

    -- Check if ball is moving towards us
    if ball:IsA("BasePart") then
        local velocity = ball.AssemblyLinearVelocity or ball.Velocity
        if velocity and velocity.Magnitude > 5 then
            local dirToBall = (root.Position - ball.Position).Unit
            local ballDir = velocity.Unit
            local dot = dirToBall:Dot(ballDir)
            return dot > 0.3 -- Ball is moving towards us
        end
    end

    return dist <= AutoParrySettings.ParryDistance * 0.5
end

-- Auto Parry Loop
RunService.Heartbeat:Connect(function()
    if not AutoParrySettings.Enabled then return end
    if parryDebounce then return end

    local ball = findBall()
    if not ball then return end

    if isBallTargetingUs(ball) then
        parryDebounce = true

        -- Humanized delay (random between min and max)
        local delay = AutoParrySettings.MinDelay + math.random() * (AutoParrySettings.MaxDelay - AutoParrySettings.MinDelay)
        task.wait(delay)

        -- Try to parry via remote
        local parryRemote = findParryRemote()
        if parryRemote then
            pcall(function() parryRemote:FireServer() end)
        end

        -- Also try clicking (some versions use mouse click to parry)
        pcall(function()
            local vim = game:GetService("VirtualInputManager")
            vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.wait(0.05)
            vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end)

        -- Cooldown to prevent spam detection
        task.wait(0.3)
        parryDebounce = false
    end
end)

-- ═══ UI ═══
local ProtectTab = Window:MakeTab({
    Name = "Protection",
    Icon = "rbxassetid://6031763426"
})

ProtectTab:AddToggle({
    Name = "Anti-Kick Bypass",
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
    Callback = function(val) AutoParrySettings.Enabled = val end
})

ParryTab:AddSlider({
    Name = "Parry Distance",
    Min = 8,
    Max = 40,
    Default = 18,
    Callback = function(val) AutoParrySettings.ParryDistance = val end
})

ParryTab:AddSlider({
    Name = "Min Delay (x0.01s)",
    Min = 1,
    Max = 30,
    Default = 5,
    Callback = function(val) AutoParrySettings.MinDelay = val * 0.01 end
})

ParryTab:AddSlider({
    Name = "Max Delay (x0.01s)",
    Min = 5,
    Max = 50,
    Default = 15,
    Callback = function(val) AutoParrySettings.MaxDelay = val * 0.01 end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Blade Ball Premium loaded! Anti-Kick + Smart Auto Parry active.",
    Duration = 7
})
