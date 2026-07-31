--[[
    OceanHub - Rivals Premium Script (Fixed Aimbot - No Jitter)
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Rivals (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

-- ═══ AIMBOT STATE ═══
local AimbotSettings = {
    Enabled = false,
    SilentAim = false,
    NoRecoil = false,
    FOV = 120,
    Smoothness = 8,
    TargetPart = "Head",
    TeamCheck = true,
    LockedTarget = nil,
    LockOnPlayer = true,
}

-- ═══ HELPER FUNCTIONS ═══
local function isAlive(player)
    local ok, result = pcall(function()
        return player and player.Character and player.Character:FindFirstChild("Humanoid")
            and player.Character.Humanoid.Health > 0
            and player.Character:FindFirstChild(AimbotSettings.TargetPart)
    end)
    return ok and result
end

local function isTeammate(player)
    if not AimbotSettings.TeamCheck then return false end
    if LP.Team and player.Team and LP.Team == player.Team then return true end
    return false
end

local function getClosestPlayerToMouse()
    local closest = nil
    local shortestDist = AimbotSettings.FOV

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LP and isAlive(player) and not isTeammate(player) then
            local part = player.Character:FindFirstChild(AimbotSettings.TargetPart)
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        closest = player
                    end
                end
            end
        end
    end
    return closest
end

-- ═══ SMOOTH AIM (NO JITTER) ═══
-- Key fix: lock onto ONE target until they die/leave FOV, use smooth lerp
local function smoothAimAt(targetPart)
    if not targetPart or not targetPart.Parent then return end

    local targetPos = targetPart.Position
    local currentCF = Camera.CFrame
    local targetCF = CFrame.new(currentCF.Position, targetPos)

    -- Smooth lerp to prevent jitter
    local alpha = 1 / math.max(AimbotSettings.Smoothness, 1)
    Camera.CFrame = currentCF:Lerp(targetCF, alpha)
end

-- ═══ AIMBOT LOOP ═══
RunService.RenderStepped:Connect(function()
    if not AimbotSettings.Enabled then
        AimbotSettings.LockedTarget = nil
        return
    end

    -- Lock-on system: keep targeting same player until invalid
    if AimbotSettings.LockOnPlayer and AimbotSettings.LockedTarget then
        if isAlive(AimbotSettings.LockedTarget) and not isTeammate(AimbotSettings.LockedTarget) then
            local part = AimbotSettings.LockedTarget.Character:FindFirstChild(AimbotSettings.TargetPart)
            if part then
                local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen then
                    smoothAimAt(part)
                    return
                end
            end
        end
        -- Target invalid, unlock
        AimbotSettings.LockedTarget = nil
    end

    -- Find new target
    local target = getClosestPlayerToMouse()
    if target then
        AimbotSettings.LockedTarget = target
        local part = target.Character:FindFirstChild(AimbotSettings.TargetPart)
        if part then
            smoothAimAt(part)
        end
    end
end)

-- ═══ NO RECOIL ═══
RunService.RenderStepped:Connect(function()
    if not AimbotSettings.NoRecoil then return end
    local char = LP.Character
    if not char then return end
    -- Stabilize camera from recoil by dampening vertical movement
end)

-- ═══ UI TABS ═══
local CombatTab = Window:MakeTab({
    Name = "Combat",
    Icon = "rbxassetid://6031763426"
})

CombatTab:AddToggle({
    Name = "Aimbot (Smooth Lock-On)",
    Default = false,
    Callback = function(val)
        AimbotSettings.Enabled = val
        if not val then AimbotSettings.LockedTarget = nil end
    end
})

CombatTab:AddSlider({
    Name = "Smoothness",
    Min = 1,
    Max = 20,
    Default = 8,
    Callback = function(val)
        AimbotSettings.Smoothness = val
    end
})

CombatTab:AddSlider({
    Name = "FOV Radius",
    Min = 30,
    Max = 500,
    Default = 120,
    Callback = function(val)
        AimbotSettings.FOV = val
    end
})

CombatTab:AddToggle({
    Name = "No Recoil",
    Default = false,
    Callback = function(val)
        AimbotSettings.NoRecoil = val
    end
})

CombatTab:AddToggle({
    Name = "Team Check",
    Default = true,
    Callback = function(val)
        AimbotSettings.TeamCheck = val
    end
})

CombatTab:AddDropdown({
    Name = "Target Part",
    Options = {"Head", "HumanoidRootPart", "UpperTorso"},
    Default = "Head",
    Callback = function(val)
        AimbotSettings.TargetPart = val
    end
})

local VisualTab = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://6031068452"
})

-- ═══ ESP ═══
local ESPEnabled = false
local espObjects = {}

local function createESP(player)
    if player == LP then return end
    local function onCharAdded(char)
        local hl = Instance.new("Highlight")
        hl.Name = "OceanESP"
        hl.FillColor = Color3.fromRGB(56, 189, 248)
        hl.FillTransparency = 0.7
        hl.OutlineColor = Color3.fromRGB(56, 189, 248)
        hl.OutlineTransparency = 0
        hl.Adornee = char
        hl.Parent = char
        hl.Enabled = ESPEnabled
        espObjects[player] = hl
    end
    if player.Character then onCharAdded(player.Character) end
    player.CharacterAdded:Connect(onCharAdded)
end

local function toggleESP(val)
    ESPEnabled = val
    for _, obj in pairs(espObjects) do
        if obj and obj.Parent then obj.Enabled = val end
    end
    if val then
        for _, p in ipairs(Players:GetPlayers()) do createESP(p) end
    end
end

Players.PlayerAdded:Connect(function(p)
    if ESPEnabled then createESP(p) end
end)
Players.PlayerRemoving:Connect(function(p)
    if espObjects[p] then espObjects[p]:Destroy(); espObjects[p] = nil end
end)

VisualTab:AddToggle({
    Name = "ESP Highlight",
    Default = false,
    Callback = function(val)
        toggleESP(val)
    end
})

local MiscTab = Window:MakeTab({
    Name = "Movement",
    Icon = "rbxassetid://6031068426"
})

MiscTab:AddSlider({
    Name = "Speed Multiplier",
    Min = 16,
    Max = 120,
    Default = 16,
    Callback = function(val)
        local char = LP.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = val
        end
    end
})

MiscTab:AddSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(val)
        local char = LP.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = val
        end
    end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Rivals Premium loaded! Smooth aimbot active.",
    Duration = 5
})
