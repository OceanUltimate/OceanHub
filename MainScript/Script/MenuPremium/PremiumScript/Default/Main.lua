local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"

-- Validated HttpGet: retries on 429/empty/HTML; errors are clean strings
local function httpGet(url, retries)
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
            -- Response IS the HTTP error string (e.g. "429 Too Many Requests")
            -- loadstring() on this would crash with "Expected identifier, got '429'"
            local code = res:match("^(%d+)")
            if code == "429" and i < retries then
                task.wait(math.min(2^i * 3, 60)) -- longer backoff for rate limit
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

local function safeLoad(url)
    local src = httpGet(url)
    local fn, err = loadstring(src)
    assert(fn, "Compile error in "..url:match("[^/]+$")..": "..tostring(err))
    return fn()
end

local OceanUI = safeLoad(R.."MainUI/UI/Main.lua")
-- Stagger requests to reduce 429 probability
task.wait(1.5)
local Fn = safeLoad(R.."MainScript/Script/MenuPremium/PremiumScript/Default/Funtion/Funtion.lua")

local W   = OceanUI:CreateWindow({Title="OceanHub",Subtitle="Premium — Default",Icon="rbxassetid://84718341622420"})
local mov = W:CreateTab({Name="⚡ Movement",Icon="⚡"})
mov:CreateSlider({Name="Walk Speed",Min=16,Max=500,Default=16,Callback=function(v) Fn.SetWalkSpeed(v) end})
mov:CreateSlider({Name="Jump Power",Min=50,Max=1000,Default=50,Callback=function(v) Fn.SetJumpPower(v) end})
mov:CreateToggle({Name="Noclip",Default=false,Callback=function(v) Fn.SetNoclip(v) end})
mov:CreateToggle({Name="Infinite Jump",Default=false,Callback=function(v) Fn.SetInfJump(v) end})
mov:CreateToggle({Name="Fly",Default=false,Callback=function(v) Fn.SetFly(v) end})
local vis = W:CreateTab({Name="👁 Visual",Icon="👁"})
vis:CreateToggle({Name="ESP",Default=false,Callback=function(v) Fn.SetESP(v) end})
