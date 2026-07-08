local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"

-- Retry-backoff HttpGet: handles 429, empty, HTML error pages
local function httpGet(url, retries)
    retries = retries or 4
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
            if code ~= "429" or i == retries then
                error("HTTP "..code.." from: "..url:match("[^/]+$"))
            end
            task.wait(math.min(2^i * 2, 30)) -- longer wait on rate limit
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
task.wait(1.5) -- gap to avoid back-to-back 429 from GitHub raw
local Fn = safeLoad(R.."MainScript/Script/MenuFree/FreeScript/Sell%20Lemons/Funtion/Funtion.lua")

local W = OceanUI:CreateWindow({
    Title    = "OceanHub",
    Subtitle = "Free — Sell Lemons",
    Icon     = "rbxassetid://84718341622420",
})

local t = W:CreateTab({Name = "🍋 Lemons", Icon = "🍋"})

local interval = 0.5

-- Keep toggleObj ref so slider can check current state
local toggleObj = t:CreateToggle({
    Name     = "Auto Sell",
    Default  = false,
    Callback = function(v)
        if v then Fn.StartAutoSell(interval) else Fn.StopAutoSell() end
    end,
})

t:CreateSlider({
    Name     = "Sell Interval (s)",
    Min      = 0.1,
    Max      = 5,
    Default  = 0.5,
    Callback = function(v)
        interval = v
        if toggleObj:Get() then
            Fn.StopAutoSell()
            Fn.StartAutoSell(interval)
        end
    end,
})
