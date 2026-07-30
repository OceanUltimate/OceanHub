--[[
    OceanHub UI Library (OceanLibrary) - SELF CONTAINED
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights & icons)
    Semua komponen, theme, notifikasi, dan UI sudah ada di satu file ini.
    Tidak memerlukan loadstring tambahan untuk file lain.
]]

local OceanLibrary = {}
OceanLibrary.__index = OceanLibrary

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- ═══════════════════════════════════════════════════════════
-- THEME (Matching LoaderMenu.lua colors)
-- ═══════════════════════════════════════════════════════════

local CONFIG = {
    Title = "Ocean Hub",
    Version = "LIBRARY V2",
    IconId = "rbxassetid://84718341622420",
    GlowAsset = "rbxassetid://5028857484",

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
    GlowYellow = Color3.fromRGB(251, 191, 36),
}

-- ═══════════════════════════════════════════════════════════
-- CORNER GLOW LIGHTS (4 sudut)
-- ═══════════════════════════════════════════════════════════

local function addCornerLights(parent, size, transparency)
    size = size or UDim2.new(0, 240, 0, 240)
    transparency = transparency or 0.02
    local corners = {
        {Pos = UDim2.new(0, -70, 0, -70), Color = CONFIG.GlowCyan},
        {Pos = UDim2.new(1, -170, 0, -70), Color = CONFIG.GlowPurple},
        {Pos = UDim2.new(0, -70, 1, -170), Color = CONFIG.GlowGreen},
        {Pos = UDim2.new(1, -170, 1, -170), Color = CONFIG.GlowYellow},
    }
    for _, c in ipairs(corners) do
        local Glow = Instance.new("ImageLabel")
        Glow.Name = "CornerGlow"
        Glow.Size = size
        Glow.Position = c.Pos
        Glow.BackgroundTransparency = 1
        Glow.Image = CONFIG.GlowAsset
        Glow.ImageColor3 = c.Color
        Glow.ImageTransparency = transparency
        Glow.ZIndex = 1
        Glow.Parent = parent
    end
end

-- ═══════════════════════════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════

function OceanLibrary:Notify(options)
    options = options or {}
    local title = options.Title or "OceanHub"
    local content = options.Content or "Notification"
    local duration = options.Duration or 5

    local ScreenGui = CoreGui:FindFirstChild("OceanNotifications")
    if not ScreenGui then
        ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "OceanNotifications"
        ScreenGui.ResetOnSpawn = false
        if gethui then
            ScreenGui.Parent = gethui()
        elseif syn and syn.protect_gui then
            syn.protect_gui(ScreenGui)
            ScreenGui.Parent = CoreGui
        else
            ScreenGui.Parent = CoreGui
        end
    end

    local Holder = ScreenGui:FindFirstChild("Holder")
    if not Holder then
        Holder = Instance.new("Frame")
        Holder.Name = "Holder"
        Holder.Size = UDim2.new(0, 280, 1, -20)
        Holder.Position = UDim2.new(1, -290, 0, 10)
        Holder.BackgroundTransparency = 1
        Holder.Parent = ScreenGui

        local ListLayout = Instance.new("UIListLayout")
        ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
        ListLayout.Padding = UDim.new(0, 10)
        ListLayout.Parent = Holder
    end

    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(1, 0, 0, 65)
    NotifFrame.BackgroundColor3 = CONFIG.BgColor
    NotifFrame.BorderSizePixel = 0
    NotifFrame.ClipsDescendants = true
    NotifFrame.Parent = Holder

    Instance.new("UICorner", NotifFrame).CornerRadius = UDim.new(0, 10)
    local Stroke = Instance.new("UIStroke", NotifFrame)
    Stroke.Color = CONFIG.OuterBorderColor
    Stroke.Thickness = 1.5

    addCornerLights(NotifFrame, UDim2.new(0, 100, 0, 100), 0.05)

    local TitleLabel = Instance.new("TextLabel", NotifFrame)
    TitleLabel.Size = UDim2.new(1, -20, 0, 22)
    TitleLabel.Position = UDim2.new(0, 12, 0, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = CONFIG.TitleColor
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 4

    local ContentLabel = Instance.new("TextLabel", NotifFrame)
    ContentLabel.Size = UDim2.new(1, -20, 0, 28)
    ContentLabel.Position = UDim2.new(0, 12, 0, 30)
    ContentLabel.BackgroundTransparency = 1
    ContentLabel.Text = content
    ContentLabel.TextColor3 = CONFIG.MutedText
    ContentLabel.TextSize = 11
    ContentLabel.Font = Enum.Font.Gotham
    ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
    ContentLabel.TextWrapped = true
    ContentLabel.ZIndex = 4

    task.delay(duration, function()
        if NotifFrame and NotifFrame.Parent then
            NotifFrame:Destroy()
        end
    end)
end

-- ═══════════════════════════════════════════════════════════
-- UI COMPONENTS (Button, Toggle, Slider, Dropdown, Textbox)
-- ═══════════════════════════════════════════════════════════

local function createBaseFrame(parent, height, name)
    local Frame = Instance.new("Frame")
    Frame.Name = name or "ComponentFrame"
    Frame.Size = UDim2.new(1, -10, 0, height or 40)
    Frame.BackgroundColor3 = CONFIG.ComponentBg
    Frame.BorderSizePixel = 0
    Frame.Parent = parent

    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 8)
    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Color = CONFIG.ComponentBorder
    Stroke.Thickness = 1

    return Frame, Stroke
