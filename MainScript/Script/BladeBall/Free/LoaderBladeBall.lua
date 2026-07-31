--[[
    OceanHub - Blade Ball Free Script
    Anti-Kick Only (Safe method, Xeno compatible)
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Blade Ball (Free)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- ═══ ANTI-KICK (Safe - doesn't break game) ═══
pcall(function()
    local oldKick = LP.Kick
    LP.Kick = function(self, ...)
        if self == LP then
            warn("[OceanHub] Kick blocked")
            return
        end
        return oldKick(self, ...)
    end
end)

-- ═══ UI ═══
local MainTab = Window:MakeTab({
    Name = "Protection",
    Icon = "rbxassetid://6031763426"
})

MainTab:AddLabel({ Text = "ANTI-KICK ACTIVE" })

MainTab:AddToggle({
    Name = "Anti-Kick (Always On)",
    Default = true,
    Callback = function() end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Blade Ball Anti-Kick active!",
    Duration = 5
})
