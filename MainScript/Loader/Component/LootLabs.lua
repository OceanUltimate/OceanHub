--[[
    OceanHub LootLabs Key System Integration
    Connects to LootLabs API for key verification and link generation.
]]

local HttpService = game:GetService("HttpService")

local LootLabs = {}
LootLabs.ApiKey = "56fe45b855ce544933f17f488ec690d1d1b928c3831aa96ec0dc11398d71339d"

function LootLabs.VerifyToken(userToken)
    if not userToken or userToken == "" then return false end

    local url = "https://api.lootlabs.gg/v1/verify?token=" .. HttpService:UrlEncode(userToken)
    local headers = {
        ["Authorization"] = "Bearer " .. LootLabs.ApiKey,
        ["Accept"] = "application/json"
    }

    local success, response = pcall(function()
        return request({
            Url = url,
            Method = "GET",
            Headers = headers
        })
    end)

    if success and response and response.StatusCode == 200 then
        local ok, data = pcall(function() return HttpService:JSONEncode(response.Body) end)
        return ok and data and data.success == true
    end

    return false
end

return LootLabs
