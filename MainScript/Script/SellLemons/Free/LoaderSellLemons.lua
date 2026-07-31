--[[
    OceanHub - Sell Lemons Free Script
    Auto Button (press the correct sell button)
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Sell Lemons (Free)"
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LP = Players.LocalPlayer

-- ═══ AUTO BUTTON STATE ═══
local AutoButton = {
    Enabled = false,
    Range = 15,
}

-- ═══ FIND CORRECT BUTTON PARTS ═══
-- Sell Lemons has many Parts named "Button" scattered around
-- We look for ClickDetector inside the Part, and verify parent/location
local function findSellButtons()
    local buttons = {}
    local function scan(parent)
        for _, obj in ipairs(parent:GetChildren()) do
            if obj:IsA("BasePart") then
                local cd = obj:FindFirstChildOfClass("ClickDetector")
                if cd then
                    -- Check if this button is likely a sell/interaction button
                    local name = string.lower(obj.Name)
                    local parentName = obj.Parent and string.lower(obj.Parent.Name) or ""
                    -- Include buttons that are named "Button", "SellButton", "Press", etc.
                    if string.find(name, "button") or string.find(name, "sell")
                        or string.find(name, "press") or string.find(name, "click")
                        or string.find(parentName, "sell") or string.find(parentName, "button")
                        or string.find(parentName, "shop") or string.find(parentName, "lemon") then
                        table.insert(buttons, {Part = obj, Detector = cd})
                    end
                end
            end
            if obj:IsA("Model") or obj:IsA("Folder") or obj:IsA("BasePart") then
                scan(obj)
            end
        end
    end
    pcall(function() scan(workspace) end)
    return buttons
end

-- ═══ AUTO BUTTON LOOP ═══
local autoButtonConn = nil

local function startAutoButton()
    if autoButtonConn then autoButtonConn:Disconnect() end
    autoButtonConn = RunService.Heartbeat:Connect(function()
        if not AutoButton.Enabled then return end
        local char = LP.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local rootPos = char.HumanoidRootPart.Position

        local buttons = findSellButtons()
        for _, btn in ipairs(buttons) do
            if btn.Part and btn.Part.Parent and btn.Detector then
                local dist = (btn.Part.Position - rootPos).Magnitude
                if dist <= AutoButton.Range then
                    pcall(function()
                        fireclickdetector(btn.Detector)
                    end)
                end
            end
        end
    end)
end

startAutoButton()

-- ═══ UI ═══
local MainTab = Window:MakeTab({
    Name = "Auto Farm",
    Icon = "rbxassetid://6031763426"
})

MainTab:AddToggle({
    Name = "Auto Button Press",
    Default = false,
    Callback = function(val)
        AutoButton.Enabled = val
    end
})

MainTab:AddSlider({
    Name = "Button Range",
    Min = 5,
    Max = 50,
    Default = 15,
    Callback = function(val)
        AutoButton.Range = val
    end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Sell Lemons Free loaded!",
    Duration = 5
})
