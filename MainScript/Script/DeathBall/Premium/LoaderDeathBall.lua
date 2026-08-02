local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Death Ball (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local CoreGui = game:GetService("CoreGui")
local LP = Players.LocalPlayer

local AntiKickState = true

pcall(function()
    local oldKick
    oldKick = hookfunction(LP.Kick, newcclosure(function(self, ...)
        if AntiKickState and self == LP then
            warn("[OceanHub] Death Ball kick diblokir.")
            return
        end
        return oldKick(self, ...)
    end))
end)

pcall(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if AntiKickState and self == LP and method == "Kick" then
            warn("[OceanHub] Death Ball namecall kick diblokir.")
            return
        end
        return oldNamecall(self, ...)
    end))
end)

local Settings = {
    AutoParry = false,
    AutoDodge = false,
    PreferRemote = true,
    ParryDistance = 18,
    DodgeDistance = 12,
    MinDelay = 0.04,
    MaxDelay = 0.10,
}

local parryDebounce = false
local cachedBall = nil
local lastBallCheck = 0
local cachedRemote = nil

local function getCharacter()
    local char = LP.Character
    if not char then
        return nil, nil, nil
    end

    local humanoid = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root or humanoid.Health <= 0 then
        return nil, nil, nil
    end

    return char, humanoid, root
end

local function isBallLikeName(name)
    local lowerName = string.lower(name or "")
    return string.find(lowerName, "death")
        or string.find(lowerName, "ball")
        or string.find(lowerName, "orb")
        or string.find(lowerName, "projectile")
        or string.find(lowerName, "slash")
end

local function findBall()
    if cachedBall and cachedBall.Parent and tick() - lastBallCheck < 0.35 then
        return cachedBall
    end

    lastBallCheck = tick()
    cachedBall = nil

    local containers = {
        workspace:FindFirstChild("Balls"),
        workspace:FindFirstChild("Projectiles"),
        workspace:FindFirstChild("Live"),
        workspace:FindFirstChild("Arena"),
    }

    for _, container in ipairs(containers) do
        if container then
            for _, obj in ipairs(container:GetDescendants()) do
                if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored and isBallLikeName(obj.Name) then
                    cachedBall = obj
                    return obj
                end
            end
        end
    end

    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored then
            if isBallLikeName(obj.Name) then
                cachedBall = obj
                return obj
            end
        end
    end

    return nil
end

local function findParryRemote()
    if cachedRemote and cachedRemote.Parent then
        return cachedRemote
    end

    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = string.lower(obj.Name)
            if string.find(name, "parry")
                or string.find(name, "deflect")
                or string.find(name, "block")
                or string.find(name, "ability")
                or string.find(name, "counter")
            then
                cachedRemote = obj
                return obj
            end
        end
    end

    return nil
end

local function isBallThreat(ball, distance)
    local _, _, root = getCharacter()
    if not ball or not root then
        return false, math.huge
    end

    local dist = (ball.Position - root.Position).Magnitude
    if dist > distance then
        return false, dist
    end

    local velocity = ball.AssemblyLinearVelocity or ball.Velocity
    if velocity and velocity.Magnitude > 5 then
        local dirToPlayer = (root.Position - ball.Position).Unit
        local ballDir = velocity.Unit
        if dirToPlayer:Dot(ballDir) > 0.28 then
            return true, dist
        end
    end

    return dist <= math.max(6, distance * 0.4), dist
end

local function triggerParry()
    local success = false
    local remote = findParryRemote()

    if Settings.PreferRemote and remote then
        success = pcall(function()
            if remote:IsA("RemoteEvent") then
                remote:FireServer()
            else
                remote:InvokeServer()
            end
        end)
    end

    if not success then
        pcall(function()
            if mouse1click then
                mouse1click()
            end
        end)

        pcall(function()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.wait(0.03)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end)
    end
end

local function triggerDodge(ball)
    local _, _, root = getCharacter()
    if not ball or not root then
        return
    end

    local ballDir = (ball.Position - root.Position).Unit
    local dodgeDir = Vector3.new(-ballDir.Z, 0, ballDir.X)
    root.CFrame = root.CFrame + dodgeDir * 8
end

local function notifyBallDebug()
    local ball = findBall()
    if ball then
        OceanLibrary:Notify({
            Title = "Death Ball Debug",
            Content = "Ball ditemukan: " .. ball.Name,
            Duration = 5
        })
        return
    end

    OceanLibrary:Notify({
        Title = "Death Ball Debug",
        Content = "Ball belum terdeteksi. Coba saat ronde aktif.",
        Duration = 5
    })
