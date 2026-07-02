local DeviceConfig = {}

local deviceModules = {
    PC = require(script.PC),
    Laptop = require(script.Laptop),
    Mac = require(script.Mac),
    HP = require(script.HP),
    Default = require(script.Default)
}

local normalizedToKey = {
    pc = "PC",
    desktop = "PC",
    laptop = "Laptop",
    notebook = "Laptop",
    mac = "Mac",
    macbook = "Mac",
    hp = "HP"
}

function DeviceConfig.Get(deviceName)
    local normalized = type(deviceName) == "string" and deviceName:lower() or ""
    local key = normalizedToKey[normalized] or "Default"
    return deviceModules[key] or deviceModules.Default
end

return DeviceConfig
