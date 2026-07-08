local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local GAMES = {
    {name="🍋 Sell Lemons", folder="Sell%20Lemons"},
    {name="⚙️ Default",     folder="Default"},
}

local pg = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local sg = Instance.new("ScreenGui")
sg.Name="FreeMenuGui"; sg.ResetOnSpawn=false; sg.IgnoreGuiInset=true; sg.Parent=pg

local H = 60 + #GAMES * 52
local card = Instance.new("Frame")
card.Size             = UDim2.new(0,300,0,H)
card.Position         = UDim2.fromScale(0.5,0.5)
card.AnchorPoint      = Vector2.new(0.5,0.5)
card.BackgroundColor3 = Color3.fromRGB(8,14,28)
card.BorderSizePixel  = 0
card.Parent           = sg
Instance.new("UICorner",card).CornerRadius = UDim.new(0,16)
local st = Instance.new("UIStroke",card); st.Color=Color3.fromRGB(0,160,230); st.Thickness=1.5

local ttl = Instance.new("TextLabel")
ttl.Size=UDim2.new(1,0,0,50); ttl.BackgroundTransparency=1
ttl.Text="🆓 Select Game"; ttl.TextColor3=Color3.fromRGB(255,255,255)
ttl.Font=Enum.Font.GothamBold; ttl.TextSize=18; ttl.Parent=card

-- Validate raw response before loadstring to prevent "Expected identifier, got '429'" crash
local function safeSrc(url)
    local ok, src = pcall(function() return game:HttpGet(url) end)
    if not ok then error("HttpGet error: "..tostring(src)) end
    if not src or src == "" then error("Empty response") end
    if src:find("^%d%d%d ") then
        local code = src:match("^(%d+)")
        error("HTTP "..code.." (rate limit or not found)")
    end
    if src:find("^<!") then error("HTML response (404?)") end
    return src
end

for i, g in ipairs(GAMES) do
    local btn = Instance.new("TextButton")
    btn.Size=UDim2.new(1,-24,0,40); btn.Position=UDim2.new(0,12,0,50+(i-1)*48)
    btn.BackgroundColor3=Color3.fromRGB(20,30,60); btn.Text=g.name
    btn.TextColor3=Color3.fromRGB(255,255,255); btn.Font=Enum.Font.GothamBold
    btn.TextSize=15; btn.BorderSizePixel=0; btn.Parent=card
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,10)

    btn.MouseButton1Click:Connect(function()
        sg:Destroy()
        for _, v in ipairs(pg:GetChildren()) do
            if v.Name == "OceanHubLoader" then v:Destroy() end
        end
        local ok, err = pcall(function()
            local src = safeSrc(R.."MainScript/Script/MenuFree/FreeScript/"..g.folder.."/Main.lua")
            local fn, ce = loadstring(src)
            if not fn then error(tostring(ce)) end
            fn()
        end)
        if not ok then warn("[FreeMenu] "..tostring(err)) end
    end)
end
