--[[
    OceanHub - Sell Lemons Premium Script (FULL FEATURED)
    Task: Auto Button Clicker, Auto Collect Lemons/Coins, Teleport to Buttons, Instant Farm, WalkSpeed, Jump, Noclip, Premium Customizer
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Sell Lemons (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local Settings = {
    AutoButton = false,
    AutoCollect = false,
    TeleportToButton = false,
    InstantFarm = false,
    ButtonRange = 25,
    WalkSpeed = 16,
    JumpPower = 50,
    Noclip = false,
}

local function findButtons()
    local results = {}
    local function scan(parent)
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("BasePart") then
                local cd = obj:FindFirstChildOfClass("ClickDetector")
                if cd then
                    local name = string.lower(obj.Name)
                    local pname = obj.Parent and string.lower(obj.Parent.Name) or ""
                    if string.find(name, "button") or string.find(name, "sell") or string.find(name, "press") or string.find(pname, "sell") or string.find(pname, "button") then
                        table.insert(results, {Part = obj, Detector = cd})
                    end
                end
            end
            if not obj:IsA("Terrain") then pcall(function() scan(obj) end) end
        end
    end
    pcall(function() scan(workspace) end)
    return results
end

local function findCollectibles()
    local results = {}
    local function scan(parent)
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("BasePart") then
                local td = obj:FindFirstChildOfClass("TouchTransmitter")
                local name = string.lower(obj.Name)
                if td or string.find(name, "lemon") or string.find(name, "coin") or string.find(name, "drop") then
                    table.insert(results, obj)
                end
            end
            if not obj:IsA("Terrain") then pcall(function() scan(obj) end) end
        end
    end
    pcall(function() scan(workspace) end)
    return results
end

RunService.Heartbeat:Connect(function()
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart

    if Settings.Noclip then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end

    if Settings.AutoButton then
        local btns = findButtons()
        for _, btn in ipairs(btns) do
            if btn.Part and btn.Part.Parent and btn.Detector then
                local dist = (btn.Part.Position - root.Position).Magnitude
                if dist <= Settings.ButtonRange then
                    pcall(function() fireclickdetector(btn.Detector) end)
                end
                if Settings.TeleportToButton then
                    root.CFrame = btn.Part.CFrame + Vector3.new(0, 3, 0)
                    pcall(function() fireclickdetector(btn.Detector) end)
                end
            end
        end
    end

    if Settings.AutoCollect then
        local items = findCollectibles()
        for _, item in ipairs(items) do
            if item and item.Parent then
                firetouchinterest(root, item, 0)
                firetouchinterest(root, item, 1)
            end
        end
    end
end)

-- ═══ TAB 1: INFO ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
local welcomeCard = InfoTab:AddCard({ Title = "Selamat Datang", Icon = "⌂" })
welcomeCard:AddBanner({ Text = "Kamu menggunakan Sell Lemons Premium Script.", Icon = "✦" })
welcomeCard:AddKeyVal({ Key = "Game Terdeteksi", Value = "Sell Lemons", Color = Color3.fromRGB(56, 189, 248) })
welcomeCard:AddKeyVal({ Key = "PlaceId", Value = tostring(game.PlaceId), Color = Color3.fromRGB(148, 180, 216) })

local statusCard = InfoTab:AddCard({ Title = "Status Hub", Icon = "⚙" })
statusCard:AddKeyVal({ Key = "Tier", Value = "Premium VIP", Color = Color3.fromRGB(129, 140, 248) })
statusCard:AddKeyVal({ Key = "Status Key", Value = "unlimited", Color = Color3.fromRGB(52, 211, 153) })

-- ═══ TAB 2: AUTO FARM ═══
local FarmTab = Window:MakeTab({ Name = "Auto Farm", Icon = "rbxassetid://6031763426" })
FarmTab:AddToggle({ Name = "Auto Press Sell Buttons", Keybind = "F", Default = false, Callback = function(val) Settings.AutoButton = val end })
FarmTab:AddToggle({ Name = "Auto Collect Lemons & Coins", Keybind = "C", Default = false, Callback = function(val) Settings.AutoCollect = val end })
FarmTab:AddToggle({ Name = "Teleport to Buttons", Keybind = "T", Default = false, Callback = function(val) Settings.TeleportToButton = val end })
FarmTab:AddSlider({ Name = "Button Click Range", Min = 5, Max = 100, Default = 25, Callback = function(val) Settings.ButtonRange = val end })

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

OceanLibrary:Notify({ Title = "OceanHub VIP", Content = "Sell Lemons Premium Script loaded!", Duration = 5 })