end

RunService.RenderStepped:Connect(function()
    if not Settings.AutoParry and not Settings.AutoDodge then
        return
    end

    if parryDebounce then
        return
    end

    local ball = findBall()
    if not ball then
        return
    end

    if Settings.AutoParry then
        local shouldParry = isBallThreat(ball, Settings.ParryDistance)
        if shouldParry then
            parryDebounce = true
            local delay = Settings.MinDelay + math.random() * math.max(Settings.MaxDelay - Settings.MinDelay, 0)
            task.wait(delay)
            triggerParry()
            task.wait(0.2)
            parryDebounce = false
            return
        end
    end

    if Settings.AutoDodge then
        local shouldDodge = isBallThreat(ball, Settings.DodgeDistance)
        if shouldDodge then
            parryDebounce = true
            triggerDodge(ball)
            task.wait(0.35)
            parryDebounce = false
        end
    end
end)

local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://8356815386"
})

InfoTab:AddLabel({ Text = "Tier: Premium" })
InfoTab:AddLabel({ Text = "Status Key: unlimited" })
InfoTab:AddLabel({ Text = "Script: Death Ball" })

local CombatTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://6031068452"
})

CombatTab:AddToggle({
    Name = "Auto Parry",
    Keybind = "F",
    Default = false,
    Callback = function(val)
        Settings.AutoParry = val
        if val then
            notifyBallDebug()
        end
    end
})

CombatTab:AddToggle({
    Name = "Auto Dodge",
    Keybind = "C",
    Default = false,
    Callback = function(val)
        Settings.AutoDodge = val
    end
})

CombatTab:AddToggle({
    Name = "Prefer Remote Parry",
    Default = true,
    Callback = function(val)
        Settings.PreferRemote = val
    end
})

CombatTab:AddToggle({
    Name = "Anti-Kick",
    Default = true,
    Callback = function(val)
        AntiKickState = val
    end
})

CombatTab:AddSlider({
    Name = "Parry Distance",
    Min = 6,
    Max = 35,
    Default = 18,
    Callback = function(val)
        Settings.ParryDistance = val
    end
})

CombatTab:AddSlider({
    Name = "Dodge Distance",
    Min = 5,
    Max = 25,
    Default = 12,
    Callback = function(val)
        Settings.DodgeDistance = val
    end
})

CombatTab:AddSlider({
    Name = "Min Delay (ms)",
    Min = 10,
    Max = 150,
    Default = 40,
    Callback = function(val)
        Settings.MinDelay = val / 1000
        if Settings.MaxDelay < Settings.MinDelay then
            Settings.MaxDelay = Settings.MinDelay
        end
    end
})

CombatTab:AddSlider({
    Name = "Max Delay (ms)",
    Min = 20,
    Max = 250,
    Default = 100,
    Callback = function(val)
        Settings.MaxDelay = val / 1000
        if Settings.MaxDelay < Settings.MinDelay then
            Settings.MinDelay = Settings.MaxDelay
        end
    end
})

CombatTab:AddButton({
    Name = "Debug: Find Ball",
    Callback = function()
        notifyBallDebug()
    end
})

local MiscTab = Window:MakeTab({
    Name = "misc",
    Icon = "rbxassetid://6031068426"
})

MiscTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 120,
    Default = 16,
    Callback = function(val)
        local _, humanoid = getCharacter()
        if humanoid then
            humanoid.WalkSpeed = val
        end
    end
})

MiscTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(val)
        local _, humanoid = getCharacter()
        if humanoid then
            humanoid.JumpPower = val
        end
    end
})

local PremiumTab = Window:MakeTab({
    Name = ".",
    Icon = "rbxassetid://6031068428"
})

PremiumTab:AddToggle({
    Name = "Light (Corner Glow)",
    Default = true,
    Callback = function(val)
        local screenGui = CoreGui:FindFirstChild("OceanScriptLoader")
        if screenGui then
            for _, guiObject in ipairs(screenGui:GetDescendants()) do
                if guiObject.Name == "SuperThickCornerGlow" or guiObject.Name == "Glow" then
                    guiObject.Visible = val
                end
            end
        end
    end
})

PremiumTab:AddToggle({
    Name = "Background Effects",
    Default = true,
    Callback = function(val)
        local screenGui = CoreGui:FindFirstChild("OceanScriptLoader")
        if screenGui then
            local wrapper = screenGui:FindFirstChild("Wrapper")
            if wrapper then
                wrapper.BackgroundTransparency = val and 0 or 1
            end
        end
    end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Death Ball Premium loaded!",
    Duration = 6
})
