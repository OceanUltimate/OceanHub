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
card.Size=UDim2.new(0,300,0,H); card.Position=UDim2.fromScale(0.5,0.5)
card.AnchorPoint=Vector2.new(0.5,0.5); card.BackgroundColor3=Color3.fromRGB(8,14,28)
card.BorderSizePixel=0; card.Parent=sg
Instance.new("UICorner",card).CornerRadius=UDim.new(0,16)
local st=Instance.new("UIStroke",card); st.Color=Color3.fromRGB(0,160,230); st.Thickness=1.5

local ttl=Instance.new("TextLabel")
ttl.Size=UDim2.new(1,0,0,50); ttl.BackgroundTransparency=1
ttl.Text="🆓 Select Game"; ttl.TextColor3=Color3.fromRGB(255,255,255)
ttl.Font=Enum.Font.GothamBold; ttl.TextSize=18; ttl.Parent=card

-- Validated fetch: retries with exponential backoff; prevents "Expected identifier, got '429'" crash
-- Root cause: GitHub raw CDN returns "429 Too Many Requests" as plain text;
-- loadstring() on that string crashes because '429' is not a valid Lua identifier.
local function safeSrc(url, retries)
    retries = retries or 5
    for i = 1, retries do
        local ok, res = pcall(function() return game:HttpGet(url) end)
        if not ok then
            if i == retries then error("HttpGet failed: "..tostring(res)) end
            task.wait(2^i)
        elseif not res or res == "" then
            if i == retries then error("Empty response: "..url:match("[^/]+$")) end
            task.wait(2^i)
        elseif res:find("^%d%d%d ") then
            local code = res:match("^(%d+)")
            if code == "429" and i < retries then
                task.wait(math.min(2^i * 3, 60))
            else
                error("HTTP "..code.." from: "..url:match("[^/]+$"))
            end
        elseif res:find("^<!") then
            if i == retries then error("HTML error page (404?): "..url:match("[^/]+$")) end
            task.wait(2^i)
        else
            return res
        end
    end
end

for i, g in ipairs(GAMES) do
    local btn=Instance.new("TextButton")
    btn.Size=UDim2.new(1,-24,0,40); btn.Position=UDim2.new(0,12,0,50+(i-1)*48)
    btn.BackgroundColor3=Color3.fromRGB(20,30,60); btn.Text=g.name
    btn.TextColor3=Color3.fromRGB(255,255,255); btn.Font=Enum.Font.GothamBold
    btn.TextSize=15; btn.BorderSizePixel=0; btn.Parent=card
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,10)

    btn.MouseButton1Click:Connect(function()
        sg:Destroy()
        for _, v in ipairs(pg:GetChildren()) do
            if v.Name=="OceanHubLoader" then v:Destroy() end
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