end

local function CreateButton(parent, options)
    options = options or {}
    local name = options.Name or "Button"
    local callback = options.Callback or function() end

    local Frame, Stroke = createBaseFrame(parent, 38, name .. "_Btn")

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -20, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = CONFIG.TextColor
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
        Frame.BackgroundColor3 = CONFIG.ActiveBg
        Stroke.Color = CONFIG.ActiveBorder
    end)
    Button.MouseLeave:Connect(function()
        Frame.BackgroundColor3 = CONFIG.ComponentBg
        Stroke.Color = CONFIG.ComponentBorder
    end)
    Button.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    return Frame
end

local function CreateToggle(parent, options)
    options = options or {}
    local name = options.Name or "Toggle"
    local default = options.Default or false
    local callback = options.Callback or function() end

    local state = default
    local Frame, Stroke = createBaseFrame(parent, 38, name .. "_Tgl")

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = CONFIG.TextColor
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4

    local ToggleOuter = Instance.new("Frame", Frame)
    ToggleOuter.Size = UDim2.new(0, 38, 0, 20)
    ToggleOuter.Position = UDim2.new(1, -48, 0.5, -10)
    ToggleOuter.BackgroundColor3 = state and CONFIG.ActiveBg or Color3.fromRGB(15, 30, 60)
    ToggleOuter.ZIndex = 4
    Instance.new("UICorner", ToggleOuter).CornerRadius = UDim.new(0, 10)
    local ToggleStroke = Instance.new("UIStroke", ToggleOuter)
    ToggleStroke.Color = state and CONFIG.ActiveBorder or CONFIG.ComponentBorder

    local Switch = Instance.new("Frame", ToggleOuter)
    Switch.Size = UDim2.new(0, 14, 0, 14)
    Switch.Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    Switch.BackgroundColor3 = CONFIG.TextColor
    Switch.ZIndex = 5
    Instance.new("UICorner", Switch).CornerRadius = UDim.new(0, 7)

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(1, 0, 1, 0)
    Btn.BackgroundTransparency = 1
    Btn.Text = ""
    Btn.ZIndex = 6

    Btn.MouseButton1Click:Connect(function()
        state = not state
        ToggleOuter.BackgroundColor3 = state and CONFIG.ActiveBg or Color3.fromRGB(15, 30, 60)
        ToggleStroke.Color = state and CONFIG.ActiveBorder or CONFIG.ComponentBorder
        Switch.Position = state and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
        pcall(callback, state)
    end)

    return Frame
