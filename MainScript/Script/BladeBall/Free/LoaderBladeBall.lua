--[[
    OceanHub - Blade Ball Free Script
    Anti-Kick Bypass (Xeno Compatible)
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Blade Ball (Free)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- ═══ ANTI-KICK BYPASS (Xeno compatible) ═══
local antiKickDone = false

local function enableAntiKick()
    if antiKickDone then return end
    antiKickDone = true

    -- Method 1: hookfunction Kick
    pcall(function()
        local oldKick = hookfunction(LP.Kick, function(self, ...)
            if self == LP then
                warn("[OceanHub] Kick blocked!")
                return
            end
            return oldKick(self, ...)
        end)
    end)

    -- Method 2: hookmetamethod __namecall
    pcall(function()
        local oldNamecall
        oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "Kick" and self == LP then
                return
            end
            if method == "Teleport" or method == "TeleportToPlaceInstance" then
                local args = {...}
                if typeof(args[1]) == "number" and args[1] ~= game.PlaceId then
                    return
                end
            end
            return oldNamecall(self, ...)
        end))
    end)

    -- Method 3: Block kick/anticheat remote events
    pcall(function()
        for _, v in ipairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
            if v:IsA("RemoteEvent") then
                local n = string.lower(v.Name)
                if string.find(n, "kick") or string.find(n, "ban")
                    or string.find(n, "detect") or string.find(n, "anti") then
                    v.OnClientEvent:Connect(function() return end)
                end
            end
        end
    end)
end

enableAntiKick()

-- ═══ UI ═══
local MainTab = Window:MakeTab({
    Name = "Protection",
    Icon = "rbxassetid://6031763426"
})

MainTab:AddLabel({ Text = "ANTI-KICK" })

MainTab:AddToggle({
    Name = "Anti-Kick (Always On)",
    Default = true,
    Callback = function() end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Blade Ball Anti-Kick active!",
    Duration = 7
})
