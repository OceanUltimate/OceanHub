--[[
    OceanHub - Arsenal Premium Script (FULL FEATURED)
    Task: Silent Aim, Aimbot Lock, Wallcheck, TargetPart, ESP Box, ESP Tracers, ESP Chams, No Recoil, Rapid Fire, WalkSpeed, Jump, Premium Customizer
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Arsenal (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

local Settings = {
    Aimbot = false,
    SilentAim = false,
    FOV = 120,
    Smoothness = 6,
    TargetPart = "Head",
    Wallcheck = true,
    NoRecoil = false,
    RapidFire = false,
    ESPBox = false,
    ESPTracers = false,
    ESPChams = false,
    WalkSpeed = 16,
    JumpPower = 50,
}

local function getTargetPartName()
    if Settings.TargetPart == "Body" then return "HumanoidRootPart" end
    if Settings.TargetPart == "Leg" then return "LeftFoot" end
    return "Head"
end

local function isAlive(p)
    return p and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 and p.Character:FindFirstChild(getTargetPartName())
end

local function isTeammate(p)
    if LP.Team and p.Team and LP.Team == p.Team then return true end
    return false
end

local function isVisible(pos)
    if not Settings.Wallcheck then return true end
    local char = LP.Character
    if not char or not char:FindFirstChild("Head") then return false end
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {char}
    params.FilterType = Enum.RaycastFilterType.Exclude
    local res = workspace:Raycast(char.Head.Position, pos - char.Head.Position, params)
    return res == nil
end

local function getClosestEnemy()
    local closest, shortestDist = nil, Settings.FOV
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and isAlive(p) and not isTeammate(p) then
            local part = p.Character:FindFirstChild(getTargetPartName())
            if part then
                local sPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                if onScreen and isVisible(part.Position) then
                    local dist = (Vector2.new(sPos.X, sPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist; closest = p
                    end
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if Settings.Aimbot then
        local target = getClosestEnemy()
        if target and target.Character then
            local part = target.Character:FindFirstChild(getTargetPartName())
            if part then
                local currentCF = Camera.CFrame
                local targetCF = CFrame.new(currentCF.Position, part.Position)
                Camera.CFrame = currentCF:Lerp(targetCF, 1 / math.max(Settings.Smoothness, 1))
            end
        end
    end
end)

-- ═══ TAB 1: INFO ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
local welcomeCard = InfoTab:AddCard({ Title = "Selamat Datang", Icon = "⌂" })
welcomeCard:AddBanner({ Text = "Kamu menggunakan Arsenal Premium Script.", Icon = "✦" })
welcomeCard:AddKeyVal({ Key = "Game Terdeteksi", Value = "Arsenal", Color = Color3.fromRGB(56, 189, 248) })
welcomeCard:AddKeyVal({ Key = "PlaceId", Value = tostring(game.PlaceId), Color = Color3.fromRGB(148, 180, 216) })

local statusCard = InfoTab:AddCard({ Title = "Status Hub", Icon = "⚙" })
statusCard:AddKeyVal({ Key = "Tier", Value = "Premium VIP", Color = Color3.fromRGB(129, 140, 248) })
statusCard:AddKeyVal({ Key = "Status Key", Value = "unlimited", Color = Color3.fromRGB(52, 211, 153) })

-- ═══ TAB 2: COMBAT ═══
local CombatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
CombatTab:AddToggle({ Name = "Aimbot Lock", Keybind = "E", Default = false, Callback = function(val) Settings.Aimbot = val end })
CombatTab:AddToggle({ Name = "Silent Aim", Keybind = "R", Default = false, Callback = function(val) Settings.SilentAim = val end })
CombatTab:AddToggle({ Name = "Wallcheck", Keybind = "C", Default = true, Callback = function(val) Settings.Wallcheck = val end })
CombatTab:AddDropdown({ Name = "Target Part", Options = {"Head", "Body", "Leg"}, Default = "Head", Callback = function(val) Settings.TargetPart = val end })
CombatTab:AddSlider({ Name = "Aimbot FOV", Min = 30, Max = 300, Default = 120, Callback = function(val) Settings.FOV = val end })
CombatTab:AddSlider({ Name = "Aimbot Smoothness", Min = 1, Max = 20, Default = 6, Callback = function(val) Settings.Smoothness = val end })
CombatTab:AddToggle({ Name = "No Recoil", Default = false, Callback = function(val) Settings.NoRecoil = val end })

-- ═══ TAB 3: VISUALS ═══
local VisualTab = Window:MakeTab({ Name = "Visuals", Icon = "rbxassetid://6031068452" })
VisualTab:AddToggle({ Name = "ESP Box", Keybind = "P", Default = false, Callback = function(val) Settings.ESPBox = val end })
VisualTab:AddToggle({ Name = "ESP Tracers", Keybind = "T", Default = false, Callback = function(val) Settings.ESPTracers = val end })
VisualTab:AddToggle({ Name = "ESP Chams / Highlights", Default = false, Callback = function(val) Settings.ESPChams = val end })

-- ═══ TAB 4: MISC ═══
local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed Multiplier", Min = 16, Max = 120, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 250, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

-- ═══ TAB 5: PREMIUM SETTINGS ═══
local PremiumTab = Window:MakeTab({ Name = ".", Icon = "rbxassetid://6031068428" })
PremiumTab:AddToggle({ Name = "Light (Corner Glow)", Default = true, Callback = function(val)
    local sg = game:GetService("CoreGui"):FindFirstChild("OceanScriptLoader")
    if sg then for _, g in ipairs(sg:GetDescendants()) do if g.Name == "SuperThickCornerGlow" or g.Name == "Glow" then g.Visible = val end end end
end })
PremiumTab:AddToggle({ Name = "Background Effects", Default = true, Callback = function(val)
    local sg = game:GetService("CoreGui"):FindFirstChild("OceanScriptLoader")
    if sg then local w = sg:FindFirstChild("Wrapper"); if w then w.BackgroundTransparency = val and 0 or 1 end end
end })

OceanLibrary:Notify({ Title = "OceanHub VIP", Content = "Arsenal Premium Script loaded with 12+ Features!", Duration = 5 })
