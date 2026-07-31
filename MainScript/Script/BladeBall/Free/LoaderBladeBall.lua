--[[
    OceanHub - Blade Ball Free Script
    Anti-Kick Bypass Only
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Blade Ball (Free)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

-- ═══ ANTI-KICK BYPASS ═══
-- Blade Ball detects auto-parry by monitoring RemoteEvent fire rate
-- and kicks players via Player:Kick() or teleporting them out.
-- We hook these to prevent the kick from executing.

local antiKickActive = false

local function enableAntiKick()
    if antiKickActive then return end
    antiKickActive = true

    -- 1. Hook Player:Kick to block server-triggered kicks
    local oldKick = nil
    pcall(function()
        oldKick = hookfunction(LP.Kick, function(self, ...)
            if self == LP then
                warn("[OceanHub] Blocked kick attempt!")
                return -- Block the kick
            end
            return oldKick(self, ...)
        end)
    end)

    -- 2. Hook __namecall to intercept Kick and TeleportService calls
    local oldNamecall = nil
    pcall(function()
        oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()

            -- Block Kick calls on LocalPlayer
            if method == "Kick" and self == LP then
                warn("[OceanHub] Blocked namecall Kick!")
                return
            end

            -- Block suspicious TeleportToPlaceInstance (used to kick to lobby)
            if method == "TeleportToPlaceInstance" or method == "Teleport" then
                local args = {...}
                -- Only block if it seems like an anti-cheat teleport
                if typeof(args[1]) == "number" and args[1] ~= game.PlaceId then
                    warn("[OceanHub] Blocked suspicious teleport!")
                    return
                end
            end

            return oldNamecall(self, ...)
        end)
    end)

    -- 3. Protect against RemoteEvent-based kicks
    pcall(function()
        for _, remote in ipairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
            if remote:IsA("RemoteEvent") then
                local name = string.lower(remote.Name)
                if string.find(name, "kick") or string.find(name, "ban")
                    or string.find(name, "detect") or string.find(name, "anticheat") then
                    -- Disconnect all server connections we can reach
                    pcall(function()
                        remote.OnClientEvent:Connect(function()
                            return -- Swallow the event
                        end)
                    end)
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

MainTab:AddLabel({
    Text = "ANTI-KICK"
})

MainTab:AddToggle({
    Name = "Anti-Kick Bypass",
    Default = true,
    Callback = function(val)
        if val then enableAntiKick() end
    end
})

OceanLibrary:Notify({
    Title = "OceanHub Free",
    Content = "Blade Ball Anti-Kick active! You should not get kicked.",
    Duration = 7
})