end

local function CreateSlider(parent, options)
    options = options or {}
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.Default or min
    local callback = options.Callback or function() end

    local val = default
    local Frame, Stroke = createBaseFrame(parent, 50, name .. "_Sld")

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, -60, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = CONFIG.TextColor
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4

    local ValLabel = Instance.new("TextLabel", Frame)
    ValLabel.Size = UDim2.new(0, 40, 0, 20)
    ValLabel.Position = UDim2.new(1, -50, 0, 5)
    ValLabel.BackgroundTransparency = 1
    ValLabel.Text = tostring(val)
    ValLabel.TextColor3 = CONFIG.SubTitleColor
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
    Fill.Size = UDim2.new(math.clamp((val - min) / (max - min), 0, 1), 0, 1, 0)
    Fill.BackgroundColor3 = CONFIG.GlowCyan
    Fill.ZIndex = 5
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(0, 3)

    local SliderBtn = Instance.new("TextButton", Bar)
    SliderBtn.Size = UDim2.new(1, 0, 1, 0)
    SliderBtn.BackgroundTransparency = 1
    SliderBtn.Text = ""
    SliderBtn.ZIndex = 6

    local dragging = false

    SliderBtn.MouseButton1Down:Connect(function()
        dragging = true
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local barPos = Bar.AbsolutePosition.X
            local barSize = Bar.AbsoluteSize.X
            local mouseX = input.Position.X
            local pct = math.clamp((mouseX - barPos) / barSize, 0, 1)
            val = math.floor(min + (max - min) * pct)
            Fill.Size = UDim2.new(pct, 0, 1, 0)
            ValLabel.Text = tostring(val)
            pcall(callback, val)
        end
    end)

    return Frame
end

local function CreateDropdown(parent, options)
    options = options or {}
    local name = options.Name or "Dropdown"
    local items = options.Options or {}
    local callback = options.Callback or function() end
    local selected = options.Default or (items[1] or "Select...")

    local Frame, Stroke = createBaseFrame(parent, 38, name .. "_Drop")

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(0.5, -10, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = CONFIG.TextColor
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4

    local SelectedLabel = Instance.new("TextLabel", Frame)
    SelectedLabel.Size = UDim2.new(0.5, -10, 1, 0)
    SelectedLabel.Position = UDim2.new(0.5, 0, 0, 0)
    SelectedLabel.BackgroundTransparency = 1
    SelectedLabel.Text = tostring(selected)
    SelectedLabel.TextColor3 = CONFIG.SubTitleColor
    SelectedLabel.TextSize = 12
    SelectedLabel.Font = Enum.Font.GothamBold
    SelectedLabel.TextXAlignment = Enum.TextXAlignment.Right
    SelectedLabel.ZIndex = 4

    return Frame
end

local function CreateTextbox(parent, options)
    options = options or {}
    local name = options.Name or "Textbox"
    local placeholder = options.Placeholder or "Type here..."
    local callback = options.Callback or function() end

    local Frame, Stroke = createBaseFrame(parent, 38, name .. "_Txt")

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(0, 100, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = CONFIG.TextColor
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamMedium
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 4

    local Box = Instance.new("TextBox", Frame)
    Box.Size = UDim2.new(1, -125, 0, 24)
    Box.Position = UDim2.new(0, 115, 0.5, -12)
    Box.BackgroundColor3 = Color3.fromRGB(8, 28, 65)
    Box.PlaceholderText = placeholder
    Box.PlaceholderColor3 = Color3.fromRGB(90, 140, 190)
    Box.Text = ""
    Box.TextColor3 = CONFIG.TextColor
    Box.TextSize = 12
    Box.Font = Enum.Font.Gotham
    Box.ClearTextOnFocus = false
    Box.ZIndex = 5
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 6)

    Box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            pcall(callback, Box.Text)
        end
    end)

    return Frame
end

-- ═══════════════════════════════════════════════════════════
-- MAIN WINDOW & TAB SYSTEM
-- ═══════════════════════════════════════════════════════════

