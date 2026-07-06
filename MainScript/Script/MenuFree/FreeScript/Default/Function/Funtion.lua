--[[
    OceanHub — FreeScript/Default/Function/Funtion.lua
    Shared utility functions for Default free script.
]]

local M = {}

local Players       = game:GetService("Players")
local RunService    = game:GetService("RunService")
local TweenService  = game:GetService("TweenService")
local lp            = Players.LocalPlayer
local char          = lp.Character or lp.CharacterAdded:Wait()

-- Walk speed
function M.SetWalkSpeed(val)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = val end
end

-- Jump power
function M.SetJumpPower(val)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.JumpPower = val end
end

-- Noclip toggle
local noclipConn
function M.SetNoclip(enabled)
    if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
    if enabled then
        noclipConn = RunService.Stepped:Connect(function()
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then
                    p.CanCollide = false
                end
            end
        end)
    end
end

-- Inf jump
local ijConn
function M.SetInfJump(enabled)
    if ijConn then ijConn:Disconnect(); ijConn = nil end
    if enabled then
        ijConn = lp:GetMouse().KeyDown:Connect(function(k)
            if k == " " then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            end
        end)
    end
end

lp.CharacterAdded:Connect(function(c)
    char = c
end)

return M
