--[[
    OceanHub — Component/Luarmor/Main.lua
    Luarmor whitelist verification helper.

    Luarmor injects a global `getgenv().LUARMOR_VERIFIED` flag when
    the script has passed whitelist validation at the executor level.
    This module wraps that check and provides a fallback bypass flag
    for executors that don't support Luarmor (e.g. Arceus X, KRNL).

    Usage:
        local Luarmor = loadstring(game:HttpGet(RAW.."MainScript/Component/Luarmor/Main.lua"))()
        if not Luarmor.IsVerified() then
            error("Not whitelisted!")
        end
]]

local Luarmor = {}

-- ────────────────────────────────────────────────────────────────────────
-- CONFIG
-- ────────────────────────────────────────────────────────────────────────
-- Set to true to skip Luarmor check (for testing / non-Luarmor deployments)
Luarmor.BYPASS = false

-- Optional: set your Luarmor project ID for logging purposes
Luarmor.PROJECT_ID = ""

-- ────────────────────────────────────────────────────────────────────────
-- IsVerified() → bool
--   Returns true if:
--     (a) BYPASS is enabled, OR
--     (b) The Luarmor executor injection has set LUARMOR_VERIFIED = true
-- ────────────────────────────────────────────────────────────────────────
function Luarmor.IsVerified()
    if Luarmor.BYPASS then return true end

    -- Luarmor injects into getgenv() at executor level
    local ok, env = pcall(getgenv)
    if ok and env and env.LUARMOR_VERIFIED == true then
        return true
    end

    -- Some Luarmor versions use a different flag name
    if ok and env and env.luarmor_verified == true then
        return true
    end

    return false
end

-- ────────────────────────────────────────────────────────────────────────
-- GetHWID() → string | nil
--   Returns the executor HWID if available (used for whitelist logging).
-- ────────────────────────────────────────────────────────────────────────
function Luarmor.GetHWID()
    -- gethwid() is available on some executors (Synapse, Fluxus, etc.)
    local ok, hwid = pcall(gethwid)
    if ok and hwid then return tostring(hwid) end
    return nil
end

-- ────────────────────────────────────────────────────────────────────────
-- RequireVerified() → void  (errors if not verified)
-- ────────────────────────────────────────────────────────────────────────
function Luarmor.RequireVerified()
    if not Luarmor.IsVerified() then
        error("[OceanHub] Luarmor verification failed. Please use the official loader.", 2)
    end
end

return Luarmor
