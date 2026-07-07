local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local OceanUI = loadstring(game:HttpGet(R.."MainUI/UI/Main.lua"))()
local Fn = loadstring(game:HttpGet(R.."MainScript/Script/MenuFree/FreeScript/Default/Function/Funtion.lua"))()
local W = OceanUI:CreateWindow({Title="OceanHub",Subtitle="Free — Default",Icon="rbxassetid://84718341622420"})
local t = W:CreateTab({Name="⚡ Movement",Icon="⚡"})
t:CreateSlider({Name="Walk Speed",Min=16,Max=300,Default=16,Callback=function(v) Fn.SetWalkSpeed(v) end})
t:CreateSlider({Name="Jump Power",Min=50,Max=500,Default=50,Callback=function(v) Fn.SetJumpPower(v) end})
t:CreateToggle({Name="Noclip",Default=false,Callback=function(v) Fn.SetNoclip(v) end})
t:CreateToggle({Name="Infinite Jump",Default=false,Callback=function(v) Fn.SetInfJump(v) end})
