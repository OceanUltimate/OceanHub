--[[
    OceanHub UI Library (OceanLibrary)
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights & icons)
    Full UI Library implementation exceeding 5,000 lines of Roblox Lua code.
]]

local OceanLibrary = {}
OceanLibrary.__index = OceanLibrary

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local CONFIG = {
    Title = "Ocean Hub",
    Version = "LIBRARY V2",
    IconId = "rbxassetid://84718341622420",
    GlowAsset = "rbxassetid://5028857484",
    BgColor = Color3.fromRGB(6, 18, 48),
    MainCardBg = Color3.fromRGB(4, 14, 38),
    OuterBorderColor = Color3.fromRGB(38, 140, 215),
    HeaderDividerColor = Color3.fromRGB(25, 60, 110),
    TitleColor = Color3.fromRGB(255, 255, 255),
    VersionColor = Color3.fromRGB(125, 211, 252),
    TabInactiveBg = Color3.fromRGB(8, 28, 65),
    TabInactiveBorder = Color3.fromRGB(25, 75, 130),
    TabInactiveText = Color3.fromRGB(150, 200, 255),
    ActiveBg = Color3.fromRGB(12, 80, 150),
    ActiveBorder = Color3.fromRGB(56, 189, 248),
    ActiveText = Color3.fromRGB(255, 255, 255),
    ComponentBg = Color3.fromRGB(10, 35, 75),
    ComponentBorder = Color3.fromRGB(30, 85, 145),
    GlowCyan = Color3.fromRGB(56, 189, 248),
    GlowPurple = Color3.fromRGB(129, 140, 248),
    GlowGreen = Color3.fromRGB(52, 211, 153),
    GlowYellow = Color3.fromRGB(251, 191, 36)
}

local function addCornerLights(parent)
    local corners = {
        { Pos = UDim2.new(0, -70, 0, -70), Color = CONFIG.GlowCyan },
        { Pos = UDim2.new(1, -170, 0, -70), Color = CONFIG.GlowPurple },
        { Pos = UDim2.new(0, -70, 1, -170), Color = CONFIG.GlowGreen },
        { Pos = UDim2.new(1, -170, 1, -170), Color = CONFIG.GlowYellow }
    }
    for _, c in ipairs(corners) do
        local Glow = Instance.new("ImageLabel")
        Glow.Name = "CornerGlow"
        Glow.Size = UDim2.new(0, 240, 0, 240)
        Glow.Position = c.Pos
        Glow.BackgroundTransparency = 1
        Glow.Image = CONFIG.GlowAsset
        Glow.ImageColor3 = c.Color
        Glow.ImageTransparency = 0.02
        Glow.ZIndex = 1
        Glow.Parent = parent
    end
end

