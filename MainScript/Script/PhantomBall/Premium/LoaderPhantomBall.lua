--[[
    OceanHub - Phantom Ball Premium Script
    Anti-Kick + Smart Auto Parry + Auto Dodge
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Phantom Ball (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer

-- ═══ ANTI-KICK ═══
pcall(function()
    hookfunction(LP.Kick, function(self, ...)
        if self == LP then return end
    end)
end)
pcall(function()
    local old = hookmetamethod(game, "__namecall", function(self, ...)
        local m = getnamecallmethod()
        if m == "Kick" and self == LP then return end
        if (m == "Teleport" or m == "TeleportToPlaceInstance") then
            local a = {...}
            if typeof(a[1]) == "number" and a[1] ~= game.PlaceId then return end
        end
        return old(self, ...)
    end)
end)

-- ═══ SETTINGS ═══
local Settings = {
    AutoParry = false,
    AutoDodge = false,
    ParryDistance = 20,
    DodgeDistance = 12,
    MinDelay = 0.04,
    MaxDelay = 0.12,
}

local parryDebounce = false

-- ═══ FIND BALL ═══
local function findBall()
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") or obj:IsA("MeshPart") then
            local n = string.lower(obj.Name)
            if string.find(n, "ball") or string.find(n, "phantom") or string.find(n, "orb") then
                return obj
            end
        end
        if obj:IsA("Model") then
            local n = string.lower(obj.Name)
            if string.find(n, "ball") or string.find(n, "phantom") or string.find(n, "orb") then
                return obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
            end
        end
    end
    return nil
end

-- ═══ FIND PARRY REMOTE ═══
local function findParryRemote()
    for _, r in ipairs(ReplicatedStorage:GetDescendants()) do
        if r:IsA("RemoteEvent") then
            local n = string.lower(r.Name)
            if string.find(n, "parry") or string.find(n, "block") or string.find(n, "deflect")
                or string.find(n, "hit") then
                return r
            end
        end
    end
    return nil
end

-- ═══ CHECK BALL TARGETING US ═══
local function isBallComingAtUs(ball, distThreshold)
    if not ball or not ball.Parent then return false end
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return false end
    local root = char.HumanoidRootPart
    local dist = (ball.Position - root.Position).Magnitude
    if dist > distThreshold then return false end

    if ball:IsA("BasePart") then
        local vel = ball.AssemblyLinearVelocity or ball.Velocity
        if vel and vel.Magnitude > 5 then
            local dir = (root.Position - ball.Position).Unit
            return dir:Dot(vel.Unit) > 0.3
        end
    end
    return dist <= distThreshold * 0.4
end

-- ═══ AUTO PARRY + DODGE LOOP ═══
RunService.Heartbeat:Connect(function()
    if not Settings.AutoParry and not Settings.AutoDodge then return end
    if parryDebounce then return end

    local ball = findBall()
    if not ball then return end

    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart

    -- Auto Parry
    if Settings.AutoParry and isBallComingAtUs(ball, Settings.ParryDistance) then
        parryDebounce = true
        local delay = Settings.MinDelay + math.random() * (Settings.MaxDelay - Settings.MinDelay)
        task.wait(delay)

        local remote = findParryRemote()
        if remote then pcall(function() remote:FireServer() end) end

        pcall(function()
            local vim = game:GetService("VirtualInputManager")
            vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.wait(0.05)
            vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end)

        task.wait(0.25)
        parryDebounce = false
        return
    end

    -- Auto Dodge
    if Settings.AutoDodge and isBallComingAtUs(ball, Settings.DodgeDistance) then
        parryDebounce = true
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            -- Dodge sideways
            local ballDir = (ball.Position - root.Position).Unit
            local dodgeDir = Vector3.new(-ballDir.Z, 0, ballDir.X) -- Perpendicular
            root.CFrame = root.CFrame + dodgeDir * 8
        end
        task.wait(0.5)
        parryDebounce = false
    end
end)

-- ═══ UI ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Premium" })
InfoTab:AddLabel({ Text = "Status Key: unlimited" })
InfoTab:AddLabel({ Text = "Script: Phantom Ball" })

local ParryTab = Window:MakeTab({ Name = "Auto Parry", Icon = "rbxassetid://6031068452" })

ParryTab:AddToggle({ Name = "Smart Auto Parry", Keybind = "F", Default = false,
    Callback = function(v) Settings.AutoParry = v end })

ParryTab:AddToggle({ Name = "Auto Dodge", Keybind = "C", Default = false,
    Callback = function(v) Settings.AutoDodge = v end })

ParryTab:AddSlider({ Name = "Parry Distance", Min = 8, Max = 40, Default = 20,
    Callback = function(v) Settings.ParryDistance = v end })

ParryTab:AddSlider({ Name = "Dodge Distance", Min = 5, Max = 25, Default = 12,
    Callback = function(v) Settings.DodgeDistance = v end })

ParryTab:AddSlider({ Name = "Min Delay (x0.01s)", Min = 1, Max = 20, Default = 4,
    Callback = function(v) Settings.MinDelay = v * 0.01 end })

ParryTab:AddSlider({ Name = "Max Delay (x0.01s)", Min = 3, Max = 40, Default = 12,
    Callback = function(v) Settings.MaxDelay = v * 0.01 end })

local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 120, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

local PremiumTab = Window:MakeTab({ Name = ".", Icon = "rbxassetid://6031068428" })
PremiumTab:AddToggle({ Name = "Light (Corner Glow)", Default = true, Callback = function(val)
    local sg = CoreGui:FindFirstChild("OceanScriptLoader")
    if sg then
        for _, g in ipairs(sg:GetDescendants()) do
            if g.Name == "SuperThickCornerGlow" or g.Name == "Glow" then g.Visible = val end
        end
    end
end })
PremiumTab:AddToggle({ Name = "Background Effects", Default = true, Callback = function(val)
    local sg = CoreGui:FindFirstChild("OceanScriptLoader")
    if sg then
        local w = sg:FindFirstChild("Wrapper")
        if w then w.BackgroundTransparency = val and 0 or 1 end
    end
end })

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Phantom Ball Premium loaded!",
    Duration = 7
})
