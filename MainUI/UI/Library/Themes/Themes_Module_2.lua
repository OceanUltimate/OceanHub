--[[
    OceanHub UI Library - Module: Themes / Themes_Module_2.lua
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights and icons)
]]

local Module = {}
Module.Name = "Themes_Module_2"
Module.Folder = "Themes"

Module.Theme = {
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

function Module.AddCornerGlow(instance, color, size, zIndex, transparency)
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "CornerGlow"
    Glow.Size = size or UDim2.new(0, 240, 0, 240)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://5028857484"
    Glow.ImageColor3 = color or Module.Theme.GlowCyan
    Glow.ImageTransparency = transparency or 0.02
    Glow.ZIndex = zIndex or 1
    Glow.Parent = instance
    return Glow
end

function Module.ExecuteFeature_1_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_1_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 1") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_2_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_2_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 2") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_3_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_3_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 3") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_4_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_4_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 4") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_5_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_5_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 5") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_6_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_6_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 6") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_7_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_7_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 7") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_8_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_8_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 8") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_9_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_9_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 9") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_10_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_10_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 10") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_11_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_11_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 11") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_12_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_12_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 12") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_13_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_13_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 13") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_14_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_14_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 14") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_15_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_15_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 15") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_16_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_16_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 16") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_17_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_17_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 17") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_18_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_18_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 18") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_19_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_19_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 19") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_20_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_20_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 20") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_21_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_21_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 21") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_22_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_22_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 22") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_23_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_23_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 23") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_24_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_24_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 24") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_25_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_25_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 25") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_26_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_26_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 26") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_27_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_27_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 27") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_28_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_28_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 28") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_29_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_29_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 29") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_30_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_30_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 30") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_31_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_31_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 31") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_32_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_32_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 32") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_33_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_33_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 33") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_34_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_34_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 34") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_35_2(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_35_2"
    frame.Size = UDim2.new(1, -10, 0, 38)
    frame.BackgroundColor3 = Module.Theme.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Module.Theme.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 20, 0, 20)
    icon.Position = UDim2.new(0, 10, 0.5, -10)
    icon.BackgroundTransparency = 1
    icon.Image = "rbxassetid://84718341622420"
    icon.ImageColor3 = Module.Theme.VersionColor
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -40, 1, 0)
    label.Position = UDim2.new(0, 36, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = (options.Name or "Feature 35") .. " [Themes Module 2]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

return Module
