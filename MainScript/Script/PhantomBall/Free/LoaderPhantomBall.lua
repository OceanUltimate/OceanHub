--[[
    OceanHub - Phantom Ball Free Script
    Anti-Kick Only
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Phantom Ball (Free)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- ═══ ANTI-KICK ═══
pcall(function()
    hookfunction(LP.Kick, function(self, ...)
        if self == LP then return end
    end)
end)

pcall(function()
    local old = hookmetamethod(game, "__namecall", function(self, ...)
        local m = getnamecallmethod()
        if m == "Kick" and self == LP then return end
        if m == "Teleport" or m == "TeleportToPlaceInstance" then
            local a = {...}
            if typeof(a[1]) == "number" and a[1] ~= game.PlaceId then return end
        end
        return old(self, ...)
    end)
end)

-- ═══ UI ═══
local InfoTab = Window:MakeTab({ Name = "Info", Icon = "rbxassetid://8356815386" })
InfoTab:AddLabel({ Text = "Tier: Free" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Phantom Ball" })

local MiscTab = Window:MakeTab({ Name = "misc", Icon = "rbxassetid://6031068426" })
MiscTab:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 120, Default = 16, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed = val end
end })
MiscTab:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 50, Callback = function(val)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower = val end
end })

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Phantom Ball loaded!",
    Duration = 5
})
