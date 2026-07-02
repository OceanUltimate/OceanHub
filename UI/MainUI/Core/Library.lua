local Theme = require(script.Parent.Theme)
local Utils = require(script.Parent.Utils)
local Window = require(script.Parent.Parent.Components.Window)
local Button = require(script.Parent.Parent.Components.Button)
local TabView = require(script.Parent.Parent.Components.TabView)
local IconButton = require(script.Parent.Parent.Components.IconButton)
local Section = require(script.Parent.Parent.Components.Section)
local ColorPicker = require(script.Parent.Parent.Components.ColorPicker)
local BrandIcon = require(script.Parent.Parent.Components.BrandIcon)
local CommandCard = require(script.Parent.Parent.Components.CommandCard)
local Toggle = require(script.Parent.Parent.Components.Toggle)
local Slider = require(script.Parent.Parent.Components.Slider)
local AutoButton = require(script.Parent.Parent.Components.AutoButton)
local Notification = require(script.Parent.Parent.Components.Notification)

local UI = {
    Theme = Theme,
    Utils = Utils,
    Components = {
        Window = Window,
        Button = Button,
        TabView = TabView,
        IconButton = IconButton,
        Section = Section,
        ColorPicker = ColorPicker,
        BrandIcon = BrandIcon,
        CommandCard = CommandCard,
        Toggle = Toggle,
        Slider = Slider,
        AutoButton = AutoButton,
        Notification = Notification
    }
}

function UI.CreateWindow(options)
    return Window.new(options or {})
end

function UI.CreateButton(parent, options)
    return Button.new(parent, options or {})
end

function UI.CreateTabView(parent)
    return TabView.new(parent)
end

function UI.CreateIconButton(parent, options)
    return IconButton.new(parent, options or {})
end

function UI.CreateSection(parent, options)
    return Section.new(parent, options or {})
end

function UI.CreateColorPicker(parent, options)
    return ColorPicker.new(parent, options or {})
end

function UI.CreateBrandIcon(parent, options)
    return BrandIcon.new(parent, options or {})
end

function UI.CreateCommandCard(parent, options)
    return CommandCard.new(parent, options or {})
end

function UI.CreateToggle(parent, options)
    return Toggle.new(parent, options or {})
end

function UI.CreateSlider(parent, options)
    return Slider.new(parent, options or {})
end

function UI.CreateAutoButton(parent, options)
    return AutoButton.new(parent, options or {})
end

function UI.CreateNotification(parent, options)
    return Notification.new(parent or game.CoreGui, options or {})
end

return UI
