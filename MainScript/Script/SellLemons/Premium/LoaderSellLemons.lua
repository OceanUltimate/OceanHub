--[[
    OceanHub - Sell Lemons Premium Script
    Auto Button + Auto Collect + Teleport to Buttons + Speed
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Sell Lemons (Premium VIP)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

-- ═══ SETTINGS ═══
local Settings = {
    AutoButton = false,
    AutoCollect = false,
    TeleportToButton = false,
    ButtonRange = 15,
    Speed = 16,
}

-- ═══ FIND BUTTONS ═══
local function findButtons(filterFunc)
    local results = {}
    local function scan(parent)
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("BasePart") then
                local cd = obj:FindFirstChildOfClass("ClickDetector")
                if cd then
                    local name = string.lower(obj.Name)
                    local pname = obj.Parent and string.lower(obj.Parent.Name) or ""
                    if string.find(name, "button") or string.find(name, "sell")
                        or string.find(name, "press") or string.find(name, "click")
                        or string.find(pname, "sell") or string.find(pname, "button")
                        or string.find(pname, "shop") or string.find(pname, "lemon") then
                        if not filterFunc or filterFunc(obj) then
                            table.insert(results, {Part = obj, Detector = cd})
                        end
                    end
                end
            end
            if not obj:IsA("Terrain") then
                pcall(function() scan(obj) end)
            end
        end
    end
    pcall(function() scan(workspace) end)
    return results
end

-- ═══ FIND COLLECTIBLES ═══
local function findCollectibles()
    local results = {}
    local function scan(parent)
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("BasePart") then
                local td = obj:FindFirstChildOfClass("TouchTransmitter")
                local name = string.lower(obj.Name)
                local pname = obj.Parent and string.lower(obj.Parent.Name) or ""
                if td or string.find(name, "lemon") or string.find(name, "coin")
                    or string.find(name, "collect") or string.find(pname, "lemon")
                    or string.find(pname, "drop") then
                    table.insert(results, obj)
                end
            end
            if not obj:IsA("Terrain") then
                pcall(function() scan(obj) end)
            end
        end
    end
    pcall(function() scan(workspace) end)
    return results
end

-- ═══ MAIN LOOP ═══
RunService.Heartbeat:Connect(function()
    local char = LP.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local root = char.HumanoidRootPart

    -- Auto Button
    if Settings.AutoButton then
        local btns = findButtons()
        for _, btn in ipairs(btns) do
            if btn.Part and btn.Part.Parent and btn.Detector then
                local dist = (btn.Part.Position - root.Position).Magnitude
                if dist <= Settings.ButtonRange then
                    pcall(function() fireclickdetector(btn.Detector) end)
                end
            end
        end
    end

    -- Auto Collect
    if Settings.AutoCollect then
        local items = findCollectibles()
        for _, item in ipairs(items) do
            if item and item.Parent then
                local dist = (item.Position - root.Position).Magnitude
                if dist <= 50 then
                    pcall(function()
                        firetouchinterest(root, item, 0)
                        task.wait()
                        firetouchinterest(root, item, 1)
                    end)
                end
            end
        end
    end

    -- Speed
    if Settings.Speed ~= 16 then
        local hum = char:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = Settings.Speed end
    end
end)

-- ═══ UI ═══
local FarmTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://6031763426"
})

FarmTab:AddToggle({
    Name = "Auto Button Press",
    Default = false,
    Callback = function(val) Settings.AutoButton = val end
})

FarmTab:AddToggle({
    Name = "Auto Collect Items",
    Default = false,
    Callback = function(val) Settings.AutoCollect = val end
})

FarmTab:AddSlider({
    Name = "Button Range",
    Min = 5,
    Max = 80,
    Default = 15,
    Callback = function(val) Settings.ButtonRange = val end
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://6031068426"
})

MiscTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 150,
    Default = 16,
    Callback = function(val)
        Settings.Speed = val
        local char = LP.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = val
        end
    end
})

OceanLibrary:Notify({
    Title = "OceanHub VIP",
    Content = "Sell Lemons Premium loaded!",
    Duration = 5
})
