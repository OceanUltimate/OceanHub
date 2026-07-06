--[[
    OceanHub — FreeScript/Sell Lemons/Funtion/Funtion.lua
    Auto-sell helper for Sell Lemons game.
]]

local M = {}
local Players    = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp         = Players.LocalPlayer

local autoSellConn

function M.StartAutoSell(interval)
    interval = interval or 1
    if autoSellConn then autoSellConn:Disconnect() end

    local t = 0
    autoSellConn = RunService.Heartbeat:Connect(function(dt)
        t += dt
        if t >= interval then
            t = 0
            -- Fire the sell remote (standard Sell Lemons remote)
            local rem = game:GetService("ReplicatedStorage"):FindFirstChild("SellLemons")
                     or game:GetService("ReplicatedStorage"):FindFirstChild("Sell")
            if rem and rem:IsA("RemoteEvent") then
                rem:FireServer()
            end
        end
    end)
end

function M.StopAutoSell()
    if autoSellConn then
        autoSellConn:Disconnect()
        autoSellConn = nil
    end
end

return M
