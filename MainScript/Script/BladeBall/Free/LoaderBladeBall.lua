--[[
    OceanHub - Blade Ball Free Script v4
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
local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://8356815386"
})

InfoTab:AddLabel({ Text = "Tier: Free" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Blade Ball" })

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

local MiscTab = Window:MakeTab({
    Name = "misc",
    Icon = "rbxassetid://6031068426"
})

MiscTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 120,
    Default = 16,
    Callback = function(val)
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.WalkSpeed = val
        end
    end
})

MiscTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,
    Callback = function(val)
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            LP.Character.Humanoid.JumpPower = val
        end
    end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Blade Ball loaded!",
    Duration = 5
})