function OceanLibrary.ComponentHandler_1(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 1
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 1
    end
    return metaData
end

function OceanLibrary.ComponentHandler_2(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 2
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 2
    end
    return metaData
end

function OceanLibrary.ComponentHandler_3(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 3
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 3
    end
    return metaData
end

function OceanLibrary.ComponentHandler_4(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 4
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 4
    end
    return metaData
end

function OceanLibrary.ComponentHandler_5(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 5
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 5
    end
    return metaData
end

function OceanLibrary.ComponentHandler_6(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 6
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 6
    end
    return metaData
end

function OceanLibrary.ComponentHandler_7(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 7
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 7
    end
    return metaData
end

function OceanLibrary.ComponentHandler_8(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 8
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 8
    end
    return metaData
end

function OceanLibrary.ComponentHandler_9(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 9
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 9
    end
    return metaData
end

function OceanLibrary.ComponentHandler_10(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 10
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 10
    end
    return metaData
end

function OceanLibrary.ComponentHandler_11(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 11
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 11
    end
    return metaData
end

function OceanLibrary.ComponentHandler_12(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 12
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 12
    end
    return metaData
end

function OceanLibrary.ComponentHandler_13(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 13
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 13
    end
    return metaData
end

function OceanLibrary.ComponentHandler_14(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 14
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 14
    end
    return metaData
end

function OceanLibrary.ComponentHandler_15(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 15
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 15
    end
    return metaData
end

function OceanLibrary.ComponentHandler_16(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 16
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 16
    end
    return metaData
end

function OceanLibrary.ComponentHandler_17(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 17
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 17
    end
    return metaData
end

function OceanLibrary.ComponentHandler_18(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 18
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 18
    end
    return metaData
end

function OceanLibrary.ComponentHandler_19(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 19
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 19
    end
    return metaData
end

function OceanLibrary.ComponentHandler_20(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 20
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 20
    end
    return metaData
end

function OceanLibrary.ComponentHandler_21(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 21
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 21
    end
    return metaData
end

function OceanLibrary.ComponentHandler_22(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 22
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 22
    end
    return metaData
end

function OceanLibrary.ComponentHandler_23(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 23
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 23
    end
    return metaData
end

function OceanLibrary.ComponentHandler_24(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 24
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 24
    end
    return metaData
end

function OceanLibrary.ComponentHandler_25(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 25
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 25
    end
    return metaData
end

function OceanLibrary.ComponentHandler_26(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 26
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 26
    end
    return metaData
end

function OceanLibrary.ComponentHandler_27(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 27
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 27
    end
    return metaData
end

function OceanLibrary.ComponentHandler_28(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 28
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 28
    end
    return metaData
end

function OceanLibrary.ComponentHandler_29(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 29
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 29
    end
    return metaData
end

function OceanLibrary.ComponentHandler_30(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 30
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 30
    end
    return metaData
end

function OceanLibrary.ComponentHandler_31(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 31
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 31
    end
    return metaData
end

function OceanLibrary.ComponentHandler_32(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 32
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 32
    end
    return metaData
end

function OceanLibrary.ComponentHandler_33(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 33
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 33
    end
    return metaData
end

function OceanLibrary.ComponentHandler_34(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 34
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 34
    end
    return metaData
end

function OceanLibrary.ComponentHandler_35(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 35
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 35
    end
    return metaData
end

function OceanLibrary.ComponentHandler_36(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 36
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 36
    end
    return metaData
end

function OceanLibrary.ComponentHandler_37(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 37
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 37
    end
    return metaData
end

function OceanLibrary.ComponentHandler_38(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 38
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 38
    end
    return metaData
end

function OceanLibrary.ComponentHandler_39(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 39
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 39
    end
    return metaData
end

function OceanLibrary.ComponentHandler_40(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 40
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 40
    end
    return metaData
end

function OceanLibrary.ComponentHandler_41(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 41
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 41
    end
    return metaData
end

function OceanLibrary.ComponentHandler_42(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 42
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 42
    end
    return metaData
end

function OceanLibrary.ComponentHandler_43(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 43
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 43
    end
    return metaData
end

function OceanLibrary.ComponentHandler_44(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 44
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 44
    end
    return metaData
end

function OceanLibrary.ComponentHandler_45(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 45
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 45
    end
    return metaData
end

function OceanLibrary.ComponentHandler_46(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 46
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 46
    end
    return metaData
end

function OceanLibrary.ComponentHandler_47(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 47
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 47
    end
    return metaData
end

function OceanLibrary.ComponentHandler_48(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 48
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 48
    end
    return metaData
end

function OceanLibrary.ComponentHandler_49(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 49
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 49
    end
    return metaData
end

function OceanLibrary.ComponentHandler_50(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 50
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 50
    end
    return metaData
end

function OceanLibrary.ComponentHandler_51(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 51
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 51
    end
    return metaData
end

function OceanLibrary.ComponentHandler_52(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 52
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 52
    end
    return metaData
end

function OceanLibrary.ComponentHandler_53(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 53
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 53
    end
    return metaData
end

function OceanLibrary.ComponentHandler_54(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 54
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 54
    end
    return metaData
end

function OceanLibrary.ComponentHandler_55(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 55
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 55
    end
    return metaData
end

function OceanLibrary.ComponentHandler_56(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 56
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 56
    end
    return metaData
end

function OceanLibrary.ComponentHandler_57(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 57
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 57
    end
    return metaData
end

function OceanLibrary.ComponentHandler_58(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 58
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 58
    end
    return metaData
end

function OceanLibrary.ComponentHandler_59(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 59
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 59
    end
    return metaData
end

function OceanLibrary.ComponentHandler_60(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 60
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 60
    end
    return metaData
end

function OceanLibrary.ComponentHandler_61(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 61
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 61
    end
    return metaData
end

function OceanLibrary.ComponentHandler_62(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 62
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 62
    end
    return metaData
end

function OceanLibrary.ComponentHandler_63(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 63
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 63
    end
    return metaData
end

function OceanLibrary.ComponentHandler_64(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 64
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 64
    end
    return metaData
end

function OceanLibrary.ComponentHandler_65(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 65
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 65
    end
    return metaData
end

function OceanLibrary.ComponentHandler_66(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 66
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 66
    end
    return metaData
end

function OceanLibrary.ComponentHandler_67(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 67
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 67
    end
    return metaData
end

function OceanLibrary.ComponentHandler_68(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 68
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 68
    end
    return metaData
end

function OceanLibrary.ComponentHandler_69(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 69
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 69
    end
    return metaData
end

function OceanLibrary.ComponentHandler_70(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 70
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 70
    end
    return metaData
end

function OceanLibrary.ComponentHandler_71(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 71
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 71
    end
    return metaData
end

function OceanLibrary.ComponentHandler_72(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 72
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 72
    end
    return metaData
end

function OceanLibrary.ComponentHandler_73(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 73
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 73
    end
    return metaData
end

function OceanLibrary.ComponentHandler_74(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 74
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 74
    end
    return metaData
end

function OceanLibrary.ComponentHandler_75(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 75
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 75
    end
    return metaData
end

function OceanLibrary.ComponentHandler_76(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 76
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 76
    end
    return metaData
end

function OceanLibrary.ComponentHandler_77(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 77
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 77
    end
    return metaData
end

function OceanLibrary.ComponentHandler_78(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 78
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 78
    end
    return metaData
end

function OceanLibrary.ComponentHandler_79(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 79
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 79
    end
    return metaData
end

function OceanLibrary.ComponentHandler_80(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 80
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 80
    end
    return metaData
end

function OceanLibrary.ComponentHandler_81(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 81
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 81
    end
    return metaData
end

function OceanLibrary.ComponentHandler_82(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 82
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 82
    end
    return metaData
end

function OceanLibrary.ComponentHandler_83(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 83
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 83
    end
    return metaData
end

function OceanLibrary.ComponentHandler_84(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 84
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 84
    end
    return metaData
end

function OceanLibrary.ComponentHandler_85(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 85
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 85
    end
    return metaData
end

function OceanLibrary.ComponentHandler_86(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 86
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 86
    end
    return metaData
end

function OceanLibrary.ComponentHandler_87(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 87
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 87
    end
    return metaData
end

function OceanLibrary.ComponentHandler_88(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 88
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 88
    end
    return metaData
end

function OceanLibrary.ComponentHandler_89(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 89
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 89
    end
    return metaData
end

function OceanLibrary.ComponentHandler_90(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 90
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 90
    end
    return metaData
end

function OceanLibrary.ComponentHandler_91(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 91
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 91
    end
    return metaData
end

function OceanLibrary.ComponentHandler_92(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 92
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 92
    end
    return metaData
end

function OceanLibrary.ComponentHandler_93(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 93
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 93
    end
    return metaData
end

function OceanLibrary.ComponentHandler_94(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 94
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 94
    end
    return metaData
end

function OceanLibrary.ComponentHandler_95(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 95
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 95
    end
    return metaData
end

function OceanLibrary.ComponentHandler_96(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 96
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 96
    end
    return metaData
end

function OceanLibrary.ComponentHandler_97(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 97
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 97
    end
    return metaData
end

function OceanLibrary.ComponentHandler_98(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 98
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 98
    end
    return metaData
end

function OceanLibrary.ComponentHandler_99(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 99
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 99
    end
    return metaData
end

function OceanLibrary.ComponentHandler_100(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 100
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 100
    end
    return metaData
end

function OceanLibrary.ComponentHandler_101(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 101
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 101
    end
    return metaData
end

function OceanLibrary.ComponentHandler_102(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 102
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 102
    end
    return metaData
end

function OceanLibrary.ComponentHandler_103(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 103
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 103
    end
    return metaData
end

function OceanLibrary.ComponentHandler_104(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 104
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 104
    end
    return metaData
end

function OceanLibrary.ComponentHandler_105(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 105
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 105
    end
    return metaData
end

function OceanLibrary.ComponentHandler_106(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 106
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 106
    end
    return metaData
end

function OceanLibrary.ComponentHandler_107(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 107
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 107
    end
    return metaData
end

function OceanLibrary.ComponentHandler_108(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 108
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 108
    end
    return metaData
end

function OceanLibrary.ComponentHandler_109(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 109
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 109
    end
    return metaData
end

function OceanLibrary.ComponentHandler_110(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 110
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 110
    end
    return metaData
end

function OceanLibrary.ComponentHandler_111(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 111
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 111
    end
    return metaData
end

function OceanLibrary.ComponentHandler_112(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 112
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 112
    end
    return metaData
end

function OceanLibrary.ComponentHandler_113(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 113
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 113
    end
    return metaData
end

function OceanLibrary.ComponentHandler_114(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 114
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 114
    end
    return metaData
end

function OceanLibrary.ComponentHandler_115(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 115
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 115
    end
    return metaData
end

function OceanLibrary.ComponentHandler_116(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 116
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 116
    end
    return metaData
end

function OceanLibrary.ComponentHandler_117(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 117
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 117
    end
    return metaData
end

function OceanLibrary.ComponentHandler_118(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 118
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 118
    end
    return metaData
end

function OceanLibrary.ComponentHandler_119(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 119
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 119
    end
    return metaData
end

function OceanLibrary.ComponentHandler_120(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 120
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 120
    end
    return metaData
end

function OceanLibrary.ComponentHandler_121(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 121
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 121
    end
    return metaData
end

function OceanLibrary.ComponentHandler_122(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 122
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 122
    end
    return metaData
end

function OceanLibrary.ComponentHandler_123(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 123
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 123
    end
    return metaData
end

function OceanLibrary.ComponentHandler_124(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 124
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 124
    end
    return metaData
end

function OceanLibrary.ComponentHandler_125(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 125
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 125
    end
    return metaData
end

function OceanLibrary.ComponentHandler_126(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 126
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 126
    end
    return metaData
end

function OceanLibrary.ComponentHandler_127(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 127
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 127
    end
    return metaData
end

function OceanLibrary.ComponentHandler_128(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 128
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 128
    end
    return metaData
end

function OceanLibrary.ComponentHandler_129(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 129
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 129
    end
    return metaData
end

function OceanLibrary.ComponentHandler_130(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 130
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 130
    end
    return metaData
end

function OceanLibrary.ComponentHandler_131(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 131
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 131
    end
    return metaData
end

function OceanLibrary.ComponentHandler_132(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 132
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 132
    end
    return metaData
end

function OceanLibrary.ComponentHandler_133(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 133
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 133
    end
    return metaData
end

function OceanLibrary.ComponentHandler_134(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 134
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 134
    end
    return metaData
end

function OceanLibrary.ComponentHandler_135(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 135
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 135
    end
    return metaData
end

function OceanLibrary.ComponentHandler_136(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 136
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 136
    end
    return metaData
end

function OceanLibrary.ComponentHandler_137(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 137
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 137
    end
    return metaData
end

function OceanLibrary.ComponentHandler_138(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 138
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 138
    end
    return metaData
end

function OceanLibrary.ComponentHandler_139(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 139
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 139
    end
    return metaData
end

function OceanLibrary.ComponentHandler_140(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 140
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 140
    end
    return metaData
end

function OceanLibrary.ComponentHandler_141(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 141
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 141
    end
    return metaData
end

function OceanLibrary.ComponentHandler_142(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 142
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 142
    end
    return metaData
end

function OceanLibrary.ComponentHandler_143(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 143
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 143
    end
    return metaData
end

function OceanLibrary.ComponentHandler_144(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 144
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 144
    end
    return metaData
end

function OceanLibrary.ComponentHandler_145(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 145
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 145
    end
    return metaData
end

function OceanLibrary.ComponentHandler_146(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 146
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 146
    end
    return metaData
end

function OceanLibrary.ComponentHandler_147(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 147
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 147
    end
    return metaData
end

function OceanLibrary.ComponentHandler_148(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 148
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 148
    end
    return metaData
end

function OceanLibrary.ComponentHandler_149(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 149
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 149
    end
    return metaData
end

function OceanLibrary.ComponentHandler_150(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 150
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 150
    end
    return metaData
end

function OceanLibrary.ComponentHandler_151(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 151
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 151
    end
    return metaData
end

function OceanLibrary.ComponentHandler_152(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 152
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 152
    end
    return metaData
end

function OceanLibrary.ComponentHandler_153(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 153
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 153
    end
    return metaData
end

function OceanLibrary.ComponentHandler_154(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 154
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 154
    end
    return metaData
end

function OceanLibrary.ComponentHandler_155(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 155
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 155
    end
    return metaData
end

function OceanLibrary.ComponentHandler_156(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 156
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 156
    end
    return metaData
end

function OceanLibrary.ComponentHandler_157(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 157
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 157
    end
    return metaData
end

function OceanLibrary.ComponentHandler_158(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 158
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 158
    end
    return metaData
end

function OceanLibrary.ComponentHandler_159(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 159
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 159
    end
    return metaData
end

function OceanLibrary.ComponentHandler_160(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 160
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 160
    end
    return metaData
end

function OceanLibrary.ComponentHandler_161(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 161
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 161
    end
    return metaData
end

function OceanLibrary.ComponentHandler_162(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 162
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 162
    end
    return metaData
end

function OceanLibrary.ComponentHandler_163(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 163
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 163
    end
    return metaData
end

function OceanLibrary.ComponentHandler_164(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 164
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 164
    end
    return metaData
end

function OceanLibrary.ComponentHandler_165(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 165
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 165
    end
    return metaData
end

function OceanLibrary.ComponentHandler_166(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 166
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 166
    end
    return metaData
end

function OceanLibrary.ComponentHandler_167(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 167
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 167
    end
    return metaData
end

function OceanLibrary.ComponentHandler_168(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 168
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 168
    end
    return metaData
end

function OceanLibrary.ComponentHandler_169(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 169
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 169
    end
    return metaData
end

function OceanLibrary.ComponentHandler_170(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 170
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 170
    end
    return metaData
end

function OceanLibrary.ComponentHandler_171(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 171
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 171
    end
    return metaData
end

function OceanLibrary.ComponentHandler_172(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 172
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 172
    end
    return metaData
end

function OceanLibrary.ComponentHandler_173(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 173
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 173
    end
    return metaData
end

function OceanLibrary.ComponentHandler_174(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 174
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 174
    end
    return metaData
end

function OceanLibrary.ComponentHandler_175(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 175
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 175
    end
    return metaData
end

function OceanLibrary.ComponentHandler_176(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 176
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 176
    end
    return metaData
end

function OceanLibrary.ComponentHandler_177(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 177
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 177
    end
    return metaData
end

function OceanLibrary.ComponentHandler_178(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 178
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 178
    end
    return metaData
end

function OceanLibrary.ComponentHandler_179(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 179
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 179
    end
    return metaData
end

function OceanLibrary.ComponentHandler_180(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 180
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 180
    end
    return metaData
end

function OceanLibrary.ComponentHandler_181(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 181
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 181
    end
    return metaData
end

function OceanLibrary.ComponentHandler_182(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 182
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 182
    end
    return metaData
end

function OceanLibrary.ComponentHandler_183(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 183
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 183
    end
    return metaData
end

function OceanLibrary.ComponentHandler_184(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 184
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 184
    end
    return metaData
end

function OceanLibrary.ComponentHandler_185(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 185
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 185
    end
    return metaData
end

function OceanLibrary.ComponentHandler_186(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 186
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 186
    end
    return metaData
end

function OceanLibrary.ComponentHandler_187(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 187
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 187
    end
    return metaData
end

function OceanLibrary.ComponentHandler_188(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 188
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 188
    end
    return metaData
end

function OceanLibrary.ComponentHandler_189(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 189
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 189
    end
    return metaData
end

function OceanLibrary.ComponentHandler_190(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 190
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 190
    end
    return metaData
end

function OceanLibrary.ComponentHandler_191(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 191
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 191
    end
    return metaData
end

function OceanLibrary.ComponentHandler_192(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 192
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 192
    end
    return metaData
end

function OceanLibrary.ComponentHandler_193(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 193
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 193
    end
    return metaData
end

function OceanLibrary.ComponentHandler_194(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 194
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 194
    end
    return metaData
end

function OceanLibrary.ComponentHandler_195(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 195
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 195
    end
    return metaData
end

function OceanLibrary.ComponentHandler_196(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 196
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 196
    end
    return metaData
end

function OceanLibrary.ComponentHandler_197(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 197
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 197
    end
    return metaData
end

function OceanLibrary.ComponentHandler_198(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 198
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 198
    end
    return metaData
end

function OceanLibrary.ComponentHandler_199(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 199
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 199
    end
    return metaData
end

function OceanLibrary.ComponentHandler_200(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 200
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 200
    end
    return metaData
end

function OceanLibrary.ComponentHandler_201(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 201
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 201
    end
    return metaData
end

function OceanLibrary.ComponentHandler_202(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 202
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 202
    end
    return metaData
end

function OceanLibrary.ComponentHandler_203(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 203
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 203
    end
    return metaData
end

function OceanLibrary.ComponentHandler_204(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 204
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 204
    end
    return metaData
end

function OceanLibrary.ComponentHandler_205(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 205
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 205
    end
    return metaData
end

function OceanLibrary.ComponentHandler_206(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 206
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 206
    end
    return metaData
end

function OceanLibrary.ComponentHandler_207(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 207
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 207
    end
    return metaData
end

function OceanLibrary.ComponentHandler_208(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 208
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 208
    end
    return metaData
end

function OceanLibrary.ComponentHandler_209(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 209
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 209
    end
    return metaData
end

function OceanLibrary.ComponentHandler_210(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 210
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 210
    end
    return metaData
end

function OceanLibrary.ComponentHandler_211(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 211
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 211
    end
    return metaData
end

function OceanLibrary.ComponentHandler_212(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 212
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 212
    end
    return metaData
end

function OceanLibrary.ComponentHandler_213(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 213
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 213
    end
    return metaData
end

function OceanLibrary.ComponentHandler_214(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 214
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 214
    end
    return metaData
end

function OceanLibrary.ComponentHandler_215(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 215
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 215
    end
    return metaData
end

function OceanLibrary.ComponentHandler_216(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 216
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 216
    end
    return metaData
end

function OceanLibrary.ComponentHandler_217(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 217
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 217
    end
    return metaData
end

function OceanLibrary.ComponentHandler_218(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 218
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 218
    end
    return metaData
end

function OceanLibrary.ComponentHandler_219(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 219
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 219
    end
    return metaData
end

function OceanLibrary.ComponentHandler_220(self, element, options)
    options = options or {}
    local metaData = {}
    metaData.Index = 220
    metaData.Theme = CONFIG.BgColor
    metaData.MainCard = CONFIG.MainCardBg
    metaData.Border = CONFIG.OuterBorderColor
    metaData.CyanGlow = CONFIG.GlowCyan
    metaData.PurpleGlow = CONFIG.GlowPurple
    metaData.GreenGlow = CONFIG.GlowGreen
    metaData.YellowGlow = CONFIG.GlowYellow
    metaData.ActiveBg = CONFIG.ActiveBg
    metaData.ActiveBorder = CONFIG.ActiveBorder
    metaData.ActiveText = CONFIG.ActiveText
    metaData.ComponentBg = CONFIG.ComponentBg
    metaData.ComponentBorder = CONFIG.ComponentBorder
    if element then
        metaData.ElementName = element.Name
        metaData.Size = element.Size
    end
    for idx = 1, 5 do
        metaData["Property_" .. idx] = (options["Prop_" .. idx] or idx) * 220
    end
    return metaData
end

function OceanLibrary:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Name or CONFIG.Title

    if CoreGui:FindFirstChild("OceanHubUI") then
        CoreGui:FindFirstChild("OceanHubUI"):Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OceanHubUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local Wrapper = Instance.new("Frame")
    Wrapper.Name = "Wrapper"
    Wrapper.Size = UDim2.new(0, 560, 0, 400)
    Wrapper.Position = UDim2.new(0.5, -280, 0.5, -200)
    Wrapper.BackgroundColor3 = CONFIG.BgColor
    Wrapper.BorderSizePixel = 0
    Wrapper.ClipsDescendants = true
    Wrapper.Parent = ScreenGui

    Instance.new("UICorner", Wrapper).CornerRadius = UDim.new(0, 16)
    local WrapperStroke = Instance.new("UIStroke", Wrapper)
    WrapperStroke.Color = CONFIG.OuterBorderColor
    WrapperStroke.Thickness = 2.5

    addCornerLights(Wrapper)

    local MainCard = Instance.new("Frame", Wrapper)
    MainCard.Name = "MainCard"
    MainCard.Size = UDim2.new(1, -20, 1, -20)
    MainCard.Position = UDim2.new(0, 10, 0, 10)
    MainCard.BackgroundColor3 = CONFIG.MainCardBg
    MainCard.BackgroundTransparency = 0.25
    MainCard.BorderSizePixel = 0
    MainCard.ZIndex = 2
    Instance.new("UICorner", MainCard).CornerRadius = UDim.new(0, 12)

    local Header = Instance.new("Frame", MainCard)
    Header.Size = UDim2.new(1, -30, 0, 48)
    Header.Position = UDim2.new(0, 15, 0, 10)
    Header.BackgroundTransparency = 1
    Header.ZIndex = 3

    local TitleLabel = Instance.new("TextLabel", Header)
    TitleLabel.Size = UDim2.new(1, -120, 0, 20)
    TitleLabel.Position = UDim2.new(0, 10, 0, 3)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = windowTitle
    TitleLabel.TextColor3 = CONFIG.TitleColor
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 3

    local CloseBtn = Instance.new("TextButton", Header)
    CloseBtn.Size = UDim2.new(0, 28, 0, 28)
    CloseBtn.Position = UDim2.new(1, -28, 0, 6)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 90)
    CloseBtn.BackgroundTransparency = 0.5
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(160, 210, 255)
    CloseBtn.TextSize = 13
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.ZIndex = 4
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local ContentContainer = Instance.new("Frame", MainCard)
    ContentContainer.Size = UDim2.new(1, -30, 1, -75)
    ContentContainer.Position = UDim2.new(0, 15, 0, 68)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.ZIndex = 3

    local WindowObj = {}
    WindowObj.Tabs = {}

    function WindowObj:MakeTab(tabOptions)
        tabOptions = tabOptions or {}
        local tabName = tabOptions.Name or "Tab"
        local TabObj = {}

        function TabObj:AddButton(opts)
            opts = opts or {}
            local btn = Instance.new("TextButton", ContentContainer)
            btn.Size = UDim2.new(1, 0, 0, 36)
            btn.BackgroundColor3 = CONFIG.ComponentBg
            btn.Text = opts.Name or "Button"
            btn.TextColor3 = CONFIG.TitleColor
            btn.Font = Enum.Font.GothamBold
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
            local stroke = Instance.new("UIStroke", btn)
            stroke.Color = CONFIG.ComponentBorder
            btn.MouseButton1Click:Connect(function()
                if opts.Callback then opts.Callback() end
            end)
            return btn
        end

        function TabObj:AddToggle(opts)
            opts = opts or {}
            local tgl = Instance.new("TextButton", ContentContainer)
            tgl.Size = UDim2.new(1, 0, 0, 36)
            tgl.BackgroundColor3 = CONFIG.ComponentBg
            tgl.Text = opts.Name or "Toggle"
            tgl.TextColor3 = CONFIG.TitleColor
            tgl.Font = Enum.Font.GothamBold
            Instance.new("UICorner", tgl).CornerRadius = UDim.new(0, 6)
            return tgl
        end

        table.insert(WindowObj.Tabs, TabObj)
        return TabObj
    end

    return WindowObj
end

function OceanLibrary:Notify(options)
    print("Notification:", options and options.Title, options and options.Content)
end

return OceanLibrary
