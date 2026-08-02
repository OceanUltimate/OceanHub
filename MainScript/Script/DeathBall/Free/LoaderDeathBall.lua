local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Death Ball (Free)"
})

local Players = game:GetService("Players")
local LP = Players.LocalPlayer

local AntiKickState = true

pcall(function()
    local oldKick
    oldKick = hookfunction(LP.Kick, newcclosure(function(self, ...)
        if AntiKickState and self == LP then
            warn("[OceanHub] Death Ball kick diblokir.")
            return
        end
        return oldKick(self, ...)
    end))
end)

pcall(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if AntiKickState and self == LP and method == "Kick" then
            warn("[OceanHub] Death Ball namecall kick diblokir.")
            return
        end
        return oldNamecall(self, ...)
    end))
end)

local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://8356815386"
})

InfoTab:AddLabel({ Text = "Tier: Free" })
InfoTab:AddLabel({ Text = "Status Key: Free" })
InfoTab:AddLabel({ Text = "Script: Death Ball" })

local MainTab = Window:MakeTab({
    Name = "Protection",
    Icon = "rbxassetid://6031763426"
})

MainTab:AddToggle({
    Name = "Anti-Kick",
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
    Content = "Death Ball loaded!",
    Duration = 5
})
