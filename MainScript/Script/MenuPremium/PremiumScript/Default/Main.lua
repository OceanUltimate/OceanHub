local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"

local function safeSrc(url, retries)
    retries = retries or 5
    for i = 1, retries do
        local ok, res = pcall(function() return game:HttpGet(url) end)
        if not ok then
            if i == retries then error("[OceanHub] HttpGet failed: "..tostring(res)) end
            task.wait(2^i)
        elseif not res or res == "" then
            if i == retries then error("[OceanHub] Empty response: "..url:match("[^/]+$")) end
            task.wait(2^i)
        elseif res:find("^%d%d%d ") then
            local code = res:match("^(%d+)")
            if code == "429" and i < retries then
                task.wait(math.min(2^i * 3, 60))
            else
                error("[OceanHub] HTTP "..code.." dari: "..url:match("[^/]+$"))
            end
        elseif res:find("^<!") then
            if i == retries then error("[OceanHub] HTML 404: "..url:match("[^/]+$")) end
            task.wait(2^i)
        else
            return res
        end
    end
end

local function safeLoad(url)
    local fn, err = loadstring(safeSrc(url))
    assert(fn, "[OceanHub] Compile error di "..url:match("[^/]+$")..": "..tostring(err))
    return fn()
end

local OceanUI = safeLoad(R.."MainUI/UI/Main.lua")
task.wait(1.5)
local Fn = safeLoad(R.."MainScript/Script/MenuPremium/PremiumScript/Default/Funtion/Funtion.lua")

local W   = OceanUI:CreateWindow({Title="OceanHub", Subtitle="Premium — Default", Icon="rbxassetid://84718341622420"})
local mov = W:CreateTab({Name="⚡ Movement", Icon="⚡"})
mov:CreateSlider({Name="Walk Speed",   Min=16, Max=500,  Default=16, Callback=function(v) Fn.SetWalkSpeed(v) end})
mov:CreateSlider({Name="Jump Power",   Min=50, Max=1000, Default=50, Callback=function(v) Fn.SetJumpPower(v) end})
mov:CreateToggle({Name="Noclip",        Default=false, Callback=function(v) Fn.SetNoclip(v)   end})
mov:CreateToggle({Name="Infinite Jump", Default=false, Callback=function(v) Fn.SetInfJump(v)  end})
mov:CreateToggle({Name="Fly",           Default=false, Callback=function(v) Fn.SetFly(v)       end})
local vis = W:CreateTab({Name="👁 Visual", Icon="👁"})
vis:CreateToggle({Name="ESP", Default=false, Callback=function(v) Fn.SetESP(v) end})
