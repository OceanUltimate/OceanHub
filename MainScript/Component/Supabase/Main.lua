local HttpService = game:GetService("HttpService")

local Supabase = {}
Supabase.URL = ""
Supabase.KEY = ""

function Supabase.Configure(url, key)
    Supabase.URL = url or ""
    Supabase.KEY = key or ""
end

-- Pakai RPC validate_key (SECURITY DEFINER, bypass RLS)
function Supabase.VerifyKey(key, playerName)
    if Supabase.URL == "" or Supabase.KEY == "" then
        warn("[Supabase] Not configured")
        return false, "Not configured"
    end

    local ok, res = pcall(function()
        return HttpService:PostAsync(
            Supabase.URL .. "/rest/v1/rpc/validate_key",
            HttpService:JSONEncode({ input_key = key, player_name = playerName or "unknown" }),
            Enum.HttpContentType.ApplicationJson,
            false,
            {
                ["apikey"]        = Supabase.KEY,
                ["Authorization"] = "Bearer " .. Supabase.KEY,
            }
        )
    end)

    if not ok then return false, tostring(res) end

    local data = HttpService:JSONDecode(res)
    if data and data.valid == true then
        return true, data.message, data.tier
    end
    return false, (data and data.message) or "Invalid key"
end

return Supabase
