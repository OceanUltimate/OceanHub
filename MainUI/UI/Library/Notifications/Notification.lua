--[[
    OceanHub Notification Manager
]]
local NotificationManager = {}

function NotificationManager.Notify(options)
    options = options or {}
    local title = options.Title or "OceanHub"
    local content = options.Content or "Notification message"
    local duration = options.Duration or 5

    local CoreGui = game:GetService("CoreGui")
    local ScreenGui = CoreGui:FindFirstChild("OceanNotifications")
    if not ScreenGui then
        ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "OceanNotifications"
        ScreenGui.Parent = CoreGui
    end

    local Holder = ScreenGui:FindFirstChild("Holder")
    if not Holder then
        Holder = Instance.new("Frame")
        Holder.Name = "Holder"
        Holder.Size = UDim2.new(0, 250, 1, -20)
        Holder.Position = UDim2.new(1, -260, 0, 10)
        Holder.BackgroundTransparency = 1
        Holder.Parent = ScreenGui

        local ListLayout = Instance.new("UIListLayout")
        ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
        ListLayout.Padding = UDim.new(0, 10)
        ListLayout.Parent = Holder
    end

    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(1, 0, 0, 60)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = Holder

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = NotifFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 0, 20)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
    TitleLabel.TextSize = 14
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = NotifFrame

    local ContentLabel = Instance.new("TextLabel")
    ContentLabel.Size = UDim2.new(1, -20, 0, 30)
    ContentLabel.Position = UDim2.new(0, 10, 0, 25)
    ContentLabel.BackgroundTransparency = 1
    ContentLabel.Text = content
    ContentLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    ContentLabel.TextSize = 12
    ContentLabel.Font = Enum.Font.SourceSans
    ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
    ContentLabel.TextWrapped = true
    ContentLabel.Parent = NotifFrame

    task.delay(duration, function()
        NotifFrame:Destroy()
    end)
end

return NotificationManager
