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
    Content = "Phantom Ball Anti-Kick active!",
    Duration = 5
})
