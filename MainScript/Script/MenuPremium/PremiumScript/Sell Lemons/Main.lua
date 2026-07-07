local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local OceanUI = loadstring(game:HttpGet(R.."MainUI/UI/Main.lua"))()
local Fn = loadstring(game:HttpGet(R.."MainScript/Script/MenuPremium/PremiumScript/Sell%20Lemons/Funtion/Function.lua"))()
local W = OceanUI:CreateWindow({Title="OceanHub",Subtitle="Premium — Sell Lemons",Icon="rbxassetid://84718341622420"})
local t = W:CreateTab({Name="🍋 Lemons",Icon="🍋"})
t:CreateToggle({Name="Auto Sell",Default=false,Callback=function(v) if v then Fn.StartAutoSell(0.3) else Fn.StopAutoSell() end end})
t:CreateSlider({Name="Sell Interval (s)",Min=0.1,Max=5,Default=0.3,Callback=function(v) Fn.StopAutoSell();Fn.StartAutoSell(v) end})
t:CreateToggle({Name="Auto Collect",Default=false,Callback=function(v) if v then Fn.StartAutoCollect(20) else Fn.StopAutoCollect() end end})
t:CreateSlider({Name="Collect Range",Min=5,Max=100,Default=20,Callback=function(v) Fn.StopAutoCollect();Fn.StartAutoCollect(v) end})
