--[[
    OceanHub — Component/Supabase/Main.lua
    Supabase REST helper.  Returns a module table used by Loader.lua
    to verify premium keys and (optionally) log usage.

    Usage (from Loader.lua):
        local Supabase = loadstring(game:HttpGet(RAW.."MainScript/Component/Supabase/Main.lua"))()
        local ok = Supabase.VerifyKey("OCEAN-xxxx")
]]

local HttpService = game:GetService("HttpService")

-- ────────────────────────────────────────────────────────────────────────
-- CONFIG  (set these before using the module)
-- ────────────────────────────────────────────────────────────────────────
local Supabase = {}
Supabase.URL  = ""   -- e.g. "https://xyzxyz.supabase.co"
Supabase.KEY  = ""   -- anon/public key

-- ────────────────────────────────────────────────────────────────────────
-- INTERNAL: GET request with Supabase auth headers
-- ────────────────────────────────────────────────────────────────────────
local function sbGet(endpoint)
    local url = Supabase.URL .. endpoint
    local ok, res = pcall(function()
        return HttpService:GetAsync(url, true, {
            ["apikey"]        = Supabase.KEY,
            ["Authorization"] = "Bearer " .. Supabase.KEY,
            ["Content-Type"]  = "application/json",
        })
    end)
    if not ok then return nil, res end
    return HttpService:JSONDecode(res), nil
end

-- ────────────────────────────────────────────────────────────────────────
-- INTERNAL: POST request
-- ────────────────────────────────────────────────────────────────────────
local function sbPost(endpoint, body)
    local url = Supabase.URL .. endpoint
    local ok, res = pcall(function()
        return HttpService:PostAsync(url,
            HttpService:JSONEncode(body),
            Enum.HttpContentType.ApplicationJson,
            false,
            {
                ["apikey"]        = Supabase.KEY,
                ["Authorization"] = "Bearer " .. Supabase.KEY,
            }
        )
    end)
    if not ok then return nil, res end
    return HttpService:JSONDecode(res), nil
end

-- ────────────────────────────────────────────────────────────────────────
-- PUBLIC: VerifyKey(key) → bool
--   Checks the `keys` table for a row where:
--     key = <key>  AND  is_active = true  AND  expires_at > now (or null)
--
-- BUG FIX (original Loader.lua): expiry was only checked when expires_at
-- was non-empty; but some rows were stored as null (JSON null) which Lua
-- decoded as nil, bypassing the check entirely.
-- Now we explicitly handle nil/null as "never expires" (pass) while
-- empty string "" is treated as "no expiry" (pass) and any non-empty
-- value is parsed & compared.
-- ────────────────────────────────────────────────────────────────────────
function Supabase.VerifyKey(key)
    if Supabase.URL == "" or Supabase.KEY == "" then
        warn("[Supabase] URL or KEY not configured – VerifyKey always returns false")
        return false
    end

    local encoded = HttpService:UrlEncode(tostring(key))
    local data, err = sbGet(
        "/rest/v1/keys?key=eq." .. encoded ..
        "&select=key,is_active,expires_at&limit=1"
    )

    if not data or #data == 0 then
        return false
    end

    local row = data[1]

    -- must be active
    if row.is_active ~= true then return false end

    -- check expiry
    local exp = row.expires_at
    if exp and exp ~= "" then
        -- parse ISO-8601: "2025-12-31T00:00:00Z"
        local yr, mo, dy, hr, mn, sc = tostring(exp):match(
            "(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)"
        )
        if yr then
            local expEpoch = os.time({
                year  = tonumber(yr),
                month = tonumber(mo),
                day   = tonumber(dy),
                hour  = tonumber(hr),
                min   = tonumber(mn),
                sec   = tonumber(sc),
                isdst = false,
            })
            if os.time() > expEpoch then
                return false   -- expired
            end
        end
    end

    return true
end

-- ────────────────────────────────────────────────────────────────────────
-- PUBLIC: LogUsage(key, gameId) → void
--   Inserts a row into `usage_logs` (optional, fire-and-forget).
-- ────────────────────────────────────────────────────────────────────────
function Supabase.LogUsage(key, gameId)
    if Supabase.URL == "" or Supabase.KEY == "" then return end
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer
    task.spawn(function()
        sbPost("/rest/v1/usage_logs", {
            key      = key,
            game_id  = tostring(gameId or game.PlaceId),
            username = lp and lp.Name or "unknown",
        })
    end)
end

-- ────────────────────────────────────────────────────────────────────────
-- PUBLIC: Configure(url, key) — shorthand
-- ────────────────────────────────────────────────────────────────────────
function Supabase.Configure(url, key)
    Supabase.URL = url or ""
    Supabase.KEY = key or ""
end

return Supabase
