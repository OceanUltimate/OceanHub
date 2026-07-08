local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local function safeLoad(url)
    local src = game:HttpGet(url)
    assert(src and src ~= "" and not src:find("^<!") and not src:find("^%d%d%d "),
        "Bad response from: "..url:match("[^/]+$").." (rate limit or 404?)")
    local fn, err = loadstring(src)
    assert(fn, "Compile error: "..tostring(err))
    return fn()
end
local OceanUI = safeLoad(R.."MainUI/UI/Main.lua")
local Fn      = safeLoad(R.."MainScript/Script/MenuFree/FreeScript/Sell%20Lemons/Funtion/Funtion.lua")
local W = OceanUI:CreateWindow({Title="OceanHub",Subtitle="Free — Sell Lemons",Icon="rbxassetid://84718341622420"})
local t = W:CreateTab({Name="🍋 Lemons",Icon="🍋"})
t:CreateToggle({Name="Auto Sell",Default=false,Callback=function(v) if v then Fn.StartAutoSell(0.5) else Fn.StopAutoSell() end end})
t:CreateSlider({Name="Sell Interval (s)",Min=0.1,Max=5,Default=0.5,Callback=function(v) Fn.StopAutoSell();Fn.StartAutoSell(v) end})
