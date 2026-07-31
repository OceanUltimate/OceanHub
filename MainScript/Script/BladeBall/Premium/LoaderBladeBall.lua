--[[
    OceanHub - Blade Ball Premium Script v2
    Anti-Kick + Auto Parry (Xeno Executor Compatible)
    
    FIXED: 
    - Removed aggressive hookmetamethod that broke BallReplicationHandler
    - Better ball detection (checks Shape, Anchored, velocity)
    - Uses mouse1click() for Xeno
    - Safer anti-kick that doesn't interfere with game scripts
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
-- ANTI-KICK (Safe method - doesn't break game scripts)
-- ═══════════════════════════════════════════════════
pcall(function()
    local oldKick = LP.Kick
    LP.Kick = function(self, ...)
        if self == LP then
            warn("[OceanHub] Kick blocked")
            return
        end
        return oldKick(self, ...)
    end
end)

-- ═══════════════════════════════════════════════════
-- AUTO PARRY SETTINGS
-- ═══════════════════════════════════════════════════
local Settings = {
    AutoParry = false,
    ParryDistance = 15,
    MinDelay = 0.06,
    MaxDelay = 0.16,
}

local parryDebounce = false
local cachedBall = nil
local lastBallCheck = 0

-- ═══════════════════════════════════════════════════
-- FIND THE BALL (optimized, cached)
-- ═══════════════════════════════════════════════════
local function findBall()
    -- Use cache if checked recently and still valid
    if cachedBall and cachedBall.Parent and tick() - lastBallCheck < 1 then
        return cachedBall
    end
    
    lastBallCheck = tick()
    cachedBall = nil
    
    -- Search entire workspace for the ball
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("UnionOperation")) then
            -- Check 1: Named "Ball" (most common)
            if obj.Name == "Ball" then
                cachedBall = obj
                return obj
            end
            
            -- Check 2: Unanchored sphere shape with velocity
            if not obj.Anchored then
                local ok, shape = pcall(function() return obj.Shape end)
                if ok and shape == Enum.PartType.Ball then
                    cachedBall = obj
                    return obj
                end
            end
        end
    end
    
    -- Check 3: Look for ball inside common folders
    local folders = {"Balls", "Ball", "BallFolder", "GameBall", "ActiveBall"}
    for _, fname in ipairs(folders) do
        local folder = workspace:FindFirstChild(fname)
        if folder then
            for _, obj in ipairs(folder:GetDescendants()) do
                if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored then
                    cachedBall = obj
                    return obj
                end
            end
        end
    end
    
    -- Check 4: Any fast-moving small unanchored part
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored then
            local vel = obj.AssemblyLinearVelocity
            if vel and vel.Magnitude > 30 then
                local s = obj.Size
                if s.X < 8 and s.Y < 8 and s.Z < 8 then
                    cachedBall = obj
                    return obj
                end
            end
        end
    end
    
    return nil
end

-- ═══════════════════════════════════════════════════
-- CHECK IF WE SHOULD PARRY
-- ═══════════════════════════════════════════════════
local function shouldParry(ball)
    if not ball or not ball.Parent then return false end
    
    local char = LP.Character
    if not char then return false end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return false end
    
    local dist = (ball.Position - root.Position).Magnitude
    
    -- Too far, don't parry
    if dist > Settings.ParryDistance then return false end
    
    -- Check velocity towards us
    local vel = ball.AssemblyLinearVelocity
    if vel and vel.Magnitude > 10 then
        local dirToUs = (root.Position - ball.Position).Unit
        local ballDir = vel.Unit
        local dot = dirToUs:Dot(ballDir)
        
        -- Ball is moving towards us
        if dot > 0.3 then
            return true
        end
    end
    
    -- Very close = parry regardless
    if dist < 6 then
        return true
    end
    
    return false
end

-- ═══════════════════════════════════════════════════
-- DO PARRY (multiple methods for Xeno)
-- ═══════════════════════════════════════════════════
local function doParry()
    local success = false
    
    -- Method 1: mouse1click (Xeno native)
    pcall(function()
        mouse1click()
        success = true
    end)
    
    -- Method 2: Keypress simulation (E key for block in some versions)  
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        -- Simulate mouse click
        vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.defer(function()
            pcall(function()
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end)
        end)
        success = true
    end)
    
    -- Method 3: Fire parry remotes
    if not success then
        pcall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                or ReplicatedStorage:FindFirstChild("Events")
                or ReplicatedStorage
            
            for _, remote in ipairs(remotes:GetDescendants()) do
                if remote:IsA("RemoteEvent") then
                    local n = string.lower(remote.Name)
                    if string.find(n, "parry") or string.find(n, "block")
                        or string.find(n, "deflect") or string.find(n, "swing")
                        or string.find(n, "hit") then
                        remote:FireServer()
                        success = true
                        break
                    end
                end
            end
        end)
    end
    
    return success
end

-- ═══════════════════════════════════════════════════
-- MAIN LOOP
-- ═══════════════════════════════════════════════════
RunService.Heartbeat:Connect(function()
    if not Settings.AutoParry then return end
    if parryDebounce then return end
    
    local ball = findBall()
    if not ball then return end
    
    if shouldParry(ball) then
        parryDebounce = true
        
        -- Random human-like delay
        local delay = Settings.MinDelay + math.random() * (Settings.MaxDelay - Settings.MinDelay)
        task.wait(delay)
        
        -- Do the parry
        local ok = doParry()
        
        -- Cooldown
        task.wait(0.3 + math.random() * 0.3)
        parryDebounce = false
    end
end)

-- ═══════════════════════════════════════════════════
-- DEBUG: Print ball info on toggle
-- ═══════════════════════════════════════════════════
local function debugBallInfo()
    local ball = findBall()
    if ball then
        OceanLibrary:Notify({
            Title = "Ball Found!",
            Content = "Name: " .. ball.Name .. " | Class: " .. ball.ClassName .. " | Parent: " .. (ball.Parent and ball.Parent.Name or "nil"),
            Duration = 5
        })
    else
        OceanLibrary:Notify({
            Title = "No Ball",
            Content = "Ball not found in workspace. Wait for round to start.",
            Duration = 5
        })
    end
end

-- ═══════════════════════════════════════════════════
-- UI
-- ═══════════════════════════════════════════════════
local ProtectTab = Window:MakeTab({
    Name = "Protection",
    Icon = "rbxassetid://6031763426"
})

ProtectTab:AddLabel({ Text = "ANTI-KICK ACTIVE" })

local ParryTab = Window:MakeTab({
    Name = "Auto Parry",
    Icon = "rbxassetid://6031068452"
})

ParryTab:AddToggle({
    Name = "Auto Parry",
    Default = false,
    Callback = function(val)
        Settings.AutoParry = val
        if val then debugBallInfo() end
    end
})

ParryTab:AddSlider({
    Name = "Parry Distance",
    Min = 5,
    Max = 30,
    Default = 15,
    Callback = function(val) Settings.ParryDistance = val end
})

ParryTab:AddSlider({
    Name = "Min Delay (ms)",
    Min = 20,
    Max = 200,
    Default = 60,
    Callback = function(val) Settings.MinDelay = val / 1000 end
})

ParryTab:AddSlider({
    Name = "Max Delay (ms)",
    Min = 50,
    Max = 400,
    Default = 160,
    Callback = function(val) Settings.MaxDelay = val / 1000 end
})

ParryTab:AddButton({
    Name = "Debug: Find Ball",
    Callback = function() debugBallInfo() end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Blade Ball v2 loaded! (Xeno compatible)",
    Duration = 5
})
