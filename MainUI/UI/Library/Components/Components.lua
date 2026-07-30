--[[
    OceanHub UI Library - Advanced Components
    Full UI Component implementations matching LoaderMenu.lua design & corner glow themes.
]]

local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/Components/Theme.lua"))() or {}

local Components = {}

local function createBaseFrame(parent, height, name)
    local Frame = Instance.new("Frame")
    Frame.Name = name or "ComponentFrame"
    Frame.Size = UDim2.new(1, -10, 0, height or 40)
    Frame.BackgroundColor3 = Theme.Colors.ComponentBg
    Frame.BorderSizePixel = 0
    Frame.Parent = parent

    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Theme.Colors.ComponentBorder
    Stroke.Thickness = 1

    return Frame, Stroke
end

function Components.CreateButton(parent, options)
    options = options or {}
    local name = options.Name or "Button"
    local iconId = options.Icon or Theme.Icons.Button
    local callback = options.Callback or function() end

    local Frame, Stroke = createBaseFrame(parent, 38, name .. "_ButtonFrame")

    local Icon = Instance.new("ImageLabel", Frame)
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(0, 10, 0.5, -10)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId
    Icon.ImageColor3 = Theme.Colors.SubTitleColor
    Icon.ZIndex = 4

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -40, 1, 0)
    Label.Position = UDim2.new(0, 36, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Theme.Colors.TextColor
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4

    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    Button.Text = ""
    Button.ZIndex = 5

    Button.MouseEnter:Connect(function()
        Frame.BackgroundColor3 = Theme.Colors.ActiveBg
        Stroke.Color = Theme.Colors.ActiveBorder
    end)
    Button.MouseLeave:Connect(function()
        Frame.BackgroundColor3 = Theme.Colors.ComponentBg
        Stroke.Color = Theme.Colors.ComponentBorder
    end)
    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return Frame
end

function Components.CreateToggle(parent, options)
    options = options or {}
    local name = options.Name or "Toggle"
    local default = options.Default or false
    local iconId = options.Icon or Theme.Icons.Toggle
    local callback = options.Callback or function() end

    local state = default
    local Frame, Stroke = createBaseFrame(parent, 38, name .. "_ToggleFrame")

    local Icon = Instance.new("ImageLabel", Frame)
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(0, 10, 0.5, -10)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId
    Icon.ImageColor3 = Theme.Colors.SubTitleColor
    Icon.ZIndex = 4

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -90, 1, 0)
    Label.Position = UDim2.new(0, 36, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Theme.Colors.TextColor
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4

    local ToggleOuter = Instance.new("Frame", Frame)
    ToggleOuter.Size = UDim2.new(0, 38, 0, 20)
    ToggleOuter.Position = UDim2.new(1, -48, 0.5, -10)
    ToggleOuter.BackgroundColor3 = state and Theme.Colors.ActiveBg or Color3.fromRGB(15, 30, 60)
    ToggleOuter.ZIndex = 4
    Instance.new("UICorner", ToggleOuter).CornerRadius = UDim.new(0, 10)
    local ToggleStroke = Instance.new("UIStroke", ToggleOuter)
    ToggleStroke.Color = state and Theme.Colors.ActiveBorder or Theme.Colors.ComponentBorder

    local Switch = Instance.new("Frame", ToggleOuter)
    Switch.Size = UDim2.new(0, 14, 0, 14)
    Switch.Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    Switch.BackgroundColor3 = Theme.Colors.TextColor
    Switch.ZIndex = 5
    Instance.new("UICorner", Switch).CornerRadius = UDim.new(0, 7)

    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    Button.Text = ""
    Button.ZIndex = 6

    Button.MouseButton1Click:Connect(function()
        state = not state
        ToggleOuter.BackgroundColor3 = state and Theme.Colors.ActiveBg or Color3.fromRGB(15, 30, 60)
        ToggleStroke.Color = state and Theme.Colors.ActiveBorder or Theme.Colors.ComponentBorder
        Switch.Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
        pcall(callback, state)
    end)

    return Frame
end

function Components.CreateSlider(parent, options)
    options = options or {}
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.Default or min
    local iconId = options.Icon or Theme.Icons.Slider
    local callback = options.Callback or function() end

    local val = default
    local Frame, Stroke = createBaseFrame(parent, 50, name .. "_SliderFrame")

    local Icon = Instance.new("ImageLabel", Frame)
    Icon.Size = UDim2.new(0, 18, 0, 18)
    Icon.Position = UDim2.new(0, 10, 0, 10)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId
    Icon.ImageColor3 = Theme.Colors.SubTitleColor
    Icon.ZIndex = 4

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -80, 0, 20)
    Label.Position = UDim2.new(0, 34, 0, 8)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Theme.Colors.TextColor
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4

    local ValLabel = Instance.new("TextLabel", Frame)
    ValLabel.Size = UDim2.new(0, 40, 0, 20)
    ValLabel.Position = UDim2.new(1, -50, 0, 8)
    ValLabel.BackgroundTransparency = 1
    ValLabel.Text = tostring(val)
    ValLabel.TextColor3 = Theme.Colors.SubTitleColor
    ValLabel.TextSize = 12
    ValLabel.Font = Enum.Font.GothamBold
    ValLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValLabel.ZIndex = 4

    local Bar = Instance.new("Frame", Frame)
    Bar.Size = UDim2.new(1, -20, 0, 6)
    Bar.Position = UDim2.new(0, 10, 0, 35)
    Bar.BackgroundColor3 = Color3.fromRGB(15, 30, 60)
    Bar.ZIndex = 4
    Instance.new("UICorner", Bar).CornerRadius = UDim.new(0, 3)

    local Fill = Instance.new("Frame", Bar)
    Fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Theme.Colors.GlowCyan
    Fill.ZIndex = 5
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(0, 3)

    return Frame
end

return Components
