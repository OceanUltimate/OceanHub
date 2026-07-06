--[[
    OceanHub — PremiumScript/Sell Lemons/Funtion/Function.lua
    Premium auto-sell + extras for Sell Lemons.
]]

local M = {}
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp         = Players.LocalPlayer

local sellConn

function M.StartAutoSell(interval)
    interval = interval or 0.3
    if sellConn then sellConn:Disconnect() end
    local t = 0
    sellConn = RunService.Heartbeat:Connect(function(dt)
        t += dt
        if t >= interval then
            t = 0
            local rs = game:GetService("ReplicatedStorage")
            local rem = rs:FindFirstChild("SellLemons") or rs:FindFirstChild("Sell")
            if rem and rem:IsA("RemoteEvent") then rem:FireServer() end
        end
    end)
end

function M.StopAutoSell()
    if sellConn then sellConn:Disconnect(); sellConn = nil end
end

-- Premium: Auto-collect lemons from workspace
local collectConn
function M.StartAutoCollect(range)
    range = range or 20
    if collectConn then collectConn:Disconnect() end
    local char = lp.Character or lp.CharacterAdded:Wait()
    local t = 0
    collectConn = RunService.Heartbeat:Connect(function(dt)
        t += dt
        if t < 0.5 then return end
        t = 0
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name:lower():find("lemon") and obj:IsA("BasePart") then
                if (obj.Position - root.Position).Magnitude <= range then
                    -- teleport to collect
                    root.CFrame = CFrame.new(obj.Position)
                end
            end
        end
    end)
end

function M.StopAutoCollect()
    if collectConn then collectConn:Disconnect(); collectConn = nil end
end

return M
