--[[
    OceanHub UI Library - Module: Handlers / Handlers_Module_4.lua
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights and icons)
]]

local Module = {}
Module.Name = "Handlers_Module_4"
Module.Folder = "Handlers"

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

function Module.ExecuteFeature_1_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_1_4"
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
    label.Text = (options.Name or "Feature 1") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_2_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_2_4"
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
    label.Text = (options.Name or "Feature 2") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_3_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_3_4"
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
    label.Text = (options.Name or "Feature 3") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_4_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_4_4"
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
    label.Text = (options.Name or "Feature 4") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_5_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_5_4"
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
    label.Text = (options.Name or "Feature 5") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_6_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_6_4"
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
    label.Text = (options.Name or "Feature 6") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_7_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_7_4"
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
    label.Text = (options.Name or "Feature 7") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_8_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_8_4"
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
    label.Text = (options.Name or "Feature 8") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_9_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_9_4"
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
    label.Text = (options.Name or "Feature 9") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_10_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_10_4"
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
    label.Text = (options.Name or "Feature 10") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_11_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_11_4"
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
    label.Text = (options.Name or "Feature 11") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_12_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_12_4"
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
    label.Text = (options.Name or "Feature 12") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_13_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_13_4"
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
    label.Text = (options.Name or "Feature 13") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_14_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_14_4"
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
    label.Text = (options.Name or "Feature 14") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_15_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_15_4"
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
    label.Text = (options.Name or "Feature 15") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_16_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_16_4"
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
    label.Text = (options.Name or "Feature 16") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_17_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_17_4"
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
    label.Text = (options.Name or "Feature 17") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_18_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_18_4"
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
    label.Text = (options.Name or "Feature 18") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_19_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_19_4"
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
    label.Text = (options.Name or "Feature 19") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_20_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_20_4"
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
    label.Text = (options.Name or "Feature 20") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_21_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_21_4"
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
    label.Text = (options.Name or "Feature 21") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_22_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_22_4"
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
    label.Text = (options.Name or "Feature 22") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_23_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_23_4"
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
    label.Text = (options.Name or "Feature 23") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_24_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_24_4"
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
    label.Text = (options.Name or "Feature 24") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_25_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_25_4"
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
    label.Text = (options.Name or "Feature 25") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_26_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_26_4"
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
    label.Text = (options.Name or "Feature 26") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_27_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_27_4"
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
    label.Text = (options.Name or "Feature 27") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_28_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_28_4"
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
    label.Text = (options.Name or "Feature 28") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_29_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_29_4"
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
    label.Text = (options.Name or "Feature 29") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_30_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_30_4"
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
    label.Text = (options.Name or "Feature 30") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_31_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_31_4"
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
    label.Text = (options.Name or "Feature 31") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_32_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_32_4"
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
    label.Text = (options.Name or "Feature 32") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_33_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_33_4"
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
    label.Text = (options.Name or "Feature 33") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_34_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_34_4"
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
    label.Text = (options.Name or "Feature 34") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

function Module.ExecuteFeature_35_4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_35_4"
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
    label.Text = (options.Name or "Feature 35") .. " [Handlers Module 4]"
    label.TextColor3 = Module.Theme.TitleColor
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end

return Module
