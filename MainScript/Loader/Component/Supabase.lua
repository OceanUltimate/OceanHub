local HttpService = game:GetService("HttpService")

local Supabase = {}
Supabase.Url = "https://rjctulesphfoqsmnkqrw.supabase.co"
Supabase.ApiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJqY3R1bGVzcGhmb3FzbW5rcXJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODU0MTk1MTcsImV4cCI6MjEwMDk5NTUxN30.N4ynoTGMhQGZ5LtfGIIBJ7-hNaF7CtTIE4VefqGcEK0"

local function decodeBody(body)
    if not body or body == "" then
        return nil
    end

    local ok, data = pcall(function()
        return HttpService:JSONDecode(body)
    end)

    return ok and data or body
end

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

    if not success or not response then
        return false, {
            valid = false,
            message = "Request ke Supabase gagal."
        }
    end

    local data = decodeBody(response.Body)
    if response.StatusCode >= 200 and response.StatusCode < 300 then
        return true, data
    end

    if type(data) == "table" and data.message then
        return false, {
            valid = false,
            message = data.message
        }
    end

    return false, {
        valid = false,
        message = "Supabase error (" .. tostring(response.StatusCode) .. ")."
    }
end

function Supabase.ValidateKey(key, playerName)
    if not key or key == "" then
        return false, {
            valid = false,
            message = "Key kosong."
        }
    end

    local ok, data = Supabase.Request("rpc/validate_key", "POST", {
        input_key = key,
        player_name = playerName or "Unknown"
    })

    if not ok then
        return false, data
    end

    if type(data) ~= "table" then
        return false, {
            valid = false,
            message = "Response Supabase tidak valid."
        }
    end

    if data.valid == true then
        return true, data
    end

    return false, data
end

function Supabase.VerifyKey(key, playerName)
    return Supabase.ValidateKey(key, playerName)
end

return Supabase
