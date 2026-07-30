--[[
    OceanHub UI Library (OceanLibrary)
    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights & icons)
    Main entry point loading components, notifications, themes, animations, elements, widgets, styles, handlers, and configs.
]]

local OceanLibrary = {}
OceanLibrary.__index = OceanLibrary

local BaseUrl = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/"

local function fetchModule(url)
    local success, code = pcall(function() return game:HttpGet(url) end)
    if success and code then
        local fn = loadstring(code)
        if fn then return fn() end
    end
    return {}
end

local Theme = fetchModule(BaseUrl .. "Components/Theme.lua")
local Notification = fetchModule(BaseUrl .. "Notifications/Notification.lua")
local Components = fetchModule(BaseUrl .. "Components/Components.lua")
local ExtraComponents = fetchModule(BaseUrl .. "Components/ExtraComponents.lua")

function OceanLibrary:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Name or "OceanHub"
    local subTitle = options.SubTitle or "ULTRALIGHT EDITION"
    local iconId = options.Icon or Theme.Icons.Logo

    local CoreGui = game:GetService("CoreGui")
    local UserInputService = game:GetService("UserInputService")

    if CoreGui:FindFirstChild("OceanHubUI") then
        CoreGui:FindFirstChild("OceanHubUI"):Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OceanHubUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local Wrapper = Instance.new("Frame")
    Wrapper.Name = "Wrapper"
    Wrapper.Size = UDim2.new(0, 560, 0, 400)
    Wrapper.Position = UDim2.new(0.5, -280, 0.5, -200)
    Wrapper.BackgroundColor3 = Theme.Colors.BgColor
    Wrapper.BorderSizePixel = 0
    Wrapper.ClipsDescendants = true
    Wrapper.Parent = ScreenGui

    Instance.new("UICorner", Wrapper).CornerRadius = UDim.new(0, 16)
    local WrapperStroke = Instance.new("UIStroke", Wrapper)
    WrapperStroke.Color = Theme.Colors.OuterBorderColor
    WrapperStroke.Thickness = 2.5

    -- Corner Glowing Lights in all 4 corners (Matching LoaderMenu.lua)
    Theme.AddCornerLights(Wrapper, UDim2.new(0, 240, 0, 240), 1, 0.02)

    -- Main Card Container
    local MainCard = Instance.new("Frame", Wrapper)
    MainCard.Name = "MainCard"
    MainCard.Size = UDim2.new(1, -20, 1, -20)
    MainCard.Position = UDim2.new(0, 10, 0, 10)
    MainCard.BackgroundColor3 = Theme.Colors.MainCardBg
    MainCard.BackgroundTransparency = 0.25
    MainCard.BorderSizePixel = 0
    MainCard.ZIndex = 2
    Instance.new("UICorner", MainCard).CornerRadius = UDim.new(0, 12)

    -- Draggable Feature
    local dragging, dragInput, dragStart, startPos
    Wrapper.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true dragStart = input.Position startPos = Wrapper.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    Wrapper.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            Wrapper.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Header / Title Bar
    local Header = Instance.new("Frame", MainCard)
    Header.Name = "Header"
    Header.Size = UDim2.new(1, -30, 0, 48)
    Header.Position = UDim2.new(0, 15, 0, 10)
    Header.BackgroundTransparency = 1
    Header.ZIndex = 3

    local LogoBox = Instance.new("Frame", Header)
    LogoBox.Size = UDim2.new(0, 42, 0, 42)
    LogoBox.BackgroundColor3 = Theme.Colors.ActiveBg
    LogoBox.BorderSizePixel = 0
    LogoBox.ZIndex = 3
    Instance.new("UICorner", LogoBox).CornerRadius = UDim.new(0, 10)
    local LogoStroke = Instance.new("UIStroke", LogoBox)
    LogoStroke.Color = Theme.Colors.OuterBorderColor
    LogoStroke.Transparency = 0.4

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
    TitleLabel.TextColor3 = Theme.Colors.TitleColor
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 3

    local SubTitleLabel = Instance.new("TextLabel", Header)
    SubTitleLabel.Size = UDim2.new(1, -120, 0, 16)
    SubTitleLabel.Position = UDim2.new(0, 50, 0, 23)
    SubTitleLabel.BackgroundTransparency = 1
    SubTitleLabel.Text = subTitle
    SubTitleLabel.TextColor3 = Theme.Colors.SubTitleColor
    SubTitleLabel.TextSize = 11
    SubTitleLabel.Font = Enum.Font.GothamBold
    SubTitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubTitleLabel.ZIndex = 3

    local CloseBtn = Instance.new("TextButton", Header)
    CloseBtn.Size = UDim2.new(0, 28, 0, 28)
    CloseBtn.Position = UDim2.new(1, -28, 0, 6)
    CloseBtn.BackgroundColor3 = Theme.Colors.HeaderBg
    CloseBtn.BackgroundTransparency = 0.5
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Theme.Colors.SubTitleColor
    CloseBtn.TextSize = 13
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.ZIndex = 4
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
    local CloseStroke = Instance.new("UIStroke", CloseBtn)
    CloseStroke.Color = Theme.Colors.ActiveBorder
    CloseStroke.Transparency = 0.5

    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local HR = Instance.new("Frame", MainCard)
    HR.Size = UDim2.new(1, -30, 0, 1)
    HR.Position = UDim2.new(0, 15, 0, 60)
    HR.BackgroundColor3 = Theme.Colors.HeaderDividerColor
    HR.BorderSizePixel = 0
    HR.ZIndex = 3

    -- Tab Container Left Side
    local TabContainer = Instance.new("Frame", MainCard)
    TabContainer.Size = UDim2.new(0, 130, 1, -75)
    TabContainer.Position = UDim2.new(0, 15, 0, 68)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ZIndex = 3

    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 6)

    -- Content Container Right Side
    local ContentContainer = Instance.new("Frame", MainCard)
    ContentContainer.Size = UDim2.new(1, -160, 1, -75)
    ContentContainer.Position = UDim2.new(0, 150, 0, 68)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.ZIndex = 3

    local WindowObj = {}
    WindowObj.Tabs = {}

    function WindowObj:MakeTab(tabOptions)
        tabOptions = tabOptions or {}
        local tabName = tabOptions.Name or "Tab"

        local TabBtn = Instance.new("TextButton", TabContainer)
        TabBtn.Name = tabName .. "_TabBtn"
        TabBtn.Size = UDim2.new(1, 0, 0, 32)
        TabBtn.BackgroundColor3 = Theme.Colors.TabInactiveBg
        TabBtn.Text = "   " .. tabName
        TabBtn.TextColor3 = Theme.Colors.TabInactiveText
        TabBtn.TextSize = 13
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left
        TabBtn.ZIndex = 4

        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 6)
        local TabStroke = Instance.new("UIStroke", TabBtn)
        TabStroke.Color = Theme.Colors.TabInactiveBorder

        local Page = Instance.new("ScrollingFrame", ContentContainer)
        Page.Name = tabName .. "_Page"
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.BorderSizePixel = 0
        Page.Visible = false
        Page.ScrollBarThickness = 4
        Page.ScrollBarImageColor3 = Theme.Colors.ActiveBorder
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

        function TabObj:AddButton(opts) return Components.CreateButton(Page, opts) end
        function TabObj:AddToggle(opts) return Components.CreateToggle(Page, opts) end
        function TabObj:AddSlider(opts) return Components.CreateSlider(Page, opts) end
        function TabObj:AddDropdown(opts) return ExtraComponents.CreateDropdown(Page, opts) end
        function TabObj:AddTextbox(opts) return ExtraComponents.CreateTextbox(Page, opts) end

        local function ActivateTab()
            for _, t in pairs(WindowObj.Tabs) do
                t.Page.Visible = false
                t.Button.BackgroundColor3 = Theme.Colors.TabInactiveBg
                t.Button.TextColor3 = Theme.Colors.TabInactiveText
                t.Button:FindFirstChildOfClass("UIStroke").Color = Theme.Colors.TabInactiveBorder
            end
            Page.Visible = true
            TabBtn.BackgroundColor3 = Theme.Colors.ActiveBg
            TabBtn.TextColor3 = Theme.Colors.ActiveText
            TabStroke.Color = Theme.Colors.ActiveBorder
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

function OceanLibrary:Notify(options)
    if Notification and Notification.Notify then
        Notification.Notify(options)
    end
end

return OceanLibrary
