--[[
    OceanHub - Blade Ball Free Script v3
    Anti-Kick Bypass (BAC Compatible)
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Blade Ball (Free)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local AntiKickState = true

pcall(function()
    local oldKick
    oldKick = hookfunction(LP.Kick, newcclosure(function(self, ...)
        if AntiKickState and self == LP then
            warn("[OceanHub] Kick blocked!")
            return
        end
        return oldKick(self, ...)
    end))
end)

-- ═══ UI ═══
local MainTab = Window:MakeTab({
    Name = "Protection",
    Icon = "rbxassetid://6031763426"
})

MainTab:AddToggle({
    Name = "BAC Anti-Kick Bypass",
    Default = true,
    Callback = function(val)
        AntiKickState = val
    end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Blade Ball Anti-Kick active!",
    Duration = 5
})
