--[[
    OceanHub - Death Ball Premium Script (FULL FEATURED)
    Task: Auto Parry, Spam Parry, Auto Ability, Ball Predictor, WalkSpeed, Jump, Noclip, Premium Customizer
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Death Ball (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local Settings = {
    AutoParry = false,
    ParryDistance = 20,
    SpamParry = false,
    AutoAbility = false,
    WalkSpeed = 16,
    JumpPower = 50,
    Noclip = false,
}

local parryDebounce = false
local function doParry()
    pcall(function() if mouse1click then mouse1click() end end)
    pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        task.defer(function() pcall(function() vim:SendMouseButtonEvent(0, 0, 0, false, game, 1) end) end)
    end)
end

local function findBall()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if (obj:IsA("BasePart") or obj:IsA("MeshPart")) and not obj.Anchored and (obj.Name == "Ball" or string.find(string.lower(obj.Name), "ball")) then
            return obj
        end
    end
    return nil
end

RunService.RenderStepped:Connect(function()
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart

    if Settings.Noclip then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end

    local ball = findBall()
    if not ball then return end
    local dist = (ball.Position - root.Position).Magnitude

    if Settings.AutoParry and not parryDebounce and dist <= Settings.ParryDistance then
        parryDebounce = true
        doParry()
        task.wait(0.15)
        parryDebounce = false
    end

    if Settings.SpamParry and dist <= 12 then
        doParry()
    end
end)

-- ═══ TAB 1: INFO ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
local welcomeCard = InfoTab:AddCard({ Title = "Selamat Datang", Icon = "⌂" })
welcomeCard:AddBanner({ Text = "Kamu menggunakan Death Ball Premium Script.", Icon = "✦" })
welcomeCard:AddKeyVal({ Key = "Game Terdeteksi", Value = "Death Ball", Color = Color3.fromRGB(56, 189, 248) })
welcomeCard:AddKeyVal({ Key = "PlaceId", Value = tostring(game.PlaceId), Color = Color3.fromRGB(148, 180, 216) })

local statusCard = InfoTab:AddCard({ Title = "Status Hub", Icon = "⚙" })
statusCard:AddKeyVal({ Key = "Tier", Value = "Premium VIP", Color = Color3.fromRGB(129, 140, 248) })
statusCard:AddKeyVal({ Key = "Status Key", Value = "unlimited", Color = Color3.fromRGB(52, 211, 153) })

-- ═══ TAB 2: COMBAT ═══
local CombatTab = Window:MakeTab({ Name = "Combat", Icon = "rbxassetid://6031763426" })
CombatTab:AddToggle({ Name = "Auto Deflect / Parry", Keybind = "F", Default = false, Callback = function(val) Settings.AutoParry = val end })
CombatTab:AddSlider({ Name = "Parry Range", Min = 10, Max = 40, Default = 20, Callback = function(val) Settings.ParryDistance = val end })
CombatTab:AddToggle({ Name = "Spam Deflect", Keybind = "C", Default = false, Callback = function(val) Settings.SpamParry = val end })

-- ═══ TAB 3: MISC ═══
local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 150, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })
MiscTab:AddToggle({ Name = "Noclip", Keybind = "N", Default = false, Callback = function(val) Settings.Noclip = val end })

-- ═══ TAB 4: PREMIUM SETTINGS ═══
local PremiumTab = Window:MakeTab({ Name = ".", Icon = "rbxassetid://6031068428" })
PremiumTab:AddToggle({ Name = "Light (Corner Glow)", Default = true, Callback = function(val)
    local sg = game:GetService("CoreGui"):FindFirstChild("OceanScriptLoader")
    if sg then for _, g in ipairs(sg:GetDescendants()) do if g.Name == "SuperThickCornerGlow" or g.Name == "Glow" then g.Visible = val end end end
end })
PremiumTab:AddToggle({ Name = "Background Effects", Default = true, Callback = function(val)
    local sg = game:GetService("CoreGui"):FindFirstChild("OceanScriptLoader")
    if sg then local w = sg:FindFirstChild("Wrapper"); if w then w.BackgroundTransparency = val and 0 or 1 end end
end })

OceanLibrary:Notify({ Title = "OceanHub VIP", Content = "Death Ball Premium Script loaded!", Duration = 5 })
