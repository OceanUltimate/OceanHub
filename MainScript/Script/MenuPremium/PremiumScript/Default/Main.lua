--[[
    OceanHub — PremiumScript/Default/Main.lua
]]

local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"

local OceanUI = loadstring(game:HttpGet(REPO_RAW .. "MainUI/LoaderUI/Main.lua"))()
local Fn      = loadstring(game:HttpGet(
    REPO_RAW .. "MainScript/Script/MenuPremium/PremiumScript/Default/Funtion/Funtion.lua"
))()

local Window = OceanUI:CreateWindow({
    Title    = "OceanHub",
    Subtitle = "Premium — Default",
    Icon     = "rbxassetid://84718341622420",
})

-- Movement tab
local mov = Window:CreateTab({ Name = "⚡ Movement", Icon = "⚡" })

mov:CreateSlider({ Name="Walk Speed", Min=16, Max=500, Default=16, Callback=function(v) Fn.SetWalkSpeed(v) end })
mov:CreateSlider({ Name="Jump Power", Min=50, Max=1000, Default=50, Callback=function(v) Fn.SetJumpPower(v) end })
mov:CreateToggle({ Name="Noclip", Default=false, Callback=function(v) Fn.SetNoclip(v) end })
mov:CreateToggle({ Name="Infinite Jump", Default=false, Callback=function(v) Fn.SetInfJump(v) end })
mov:CreateToggle({ Name="Fly", Default=false, Callback=function(v) Fn.SetFly(v) end })

-- Visual tab
local vis = Window:CreateTab({ Name = "👁 Visual", Icon = "👁" })

vis:CreateToggle({ Name="ESP (Player Names)", Default=false, Callback=function(v) Fn.SetESP(v) end })
