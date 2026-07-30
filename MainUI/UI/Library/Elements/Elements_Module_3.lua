--[[
    OceanHub UI Library - Module: Elements / Elements_Module_3.lua
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights and icons)
]]

local Module = {}
Module.Name = "Elements_Module_3"
Module.Folder = "Elements"

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

function Module.ExecuteFeature_1_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_1_3"
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
    label.Text = (options.Name or "Feature 1") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_2_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_2_3"
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
    label.Text = (options.Name or "Feature 2") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_3_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_3_3"
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
    label.Text = (options.Name or "Feature 3") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_4_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_4_3"
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
    label.Text = (options.Name or "Feature 4") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_5_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_5_3"
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
    label.Text = (options.Name or "Feature 5") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_6_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_6_3"
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
    label.Text = (options.Name or "Feature 6") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_7_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_7_3"
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
    label.Text = (options.Name or "Feature 7") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_8_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_8_3"
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
    label.Text = (options.Name or "Feature 8") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_9_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_9_3"
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
    label.Text = (options.Name or "Feature 9") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_10_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_10_3"
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
    label.Text = (options.Name or "Feature 10") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_11_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_11_3"
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
    label.Text = (options.Name or "Feature 11") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_12_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_12_3"
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
    label.Text = (options.Name or "Feature 12") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_13_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_13_3"
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
    label.Text = (options.Name or "Feature 13") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_14_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_14_3"
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
    label.Text = (options.Name or "Feature 14") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_15_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_15_3"
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
    label.Text = (options.Name or "Feature 15") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_16_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_16_3"
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
    label.Text = (options.Name or "Feature 16") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_17_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_17_3"
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
    label.Text = (options.Name or "Feature 17") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_18_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_18_3"
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
    label.Text = (options.Name or "Feature 18") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_19_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_19_3"
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
    label.Text = (options.Name or "Feature 19") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_20_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_20_3"
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
    label.Text = (options.Name or "Feature 20") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_21_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_21_3"
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
    label.Text = (options.Name or "Feature 21") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_22_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_22_3"
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
    label.Text = (options.Name or "Feature 22") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_23_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_23_3"
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
    label.Text = (options.Name or "Feature 23") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_24_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_24_3"
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
    label.Text = (options.Name or "Feature 24") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_25_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_25_3"
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
    label.Text = (options.Name or "Feature 25") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_26_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_26_3"
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
    label.Text = (options.Name or "Feature 26") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_27_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_27_3"
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
    label.Text = (options.Name or "Feature 27") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_28_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_28_3"
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
    label.Text = (options.Name or "Feature 28") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_29_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_29_3"
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
    label.Text = (options.Name or "Feature 29") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_30_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_30_3"
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
    label.Text = (options.Name or "Feature 30") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_31_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_31_3"
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
    label.Text = (options.Name or "Feature 31") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_32_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_32_3"
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
    label.Text = (options.Name or "Feature 32") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_33_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_33_3"
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
    label.Text = (options.Name or "Feature 33") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_34_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_34_3"
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
    label.Text = (options.Name or "Feature 34") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_35_3(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_35_3"
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
    label.Text = (options.Name or "Feature 35") .. " [Elements Module 3]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

return Module
