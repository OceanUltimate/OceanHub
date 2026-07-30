--[[
    OceanHub Extended UI Components Module 2
    Dropdown, Textbox, Keybind, Colorpicker & Label Elements
]]

local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/Components/Theme.lua"))() or {}

local ExtraComponents = {}

function ExtraComponents.CreateDropdown(parent, options)
    options = options or {}
    local name = options.Name or "Dropdown"
    local items = options.Options or {}
    local callback = options.Callback or function() end

    local Frame = Instance.new("Frame")
    Frame.Name = name .. "_Dropdown"
    Frame.Size = UDim2.new(1, -10, 0, 40)
    Frame.BackgroundColor3 = Theme.Colors.ComponentBg
    Frame.Parent = parent
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Theme.Colors.ComponentBorder

    local Icon = Instance.new("ImageLabel", Frame)
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(0, 10, 0, 10)
    Icon.BackgroundTransparency = 1
    Icon.Image = Theme.Icons.Dropdown
    Icon.ImageColor3 = Theme.Colors.SubTitleColor

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -40, 0, 40)
    Label.Position = UDim2.new(0, 36, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Theme.Colors.TextColor
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left

    return Frame
end

function ExtraComponents.CreateTextbox(parent, options)
    options = options or {}
    local name = options.Name or "Textbox"
    local placeholder = options.Placeholder or "Type here..."
    local callback = options.Callback or function() end

    local Frame = Instance.new("Frame")
    Frame.Name = name .. "_Textbox"
    Frame.Size = UDim2.new(1, -10, 0, 45)
    Frame.BackgroundColor3 = Theme.Colors.ComponentBg
    Frame.Parent = parent
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = Theme.Colors.ComponentBorder

    local Icon = Instance.new("ImageLabel", Frame)
    Icon.Size = UDim2.new(0, 20, 0, 20)
    Icon.Position = UDim2.new(0, 10, 0, 12.5)
    Icon.BackgroundTransparency = 1
    Icon.Image = Theme.Icons.Textbox
    Icon.ImageColor3 = Theme.Colors.SubTitleColor

    local Box = Instance.new("TextBox", Frame)
    Box.Size = UDim2.new(1, -120, 0, 28)
    Box.Position = UDim2.new(1, -110, 0, 8.5)
    Box.BackgroundColor3 = Color3.fromRGB(8, 28, 65)
    Box.PlaceholderText = placeholder
    Box.Text = ""
    Box.TextColor3 = Theme.Colors.TextColor
    Box.Font = Enum.Font.Gotham
    Box.TextSize = 12
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

    return Frame
end

return ExtraComponents
