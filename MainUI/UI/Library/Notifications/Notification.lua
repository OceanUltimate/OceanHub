--[[
    OceanHub Notifications System with Corner Glow Effects
]]

local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/Components/Theme.lua"))() or {}

local NotificationManager = {}

function NotificationManager.Notify(options)
    options = options or {}
    local title = options.Title or "OceanHub"
    local content = options.Content or "Notification message"
    local duration = options.Duration or 5
    local iconId = options.Icon or Theme.Icons.Notification

    local CoreGui = game:GetService("CoreGui")
    local ScreenGui = CoreGui:FindFirstChild("OceanNotifications")
    if not ScreenGui then
        ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "OceanNotifications"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.Parent = CoreGui
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
    NotifFrame.BackgroundColor3 = Theme.Colors.BgColor
    NotifFrame.BorderSizePixel = 0
    NotifFrame.ClipsDescendants = true
    NotifFrame.Parent = Holder

    Instance.new("UICorner", NotifFrame).CornerRadius = UDim.new(0, 10)
    local Stroke = Instance.new("UIStroke", NotifFrame)
    Stroke.Color = Theme.Colors.OuterBorderColor
    Stroke.Thickness = 1.5

    Theme.AddCornerLights(NotifFrame, UDim2.new(0, 100, 0, 100), 1, 0.05)

    local Icon = Instance.new("ImageLabel", NotifFrame)
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Position = UDim2.new(0, 12, 0, 10)
    Icon.BackgroundTransparency = 1
    Icon.Image = iconId
    Icon.ImageColor3 = Theme.Colors.SubTitleColor
    Icon.ZIndex = 4

    local TitleLabel = Instance.new("TextLabel", NotifFrame)
    TitleLabel.Size = UDim2.new(1, -45, 0, 22)
    TitleLabel.Position = UDim2.new(0, 42, 0, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Theme.Colors.TitleColor
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 4

    local ContentLabel = Instance.new("TextLabel", NotifFrame)
    ContentLabel.Size = UDim2.new(1, -45, 0, 28)
    ContentLabel.Position = UDim2.new(0, 42, 0, 30)
    ContentLabel.BackgroundTransparency = 1
    ContentLabel.Text = content
    ContentLabel.TextColor3 = Theme.Colors.MutedText
    ContentLabel.TextSize = 11
    ContentLabel.Font = Enum.Font.Gotham
    ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
    ContentLabel.TextWrapped = true
    ContentLabel.ZIndex = 4

    task.delay(duration, function()
        NotifFrame:Destroy()
    end)
end

return NotificationManager
