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
local Fn      = safeLoad(R.."MainScript/Script/MenuFree/FreeScript/Default/Function/Funtion.lua")
local W = OceanUI:CreateWindow({Title="OceanHub",Subtitle="Free — Default",Icon="rbxassetid://84718341622420"})
local t = W:CreateTab({Name="⚡ Movement",Icon="⚡"})
t:CreateSlider({Name="Walk Speed",Min=16,Max=300,Default=16,Callback=function(v) Fn.SetWalkSpeed(v) end})
t:CreateSlider({Name="Jump Power",Min=50,Max=500,Default=50,Callback=function(v) Fn.SetJumpPower(v) end})
t:CreateToggle({Name="Noclip",Default=false,Callback=function(v) Fn.SetNoclip(v) end})
t:CreateToggle({Name="Infinite Jump",Default=false,Callback=function(v) Fn.SetInfJump(v) end})
