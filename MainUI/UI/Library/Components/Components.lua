--[[
    OceanHub UI Library - Components Container
]]
local Components = {}

-- Create Button Component
function Components.CreateButton(parent, options)
    options = options or {}
    local name = options.Name or "Button"
    local callback = options.Callback or function() end

    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.new(1, -20, 0, 35)
    Button.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
    Button.BorderSizePixel = 0
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.Font = Enum.Font.SourceSansBold
    Button.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button

    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return Button
end

-- Create Toggle Component
function Components.CreateToggle(parent, options)
    options = options or {}
    local name = options.Name or "Toggle"
    local default = options.Default or false
    local callback = options.Callback or function() end

    local state = default

    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Name = name .. "_Toggle"
    ToggleFrame.Size = UDim2.new(1, -20, 0, 35)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = ToggleFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Font = Enum.Font.SourceSans
    Label.Parent = ToggleFrame

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 20, 0, 20)
    Indicator.Position = UDim2.new(1, -30, 0.5, -10)
    Indicator.BackgroundColor3 = state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(70, 70, 70)
    Indicator.BorderSizePixel = 0
    Indicator.Parent = ToggleFrame

    local IndCorner = Instance.new("UICorner")
    IndCorner.CornerRadius = UDim.new(0, 4)
    IndCorner.Parent = Indicator

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    Button.Text = ""
    Button.Parent = ToggleFrame

    Button.MouseButton1Click:Connect(function()
        state = not state
        Indicator.BackgroundColor3 = state and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(70, 70, 70)
        pcall(callback, state)
    end)

    return ToggleFrame
end

-- Create Slider Component
function Components.CreateSlider(parent, options)
    options = options or {}
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.Default or min
    local callback = options.Callback or function() end

    local SliderFrame = Instance.new("Frame")
    SliderFrame.Name = name .. "_Slider"
    SliderFrame.Size = UDim2.new(1, -20, 0, 45)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = SliderFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -60, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name .. " (" .. tostring(default) .. ")"
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 14
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Font = Enum.Font.SourceSans
    Label.Parent = SliderFrame

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, -20, 0, 6)
    Bar.Position = UDim2.new(0, 10, 0, 30)
    Bar.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    Bar.BorderSizePixel = 0
    Bar.Parent = SliderFrame

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(0, 3)
    BarCorner.Parent = Bar

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(0, 3)
    FillCorner.Parent = Fill

    return SliderFrame
end

return Components
