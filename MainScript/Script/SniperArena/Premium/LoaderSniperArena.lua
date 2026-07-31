--[[
    OceanHub - Sniper Arena Premium Script
    ESP + Smooth Aimbot + No Recoil
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Sniper Arena (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

-- ═══ SETTINGS ═══
local Aim = {
    Enabled = false,
    FOV = 150,
    Smoothness = 6,
    TargetPart = "Head",
    TeamCheck = true,
    LockedTarget = nil,
}

-- ═══ AIMBOT (Smooth Lock-On, no jitter) ═══
local function isAlive(p)
    local ok, r = pcall(function()
        return p and p.Character and p.Character:FindFirstChild("Humanoid")
            and p.Character.Humanoid.Health > 0
            and p.Character:FindFirstChild(Aim.TargetPart)
    end)
    return ok and r
end

local function isTeammate(p)
    if not Aim.TeamCheck then return false end
    return LP.Team and p.Team and LP.Team == p.Team
end

local function getTarget()
    local closest, shortDist = nil, Aim.FOV
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and isAlive(p) and not isTeammate(p) then
            local part = p.Character:FindFirstChild(Aim.TargetPart)
            if part then
                local sp, vis = Camera:WorldToViewportPoint(part.Position)
                if vis then
                    local d = (Vector2.new(sp.X, sp.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if d < shortDist then shortDist = d; closest = p end
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if not Aim.Enabled then Aim.LockedTarget = nil; return end

    -- Keep locked target
    if Aim.LockedTarget and isAlive(Aim.LockedTarget) and not isTeammate(Aim.LockedTarget) then
        local part = Aim.LockedTarget.Character:FindFirstChild(Aim.TargetPart)
        if part then
            local _, vis = Camera:WorldToViewportPoint(part.Position)
            if vis then
                local alpha = 1 / math.max(Aim.Smoothness, 1)
                Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, part.Position), alpha)
                return
            end
        end
        Aim.LockedTarget = nil
    end

    local t = getTarget()
    if t then
        Aim.LockedTarget = t
        local part = t.Character:FindFirstChild(Aim.TargetPart)
        if part then
            local alpha = 1 / math.max(Aim.Smoothness, 1)
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, part.Position), alpha)
        end
    end
end)

-- ═══ ESP ═══
local ESPEnabled = false
local espObjects = {}

local function createESP(player)
    if player == LP then return end
    local function onChar(char)
        pcall(function()
            local hl = Instance.new("Highlight")
            hl.Name = "OceanESP"; hl.FillColor = Color3.fromRGB(255, 85, 85)
            hl.FillTransparency = 0.7; hl.OutlineColor = Color3.fromRGB(255, 50, 50)
            hl.OutlineTransparency = 0; hl.Adornee = char; hl.Parent = char
            hl.Enabled = ESPEnabled; espObjects[player] = hl
        end)
    end
    if player.Character then onChar(player.Character) end
    player.CharacterAdded:Connect(onChar)
end

local function toggleESP(val)
    ESPEnabled = val
    for _, o in pairs(espObjects) do if o and o.Parent then o.Enabled = val end end
    if val then for _, p in ipairs(Players:GetPlayers()) do createESP(p) end end
end

Players.PlayerAdded:Connect(function(p) if ESPEnabled then createESP(p) end end)
Players.PlayerRemoving:Connect(function(p) if espObjects[p] then espObjects[p]:Destroy(); espObjects[p] = nil end end)

-- ═══ UI ═══
local CombatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })

CombatTab:AddToggle({ Name = "Aimbot (Smooth)", Default = false,
    Callback = function(v) Aim.Enabled = v; if not v then Aim.LockedTarget = nil end end })

CombatTab:AddSlider({ Name = "Smoothness", Min = 1, Max = 20, Default = 6,
    Callback = function(v) Aim.Smoothness = v end })

CombatTab:AddSlider({ Name = "FOV Radius", Min = 30, Max = 500, Default = 150,
    Callback = function(v) Aim.FOV = v end })

CombatTab:AddDropdown({ Name = "Target Part", Options = {"Head", "HumanoidRootPart", "UpperTorso"}, Default = "Head",
    Callback = function(v) Aim.TargetPart = v end })

local VisualTab = Window:MakeTab({ Name = "Visuals", Icon = "rbxassetid://6031068452" })

VisualTab:AddToggle({ Name = "ESP Highlight", Default = false,
    Callback = function(v) toggleESP(v) end })

local MiscTab = Window:MakeTab({ Name = "Misc", Icon = "rbxassetid://6031068426" })

MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 120, Default = 16,
    Callback = function(v) local c = LP.Character; if c and c:FindFirstChild("Humanoid") then c.Humanoid.WalkSpeed = v end end })

OceanLibrary:Notify({ Title = "OceanHub VIP", Content = "Sniper Arena Premium loaded!", Duration = 5 })
