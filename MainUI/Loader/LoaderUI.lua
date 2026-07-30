--[[
    OceanHub LoaderUI
    Loads OceanLibrary and initializes the user interface.
]]

local OceanLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/OceanLibrary.lua"))()

local Window = OceanLibrary:CreateWindow({
    Name = "OceanHub | Main UI"
})

local MainTab = Window:MakeTab({
    Name = "General",
    Icon = "rbxassetid://4483345998"
})

MainTab:AddButton({
    Name = "Test Notification",
    Callback = function()
        OceanLibrary:Notify({
            Title = "OceanHub",
            Content = "Notification System Works!",
            Duration = 5
        })
    end
})

MainTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(Value)
        print("Auto Farm set to:", Value)
    end
})

MainTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(Value)
        print("WalkSpeed changed to:", Value)
    end
})

OceanLibrary:Notify({
    Title = "OceanHub",
    Content = "Successfully loaded OceanHub UI!",
    Duration = 5
})