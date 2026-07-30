--[[ OceanHub UI Components Pack 4 -- Midnight Ocean Theme ]]
local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/Components/Theme.lua"))() or {}
local Pack = {}
Pack.ID = 4
Pack.ThemeName = "Midnight Ocean"
Pack.GlowColors = {Theme.Colors.GlowCyan, Theme.Colors.GlowPurple, Theme.Colors.GlowGreen, Theme.Colors.GlowYellow}
function Pack.CreateElement_1_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_1_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 1") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_2_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_2_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 2") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_3_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_3_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 3") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_4_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_4_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 4") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_5_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_5_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 5") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_6_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_6_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 6") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_7_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_7_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 7") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_8_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_8_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 8") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_9_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_9_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 9") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_10_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_10_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 10") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_11_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_11_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 11") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_12_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_12_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 12") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_13_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_13_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 13") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_14_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_14_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 14") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_15_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_15_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 15") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_16_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_16_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 16") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_17_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_17_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 17") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_18_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_18_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 18") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_19_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_19_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 19") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_20_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_20_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 20") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_21_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_21_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 21") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_22_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_22_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 22") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_23_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_23_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 23") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_24_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_24_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 24") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.CreateElement_25_P4(parent, options)
    options = options or {}
    local frame = Instance.new("Frame")
    frame.Name = "Elem_25_P4"
    frame.Size = UDim2.new(1, -10, 0, 36)
    frame.BackgroundColor3 = Theme.Colors.ComponentBg
    frame.BorderSizePixel = 0
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Theme.Colors.ComponentBorder
    local icon = Instance.new("ImageLabel", frame)
    icon.Size = UDim2.new(0, 18, 0, 18)
    icon.Position = UDim2.new(0, 8, 0.5, -9)
    icon.BackgroundTransparency = 1
    icon.Image = Theme.Icons.Button
    icon.ImageColor3 = Theme.Colors.SubTitleColor
    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -35, 1, 0)
    lbl.Position = UDim2.new(0, 30, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (options.Name or "Element 25") .. " [Pack 4]"
    lbl.TextColor3 = Theme.Colors.TextColor
    lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return frame
end
function Pack.Utility_1_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 1
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_2_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 2
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_3_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 3
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_4_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 4
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_5_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 5
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_6_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 6
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_7_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 7
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_8_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 8
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_9_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 9
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_10_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 10
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_11_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 11
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_12_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 12
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_13_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 13
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_14_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 14
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_15_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 15
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_16_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 16
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_17_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 17
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_18_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 18
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_19_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 19
    res.Color = Theme.Colors.BgColor
    return res
end
function Pack.Utility_20_P4(input)
    local res = {}
    res.Input = input
    res.Pack = 4
    res.UtilityIndex = 20
    res.Color = Theme.Colors.BgColor
    return res
end
return Pack
