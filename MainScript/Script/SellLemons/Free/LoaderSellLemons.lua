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
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Free" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Sell Lemons" })

local MainTab = Window:MakeTab({ Name = "Auto Farm", Icon = "rbxassetid://6031763426" })
MainTab:AddToggle({ Name = "Auto Button Press", Keybind = "F", Default = false, Callback = function(val)
    AutoButton.Enabled = val
end })
MainTab:AddSlider({ Name = "Button Range", Min = 5, Max = 50, Default = 15, Callback = function(val)
    AutoButton.Range = val
end })

local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 120, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Sell Lemons loaded!",
    Duration = 5
})
