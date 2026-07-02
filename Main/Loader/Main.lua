local MenuUI = require(script.Parent.Parent.Parent.UI.MenuUI.init)
local DeviceConfig = require(script.Parent.DeviceConfig.ConfigManager)

local function detectDeviceType()
    local camera = workspace.CurrentCamera
    local viewportSize = Vector2.new(1280, 720)

    if camera then
        viewportSize = camera.ViewportSize
    end

    if viewportSize.X >= 1600 then
        return "PC"
    elseif viewportSize.X >= 1400 then
        return "Laptop"
    elseif viewportSize.X >= 1200 then
        return "Mac"
    end

    return "Default"
end

local deviceConfig = DeviceConfig.Get(detectDeviceType())
MenuUI.LoaderMenu.build(game.CoreGui, deviceConfig)
