--[[
    OceanHub — PremiumScript/Default/Funtion/Funtion.lua
    Extended utility functions for premium users.
]]

local M = {}

local Players       = game:GetService("Players")
local RunService    = game:GetService("RunService")
local lp            = Players.LocalPlayer
local char          = lp.Character or lp.CharacterAdded:Wait()

function M.SetWalkSpeed(v)
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then h.WalkSpeed = v end
end

function M.SetJumpPower(v)
    local h = char:FindFirstChildOfClass("Humanoid")
    if h then h.JumpPower = v end
end

local noclipConn
function M.SetNoclip(en)
    if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
    if en then
        noclipConn = RunService.Stepped:Connect(function()
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end)
    end
end

local ijConn
function M.SetInfJump(en)
    if ijConn then ijConn:Disconnect(); ijConn = nil end
    if en then
        ijConn = lp:GetMouse().KeyDown:Connect(function(k)
            if k == " " then
                local h = char:FindFirstChildOfClass("Humanoid")
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end
        end)
    end
end

-- Premium-only: ESP
local espBillboards = {}
function M.SetESP(en)
    -- Clear old
    for _, b in ipairs(espBillboards) do
        if b and b.Parent then b:Destroy() end
    end
    espBillboards = {}

    if not en then return end

    local function addESP(player)
        if player == lp then return end
        local c = player.Character
        if not c then return end
        local root = c:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local bb = Instance.new("BillboardGui")
        bb.Size     = UDim2.new(0, 100, 0, 30)
        bb.StudsOffset = Vector3.new(0, 3, 0)
        bb.AlwaysOnTop = true
        bb.Parent   = root

        local lbl = Instance.new("TextLabel")
        lbl.Size   = UDim2.fromScale(1, 1)
        lbl.BackgroundTransparency = 1
        lbl.Text   = player.Name
        lbl.TextColor3 = Color3.fromRGB(0, 200, 255)
        lbl.TextStrokeTransparency = 0
        lbl.Font   = Enum.Font.GothamBold
        lbl.TextSize = 14
        lbl.Parent = bb

        table.insert(espBillboards, bb)
    end

    for _, p in ipairs(Players:GetPlayers()) do addESP(p) end
    Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function() task.wait(1); addESP(p) end)
    end)
end

-- Premium-only: Fly
local flyConn, flyBP, flyBA
function M.SetFly(en)
    if not en then
        if flyConn then flyConn:Disconnect(); flyConn = nil end
        if flyBP   then flyBP:Destroy();  flyBP  = nil end
        if flyBA   then flyBA:Destroy();  flyBA  = nil end
        return
    end

    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end

    flyBP = Instance.new("BodyPosition")
    flyBP.MaxForce = Vector3.new(1e5,1e5,1e5)
    flyBP.P        = 1e4
    flyBP.Position = root.Position
    flyBP.Parent   = root

    flyBA = Instance.new("BodyAngularVelocity")
    flyBA.MaxTorque = Vector3.new(1e5,1e5,1e5)
    flyBA.AngularVelocity = Vector3.zero
    flyBA.Parent = root

    local cam   = workspace.CurrentCamera
    local mouse = lp:GetMouse()
    local speed = 50

    flyConn = RunService.RenderStepped:Connect(function()
        local dir = Vector3.zero
        local uis = game:GetService("UserInputService")
        if uis:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.yAxis end
        if uis:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.yAxis end
        flyBP.Position += dir * speed * 0.03
    end)
end

lp.CharacterAdded:Connect(function(c) char = c end)

return M