function OceanLibrary:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Name or CONFIG.Title
    local subTitle = options.SubTitle or CONFIG.Version
    local iconId = options.Icon or CONFIG.IconId

    if CoreGui:FindFirstChild("OceanHubUI") then
        CoreGui:FindFirstChild("OceanHubUI"):Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OceanHubUI"
    ScreenGui.ResetOnSpawn = false

    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = CoreGui
    else
        ScreenGui.Parent = CoreGui
    end

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

    -- Corner Glowing Lights (4 sudut, sama seperti LoaderMenu.lua)
    addCornerLights(Wrapper, UDim2.new(0, 240, 0, 240), 0.02)

    -- Main Card
    local MainCard = Instance.new("Frame", Wrapper)
    MainCard.Name = "MainCard"
    MainCard.Size = UDim2.new(1, -20, 1, -20)
    MainCard.Position = UDim2.new(0, 10, 0, 10)
    MainCard.BackgroundColor3 = CONFIG.MainCardBg
    MainCard.BackgroundTransparency = 0.25
    MainCard.BorderSizePixel = 0
    MainCard.ZIndex = 2
    Instance.new("UICorner", MainCard).CornerRadius = UDim.new(0, 12)

    -- Draggable
    local dragging, dragInput, dragStart, startPos
    Wrapper.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Wrapper.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    Wrapper.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Wrapper.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Header
    local Header = Instance.new("Frame", MainCard)
    Header.Name = "Header"
    Header.Size = UDim2.new(1, -30, 0, 48)
    Header.Position = UDim2.new(0, 15, 0, 10)
    Header.BackgroundTransparency = 1
    Header.ZIndex = 3

    local LogoBox = Instance.new("Frame", Header)
    LogoBox.Size = UDim2.new(0, 42, 0, 42)
    LogoBox.BackgroundColor3 = CONFIG.ActiveBg
    LogoBox.BorderSizePixel = 0
    LogoBox.ClipsDescendants = false
    LogoBox.ZIndex = 3
    Instance.new("UICorner", LogoBox).CornerRadius = UDim.new(0, 10)
    local LogoStroke = Instance.new("UIStroke", LogoBox)
    LogoStroke.Color = CONFIG.OuterBorderColor
    LogoStroke.Transparency = 0.4

    -- Logo icon corner lights kecil
    addCornerLights(LogoBox, UDim2.new(0, 50, 0, 50), 0.03)

    local LogoImg = Instance.new("ImageLabel", LogoBox)
    LogoImg.Size = UDim2.new(1, 0, 1, 0)
    LogoImg.BackgroundTransparency = 1
    LogoImg.Image = iconId
    LogoImg.ScaleType = Enum.ScaleType.Fit
    LogoImg.ZIndex = 4
    Instance.new("UICorner", LogoImg).CornerRadius = UDim.new(0, 10)

    local TitleLabel = Instance.new("TextLabel", Header)
    TitleLabel.Size = UDim2.new(1, -120, 0, 20)
    TitleLabel.Position = UDim2.new(0, 50, 0, 3)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = windowTitle
    TitleLabel.TextColor3 = CONFIG.TitleColor
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 3

    local SubTitleLabel = Instance.new("TextLabel", Header)
    SubTitleLabel.Size = UDim2.new(1, -120, 0, 16)
    SubTitleLabel.Position = UDim2.new(0, 50, 0, 23)
    SubTitleLabel.BackgroundTransparency = 1
    SubTitleLabel.Text = subTitle
    SubTitleLabel.TextColor3 = CONFIG.SubTitleColor
    SubTitleLabel.TextSize = 11
    SubTitleLabel.Font = Enum.Font.GothamBold
    SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubTitleLabel.ZIndex = 3

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
    local CloseStroke = Instance.new("UIStroke", CloseBtn)
    CloseStroke.Color = CONFIG.ActiveBorder
    CloseStroke.Transparency = 0.5

    CloseBtn.MouseEnter:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
        CloseBtn.BackgroundTransparency = 0.1
        CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
    CloseBtn.MouseLeave:Connect(function()
        CloseBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 90)
        CloseBtn.BackgroundTransparency = 0.5
        CloseBtn.TextColor3 = Color3.fromRGB(160, 210, 255)
    end)
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Divider
    local HR = Instance.new("Frame", MainCard)
    HR.Size = UDim2.new(1, -30, 0, 1)
    HR.Position = UDim2.new(0, 15, 0, 60)
    HR.BackgroundColor3 = CONFIG.HeaderDividerColor
    HR.BorderSizePixel = 0
    HR.ZIndex = 3

    -- Tab Container (Left)
    local TabContainer = Instance.new("Frame", MainCard)
    TabContainer.Size = UDim2.new(0, 130, 1, -75)
    TabContainer.Position = UDim2.new(0, 15, 0, 68)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ZIndex = 3

    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 6)

    -- Content Container (Right)
    local ContentContainer = Instance.new("Frame", MainCard)
    ContentContainer.Size = UDim2.new(1, -160, 1, -75)
    ContentContainer.Position = UDim2.new(0, 150, 0, 68)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.ZIndex = 3

    -- Window Object
    local WindowObj = {}
    WindowObj.Tabs = {}

    function WindowObj:MakeTab(tabOptions)
        tabOptions = tabOptions or {}
        local tabName = tabOptions.Name or "Tab"

        local TabBtn = Instance.new("TextButton", TabContainer)
        TabBtn.Name = tabName .. "_TabBtn"
        TabBtn.Size = UDim2.new(1, 0, 0, 32)
        TabBtn.BackgroundColor3 = CONFIG.TabInactiveBg
        TabBtn.Text = "   " .. tabName
        TabBtn.TextColor3 = CONFIG.TabInactiveText
        TabBtn.TextSize = 13
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left
        TabBtn.ZIndex = 4

        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)
        local TabStroke = Instance.new("UIStroke", TabBtn)
        TabStroke.Color = CONFIG.TabInactiveBorder

        local Page = Instance.new("ScrollingFrame", ContentContainer)
        Page.Name = tabName .. "_Page"
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.BorderSizePixel = 0
        Page.Visible = false
        Page.ScrollBarThickness = 4
        Page.ScrollBarImageColor3 = CONFIG.ActiveBorder
        Page.ZIndex = 4

        local PageListLayout = Instance.new("UIListLayout", Page)
        PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageListLayout.Padding = UDim.new(0, 6)

        PageListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, PageListLayout.AbsoluteContentSize.Y + 20)
        end)

        local TabObj = {}
        TabObj.Button = TabBtn
        TabObj.Page = Page

        function TabObj:AddButton(opts) return CreateButton(Page, opts) end
        function TabObj:AddToggle(opts) return CreateToggle(Page, opts) end
        function TabObj:AddSlider(opts) return CreateSlider(Page, opts) end
        function TabObj:AddDropdown(opts) return CreateDropdown(Page, opts) end
        function TabObj:AddTextbox(opts) return CreateTextbox(Page, opts) end

        local function ActivateTab()
            for _, t in pairs(WindowObj.Tabs) do
                t.Page.Visible = false
                t.Button.BackgroundColor3 = CONFIG.TabInactiveBg
                t.Button.TextColor3 = CONFIG.TabInactiveText
                local stroke = t.Button:FindFirstChildOfClass("UIStroke")
                if stroke then stroke.Color = CONFIG.TabInactiveBorder end
            end
            Page.Visible = true
            TabBtn.BackgroundColor3 = CONFIG.ActiveBg
            TabBtn.TextColor3 = CONFIG.ActiveText
            TabStroke.Color = CONFIG.ActiveBorder
        end

        TabBtn.MouseButton1Click:Connect(ActivateTab)

        if #WindowObj.Tabs == 0 then
            ActivateTab()
        end

        table.insert(WindowObj.Tabs, TabObj)
        return TabObj
    end

    return WindowObj
end

return OceanLibrary
