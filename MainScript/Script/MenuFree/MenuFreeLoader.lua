local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local SCRIPTS  = "MainScript/Script/MenuFree/FreeScript/"

local GAMES = {
    { name = "🍋 Sell Lemons", folder = "Sell Lemons" },
    { name = "⚙️ Default",     folder = "Default"     },
}

local Players   = game:GetService("Players")
local lp        = Players.LocalPlayer
local pg        = lp:WaitForChild("PlayerGui")

local sg = Instance.new("ScreenGui")
sg.Name = "FreeMenuGui"; sg.ResetOnSpawn = false; sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling; sg.Parent = pg

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,300,0,60 + #GAMES*52)
frame.Position = UDim2.new(0.5,0,0.5,0); frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(15,20,35); frame.BorderSizePixel = 0; frame.Parent = sg
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,44); title.BackgroundTransparency = 1
title.Text = "🆓 Select Game"; title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold; title.TextSize = 17; title.Parent = frame

for i, g in ipairs(GAMES) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-24,0,40)
    btn.Position = UDim2.new(0,12,0,44+(i-1)*48)
    btn.BackgroundColor3 = Color3.fromRGB(30,40,70)
    btn.Text = g.name; btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold; btn.TextSize = 15; btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

    btn.MouseButton1Click:Connect(function()
        sg:Destroy()
        local ok, err = pcall(function()
            local src = game:HttpGet(REPO_RAW .. SCRIPTS .. g.folder .. "/Main.lua")
            local fn, ce = loadstring(src)
            if not fn then error(ce) end
            fn()
        end)
        if not ok then warn("[FreeMenu] " .. tostring(err)) end
    end)
end
