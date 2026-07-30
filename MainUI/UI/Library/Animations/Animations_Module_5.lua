--[[
    OceanHub UI Library - Module: Animations / Animations_Module_5.lua
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights and icons)
]]

local Module = {}
Module.Name = "Animations_Module_5"
Module.Folder = "Animations"

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

function Module.ExecuteFeature_1_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_1_5"
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
    label.Text = (options.Name or "Feature 1") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_2_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_2_5"
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
    label.Text = (options.Name or "Feature 2") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_3_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_3_5"
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
    label.Text = (options.Name or "Feature 3") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_4_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_4_5"
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
    label.Text = (options.Name or "Feature 4") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_5_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_5_5"
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
    label.Text = (options.Name or "Feature 5") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_6_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_6_5"
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
    label.Text = (options.Name or "Feature 6") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_7_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_7_5"
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
    label.Text = (options.Name or "Feature 7") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_8_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_8_5"
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
    label.Text = (options.Name or "Feature 8") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_9_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_9_5"
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
    label.Text = (options.Name or "Feature 9") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_10_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_10_5"
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
    label.Text = (options.Name or "Feature 10") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_11_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_11_5"
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
    label.Text = (options.Name or "Feature 11") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_12_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_12_5"
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
    label.Text = (options.Name or "Feature 12") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_13_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_13_5"
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
    label.Text = (options.Name or "Feature 13") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_14_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_14_5"
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
    label.Text = (options.Name or "Feature 14") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_15_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_15_5"
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
    label.Text = (options.Name or "Feature 15") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_16_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_16_5"
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
    label.Text = (options.Name or "Feature 16") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_17_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_17_5"
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
    label.Text = (options.Name or "Feature 17") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_18_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_18_5"
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
    label.Text = (options.Name or "Feature 18") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_19_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_19_5"
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
    label.Text = (options.Name or "Feature 19") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_20_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_20_5"
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
    label.Text = (options.Name or "Feature 20") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_21_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_21_5"
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
    label.Text = (options.Name or "Feature 21") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_22_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_22_5"
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
    label.Text = (options.Name or "Feature 22") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_23_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_23_5"
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
    label.Text = (options.Name or "Feature 23") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_24_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_24_5"
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
    label.Text = (options.Name or "Feature 24") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_25_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_25_5"
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
    label.Text = (options.Name or "Feature 25") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_26_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_26_5"
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
    label.Text = (options.Name or "Feature 26") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_27_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_27_5"
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
    label.Text = (options.Name or "Feature 27") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_28_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_28_5"
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
    label.Text = (options.Name or "Feature 28") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_29_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_29_5"
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
    label.Text = (options.Name or "Feature 29") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_30_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_30_5"
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
    label.Text = (options.Name or "Feature 30") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_31_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_31_5"
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
    label.Text = (options.Name or "Feature 31") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_32_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_32_5"
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
    label.Text = (options.Name or "Feature 32") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_33_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_33_5"
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
    label.Text = (options.Name or "Feature 33") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_34_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_34_5"
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
    label.Text = (options.Name or "Feature 34") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_35_5(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_35_5"
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
    label.Text = (options.Name or "Feature 35") .. " [Animations Module 5]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

return Module
