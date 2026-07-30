--[[
    OceanHub Theme Manager & Design System
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights & icons)
]]

local Theme = {}

Theme.Colors = {
    BgColor = Color3.fromRGB(6, 18, 48),
    MainCardBg = Color3.fromRGB(4, 14, 38),
    HeaderBg = Color3.fromRGB(12, 28, 65),
    OuterBorderColor = Color3.fromRGB(38, 140, 215),
    HeaderDividerColor = Color3.fromRGB(25, 60, 110),

    TitleColor = Color3.fromRGB(255, 255, 255),
    SubTitleColor = Color3.fromRGB(125, 211, 252),
    TextColor = Color3.fromRGB(224, 242, 254),
    MutedText = Color3.fromRGB(140, 165, 210),

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

Theme.Icons = {
    Logo = "rbxassetid://84718341622420",
    GlowAsset = "rbxassetid://5028857484",
    Tab = "rbxassetid://6031763426",
    Button = "rbxassetid://6031068426",
    Toggle = "rbxassetid://6031068421",
    Slider = "rbxassetid://6031068429",
    Dropdown = "rbxassetid://6031068433",
    Keybind = "rbxassetid://6031068438",
    Textbox = "rbxassetid://6031068442",
    Colorpicker = "rbxassetid://6031068447",
    Label = "rbxassetid://6031068452",
    Section = "rbxassetid://6031068458",
    Notification = "rbxassetid://6031763435"
}

function Theme.AddCornerLights(parent, size, zIndex, transparency)
    size = size or UDim2.new(0, 200, 0, 200)
    zIndex = zIndex or 1
    transparency = transparency or 0.02

    local corners = {
        { Pos = UDim2.new(0, -70, 0, -70), Color = Theme.Colors.GlowCyan },
        { Pos = UDim2.new(1, -130, 0, -70), Color = Theme.Colors.GlowPurple },
        { Pos = UDim2.new(0, -70, 1, -130), Color = Theme.Colors.GlowGreen },
        { Pos = UDim2.new(1, -130, 1, -130), Color = Theme.Colors.GlowYellow }
    }

    local lightHolder = Instance.new("Folder")
    lightHolder.Name = "CornerLights"
    lightHolder.Parent = parent

    for _, c in ipairs(corners) do
        local Glow = Instance.new("ImageLabel")
        Glow.Name = "CornerGlow"
        Glow.Size = size
        Glow.Position = c.Pos
        Glow.BackgroundTransparency = 1
        Glow.Image = Theme.Icons.GlowAsset
        Glow.ImageColor3 = c.Color
        Glow.ImageTransparency = transparency
        Glow.ZIndex = zIndex
        Glow.Parent = lightHolder
    end
    return lightHolder
end

return Theme
