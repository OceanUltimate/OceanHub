--[[
    OceanHub UI Library (OceanLibrary)
    Main UI Library implementation providing Window, Tab, Button, Toggle, Slider, and Notification creation.
]]

local OceanLibrary = {}
OceanLibrary.__index = OceanLibrary

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/Notifications/Notification.lua"))() or {}
local Components = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/Components/Components.lua"))() or {}

function OceanLibrary:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Name or "OceanHub UI"

    local CoreGui = game:GetService("CoreGui")
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "OceanHubMainUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 550, 0, 380)
    MainFrame.Position = UDim2.new(0.5, -275, 0.5, -190)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 20, 28)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainFrame

    -- Header / Title Bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 40)
    TitleBar.BackgroundColor3 = Color3.fromRGB(22, 28, 40)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame

    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 10)
    TitleCorner.Parent = TitleBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 1, 0)
    TitleLabel.Position = UDim2.new(0, 15, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = windowTitle
    TitleLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar

    -- Tab Bar (Left Side)
    local TabContainer = Instance.new("Frame")
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(0, 140, 1, -50)
    TabContainer.Position = UDim2.new(0, 10, 0, 45)
    TabContainer.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
    TabContainer.BorderSizePixel = 0
    TabContainer.Parent = MainFrame

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 8)
    TabCorner.Parent = TabContainer

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)
    TabListLayout.Parent = TabContainer

    -- Content Container (Right Side)
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -170, 1, -50)
    ContentContainer.Position = UDim2.new(0, 160, 0, 45)
    ContentContainer.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Parent = MainFrame

    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 8)
    ContentCorner.Parent = ContentContainer

    local WindowObj = {}
    WindowObj.Tabs = {}
    WindowObj.ActiveTab = nil

    function WindowObj:MakeTab(tabOptions)
        tabOptions = tabOptions or {}
        local tabName = tabOptions.Name or "Tab"

        local TabButton = Instance.new("TextButton")
        TabButton.Name = tabName .. "_Button"
        TabButton.Size = UDim2.new(1, 0, 0, 35)
        TabButton.BackgroundColor3 = Color3.fromRGB(28, 35, 48)
        TabButton.BorderSizePixel = 0
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(180, 180, 180)
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Parent = TabContainer

        local TabButtonCorner = Instance.new("UICorner")
        TabButtonCorner.CornerRadius = UDim.new(0, 6)
        TabButtonCorner.Parent = TabButton

        local Page = Instance.new("ScrollingFrame")
        Page.Name = tabName .. "_Page"
        Page.Size = UDim2.new(1, -10, 1, -10)
        Page.Position = UDim2.new(0, 5, 0, 5)
        Page.BackgroundTransparency = 1
        Page.BorderSizePixel = 0
        Page.Visible = false
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.ScrollBarThickness = 4
        Page.Parent = ContentContainer

        local PageListLayout = Instance.new("UIListLayout")
        PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageListLayout.Padding = UDim.new(0, 8)
        PageListLayout.Parent = Page

        PageListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, PageListLayout.AbsoluteContentSize.Y + 10)
        end)

        local TabObj = {}

        function TabObj:AddButton(btnOptions)
            return Components.CreateButton(Page, btnOptions)
        end

        function TabObj:AddToggle(tglOptions)
            return Components.CreateToggle(Page, tglOptions)
        end

        function TabObj:AddSlider(sldOptions)
            return Components.CreateSlider(Page, sldOptions)
        end

        local function ActivateTab()
            for _, t in pairs(WindowObj.Tabs) do
                t.Page.Visible = false
                t.Button.TextColor3 = Color3.fromRGB(180, 180, 180)
                t.Button.BackgroundColor3 = Color3.fromRGB(28, 35, 48)
            end
            Page.Visible = true
            TabButton.TextColor3 = Color3.fromRGB(0, 170, 255)
            TabButton.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
            WindowObj.ActiveTab = TabObj
        end

        TabButton.MouseButton1Click:Connect(ActivateTab)

        if #WindowObj.Tabs == 0 then
            ActivateTab()
        end

        TabObj.Button = TabButton
        TabObj.Page = Page

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