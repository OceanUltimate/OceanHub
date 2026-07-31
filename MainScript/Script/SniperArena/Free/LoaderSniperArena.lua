--[[
    OceanHub - Sniper Arena Free Script
    ESP Only
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Sniper Arena (Free)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- ═══ ESP ═══
local ESPEnabled = false
local espObjects = {}

local function createESP(player)
    if player == LP then return end
    local function onCharAdded(char)
        pcall(function()
            local hl = Instance.new("Highlight")
            hl.Name = "OceanESP"
            hl.FillColor = Color3.fromRGB(255, 85, 85)
            hl.FillTransparency = 0.7
            hl.OutlineColor = Color3.fromRGB(255, 50, 50)
            hl.OutlineTransparency = 0
            hl.Adornee = char
            hl.Parent = char
            hl.Enabled = ESPEnabled
            espObjects[player] = hl
        end)
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

Players.PlayerAdded:Connect(function(p) if ESPEnabled then createESP(p) end end)
Players.PlayerRemoving:Connect(function(p)
    if espObjects[p] then espObjects[p]:Destroy(); espObjects[p] = nil end
end)

-- ═══ UI ═══
local VisualTab = Window:MakeTab({
    Name = "Visuals",
    Icon = "rbxassetid://6031068452"
})

VisualTab:AddToggle({
    Name = "ESP Highlight",
    Default = false,
    Callback = function(val) toggleESP(val) end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Sniper Arena Free loaded!",
    Duration = 5
})
