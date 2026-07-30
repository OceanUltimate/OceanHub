--[[
    OceanHub Supabase Integration Module
    Connects to Supabase REST API endpoint for user key authentication and logs.
]]

local HttpService = game:GetService("HttpService")

local Supabase = {}
Supabase.Url = "https://rjctulesphfoqsmnkqrw.supabase.co"
Supabase.ApiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJqY3R1bGVzcGhmb3FzbW5rcXJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU0MTk1MTcsImV4cCI6MjEwMDk5NTUxN30.N4ynoTGMhQGZ5LtfGIIBJ7-hNaF7CtTIE4VefqGcEK0"

function Supabase.Request(endpoint, method, payload)
    local headers = {
        ["apikey"] = Supabase.ApiKey,
        ["Authorization"] = "Bearer " .. Supabase.ApiKey,
        ["Content-Type"] = "application/json"
    }

    local requestUrl = Supabase.Url .. "/rest/v1/" .. endpoint
    local success, response = pcall(function()
        return request({
            Url = requestUrl,
            Method = method or "GET",
            Headers = headers,
            Body = payload and HttpService:JSONEncode(payload) or nil
        })
    end)

    if success and response then
        local ok, data = pcall(function() return HttpService:JSONDecode(response.Body) end)
        return ok and data or response.Body
    end

    return nil
end

function Supabase.VerifyKey(key)
    if not key or key == "" then return false end
    local res = Supabase.Request("keys?select=*&key=eq." .. HttpService:UrlEncode(key), "GET")
    if res and type(res) == "table" and #res > 0 then
        return true, res[1]
    end
    return false, nil
end

return Supabase
