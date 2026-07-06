local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Load Supabase component
local REPO_RAW = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local Supabase = loadstring(game:HttpGet(REPO_RAW .. "MainScript/Component/Supabase/Main.lua"))()
Supabase.Configure(
    "https://SUPABASE_PROJECT_ID.supabase.co",  -- ganti dengan URL Supabase kamu
    "SUPABASE_ANON_KEY_KAMU"                     -- ganti dengan anon key kamu
)

-- ============================================================
-- CONFIG
-- ============================================================
local CONFIG = {
    ICON            = "rbxassetid://84718341622420",
    HUB_NAME        = "OceanHub",
    VERSION         = "v1.0",
    SUPABASE_URL    = Supabase.URL,
    SUPABASE_ANON   = Supabase.KEY,

    -- Ocean theme colors
    COLOR_BG        = Color3.fromRGB(7, 18, 32),
    COLOR_CARD      = Color3.fromRGB(10, 25, 50),
    COLOR_ACCENT    = Color3.fromRGB(0, 160, 230),
    COLOR_FREE      = Color3.fromRGB(180, 40, 55),
    -- PREMIUM uses yellow/gold
    COLOR_PREMIUM   = Color3.fromRGB(200, 160, 20),
    COLOR_PREM_TEXT = Color3.fromRGB(255, 230, 120),
    COLOR_PREM_BG   = Color3.fromRGB(120, 90, 0),
    COLOR_TEXT      = Color3.fromRGB(200, 230, 255),
    COLOR_MUTED     = Color3.fromRGB(100, 150, 200),
    COLOR_CORNER    = Color3.fromRGB(0, 160, 230),

    -- FOLDER 2 – Free games
    GAMES_FREE = {
        { name = "🍎 Blox Fruits",      icon = "🍎", place = 2753915549 },
        { name = "🐾 Pet Simulator X",  icon = "🐾", place = 6284583030 },
        { name = "⚔️ Anime Adventures", icon = "⚔️", place = 7329895630 },
        { name = "🏙️ Da Hood",          icon = "🏙️", place = 2788229376 },
        { name = "🔫 Arsenal",          icon = "🔫", place = 286090429  },
    },

    -- FOLDER 3 – Premium games (yellow/gold, more games)
    GAMES_PREMIUM = {
        { name = "🍎 Blox Fruits",      icon = "🍎", place = 2753915549 },
        { name = "🐾 Pet Simulator X",  icon = "🐾", place = 6284583030 },
        { name = "⚔️ Anime Adventures", icon = "⚔️", place = 7329895630 },
        { name = "🏙️ Da Hood",          icon = "🏙️", place = 2788229376 },
        { name = "🔫 Arsenal",          icon = "🔫", place = 286090429  },
        { name = "🚔 Jailbreak",        icon = "🚔", place = 606849621  },
        { name = "🚪 Doors",            icon = "🚪", place = 6516141723 },
    },
}

-- ============================================================
-- UTILITIES
-- ============================================================
local function makeCorner(radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    return c
end

local function makeStroke(color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color = color or CONFIG.COLOR_ACCENT
    s.Thickness = thickness or 1.5
    s.Transparency = transparency or 0.4
    return s
end

local function makePadding(top, bottom, left, right)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, top    or 8)
    p.PaddingBottom = UDim.new(0, bottom or 8)
    p.PaddingLeft   = UDim.new(0, left   or 8)
    p.PaddingRight  = UDim.new(0, right  or 8)
    return p
end

local function tween(obj, props, duration, style, direction)
    local info = TweenInfo.new(
        duration  or 0.25,
        style     or Enum.EasingStyle.Quad,
        direction or Enum.EasingDirection.Out
    )
    TweenService:Create(obj, info, props):Play()
end

-- KEY VERIFICATION: delegated to Supabase component
local function verifyKeySupabase(key)
    return Supabase.VerifyKey(key)
end

-- ============================================================
-- DESTROY OLD GUI
-- ============================================================
if PlayerGui:FindFirstChild("OceanHubLoader") then
    PlayerGui:FindFirstChild("OceanHubLoader"):Destroy()
end

-- ============================================================
-- SCREEN GUI
-- ============================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name           = "OceanHubLoader"
ScreenGui.ResetOnSpawn   = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent         = PlayerGui

-- Overlay
local Overlay = Instance.new("Frame")
Overlay.Name                  = "Overlay"
Overlay.Size                  = UDim2.fromScale(1, 1)
Overlay.BackgroundColor3      = Color3.fromRGB(3, 10, 20)
Overlay.BackgroundTransparency = 0.3
Overlay.ZIndex                = 1
Overlay.Parent                = ScreenGui

-- ============================================================
-- FOLDER 1 – MAIN CARD (Free / Premium + Key Input)
-- ============================================================
local Card = Instance.new("Frame")
Card.Name                  = "Card"
-- BUG FIX: start at full size with transparency=1 here, NOT after parenting,
-- to avoid a 1-frame flash of 0-size before the tween sets it back.
-- We set Size properly and let the entry animation control transparency.
Card.Size                  = UDim2.new(0, 420, 0, 320)
Card.Position              = UDim2.fromScale(0.5, 0.5)
Card.AnchorPoint           = Vector2.new(0.5, 0.5)
Card.BackgroundColor3      = CONFIG.COLOR_CARD
Card.BackgroundTransparency = 1
Card.ZIndex                = 2
Card.Parent                = ScreenGui
makeCorner(20).Parent = Card
makeStroke(CONFIG.COLOR_ACCENT, 1.5, 0.35).Parent = Card

-- Corner glow lights (decorative)
local cornerDefs = {
    { pos = UDim2.new(0, -15, 0, -15), anchor = Vector2.new(0, 0) },
    { pos = UDim2.new(1, 15,  0, -15), anchor = Vector2.new(1, 0) },
    { pos = UDim2.new(0, -15, 1, 15),  anchor = Vector2.new(0, 1) },
    { pos = UDim2.new(1, 15,  1, 15),  anchor = Vector2.new(1, 1) },
}
for _, cp in ipairs(cornerDefs) do
    local light = Instance.new("ImageLabel")
    light.Size               = UDim2.new(0, 110, 0, 110)
    light.Position           = cp.pos
    light.AnchorPoint        = cp.anchor
    light.BackgroundTransparency = 1
    light.Image              = "rbxassetid://5028857084"
    light.ImageColor3        = CONFIG.COLOR_CORNER
    light.ImageTransparency  = 0.55
    light.ZIndex             = 3
    light.Parent             = Card
end

-- Header
local Header = Instance.new("Frame")
Header.Size                  = UDim2.new(1, -32, 0, 60)
Header.Position              = UDim2.new(0, 16, 0, 18)
Header.BackgroundTransparency = 1
Header.ZIndex                = 4
Header.Parent                = Card

local Icon = Instance.new("ImageLabel")
Icon.Size                    = UDim2.new(0, 52, 0, 52)
Icon.Position                = UDim2.new(0, 0, 0.5, 0)
Icon.AnchorPoint             = Vector2.new(0, 0.5)
Icon.BackgroundColor3        = Color3.fromRGB(15, 70, 160)
Icon.Image                   = CONFIG.ICON
Icon.ScaleType               = Enum.ScaleType.Fit
Icon.ZIndex                  = 5
Icon.Parent                  = Header
makeCorner(12).Parent = Icon
makeStroke(CONFIG.COLOR_ACCENT, 1.5, 0.4).Parent = Icon

-- Fallback emoji shown if image fails to load
local IconEmoji = Instance.new("TextLabel")
IconEmoji.Size               = UDim2.fromScale(1, 1)
IconEmoji.BackgroundTransparency = 1
IconEmoji.Text               = "🌊"
IconEmoji.TextSize           = 28
IconEmoji.Font               = Enum.Font.GothamBold
IconEmoji.ZIndex             = 6
IconEmoji.Parent             = Icon

local TitleBlock = Instance.new("Frame")
TitleBlock.Size              = UDim2.new(1, -68, 1, 0)
TitleBlock.Position          = UDim2.new(0, 64, 0, 0)
TitleBlock.BackgroundTransparency = 1
TitleBlock.ZIndex            = 5
TitleBlock.Parent            = Header

local HubTitle = Instance.new("TextLabel")
HubTitle.Size                = UDim2.new(1, 0, 0, 30)
HubTitle.Position            = UDim2.new(0, 0, 0, 6)
HubTitle.BackgroundTransparency = 1
HubTitle.Text                = CONFIG.HUB_NAME
HubTitle.TextColor3          = CONFIG.COLOR_TEXT
HubTitle.TextSize            = 26
HubTitle.Font                = Enum.Font.GothamBold
HubTitle.TextXAlignment      = Enum.TextXAlignment.Left
HubTitle.ZIndex              = 6
HubTitle.Parent              = TitleBlock

local HubSub = Instance.new("TextLabel")
HubSub.Size                  = UDim2.new(1, 0, 0, 18)
HubSub.Position              = UDim2.new(0, 0, 0, 38)
HubSub.BackgroundTransparency = 1
HubSub.Text                  = "LOADER " .. CONFIG.VERSION
HubSub.TextColor3            = CONFIG.COLOR_MUTED
HubSub.TextSize              = 13
HubSub.Font                  = Enum.Font.GothamMedium
HubSub.TextXAlignment        = Enum.TextXAlignment.Left
HubSub.ZIndex                = 6
HubSub.Parent                = TitleBlock

-- Horizontal divider line
local Divider = Instance.new("Frame")
Divider.Size                  = UDim2.new(1, -32, 0, 1)
Divider.Position              = UDim2.new(0, 16, 0, 92)
Divider.BackgroundColor3      = CONFIG.COLOR_ACCENT
Divider.BackgroundTransparency = 0.65
Divider.ZIndex                = 4
Divider.Parent                = Card

-- "Choose your access type"
local Subtitle = Instance.new("TextLabel")
Subtitle.Size                 = UDim2.new(1, -32, 0, 22)
Subtitle.Position             = UDim2.new(0, 16, 0, 104)
Subtitle.BackgroundTransparency = 1
Subtitle.Text                 = "Choose your access type"
Subtitle.TextColor3           = CONFIG.COLOR_MUTED
Subtitle.TextSize             = 15
Subtitle.Font                 = Enum.Font.Gotham
Subtitle.ZIndex               = 4
Subtitle.Parent               = Card

-- Button Row (Free & Premium)
local BtnRow = Instance.new("Frame")
BtnRow.Size                  = UDim2.new(1, -32, 0, 110)
BtnRow.Position              = UDim2.new(0, 16, 0, 136)
BtnRow.BackgroundTransparency = 1
BtnRow.ZIndex                = 4
BtnRow.Parent                = Card

local rowLayout = Instance.new("UIListLayout")
rowLayout.FillDirection      = Enum.FillDirection.Horizontal
rowLayout.SortOrder          = Enum.SortOrder.LayoutOrder
rowLayout.Padding            = UDim.new(0, 14)
rowLayout.Parent             = BtnRow

-- ── FREE button ──────────────────────────────────────────────
local BtnFree = Instance.new("TextButton")
BtnFree.Name                 = "BtnFree"
BtnFree.Size                 = UDim2.new(0.5, -7, 1, 0)
BtnFree.BackgroundColor3     = Color3.fromRGB(160, 30, 45)
BtnFree.BackgroundTransparency = 0.4
BtnFree.Text                 = ""
BtnFree.ZIndex               = 5
BtnFree.LayoutOrder          = 1
BtnFree.Parent               = BtnRow
makeCorner(14).Parent = BtnFree
makeStroke(CONFIG.COLOR_FREE, 1.5, 0.35).Parent = BtnFree

local FreeTitleLbl = Instance.new("TextLabel")
FreeTitleLbl.Size            = UDim2.new(1, 0, 0, 26)
FreeTitleLbl.Position        = UDim2.new(0, 0, 0.5, -22)
FreeTitleLbl.BackgroundTransparency = 1
FreeTitleLbl.Text            = "🆓 Free"
FreeTitleLbl.TextColor3      = Color3.fromRGB(255, 200, 205)
FreeTitleLbl.TextSize        = 20
FreeTitleLbl.Font            = Enum.Font.GothamBold
FreeTitleLbl.ZIndex          = 6
FreeTitleLbl.Parent          = BtnFree

local FreeDescLbl = Instance.new("TextLabel")
FreeDescLbl.Size             = UDim2.new(1, -16, 0, 18)
FreeDescLbl.Position         = UDim2.new(0, 8, 0.5, 8)
FreeDescLbl.BackgroundTransparency = 1
FreeDescLbl.Text             = "Free game access"
FreeDescLbl.TextColor3       = Color3.fromRGB(255, 180, 185)
FreeDescLbl.TextTransparency = 0.25
FreeDescLbl.TextSize         = 13
FreeDescLbl.Font             = Enum.Font.Gotham
FreeDescLbl.ZIndex           = 6
FreeDescLbl.Parent           = BtnFree

-- ── PREMIUM button (yellow/gold) ─────────────────────────────
local BtnPremium = Instance.new("TextButton")
BtnPremium.Name              = "BtnPremium"
BtnPremium.Size              = UDim2.new(0.5, -7, 1, 0)
BtnPremium.BackgroundColor3  = Color3.fromRGB(110, 80, 5)
BtnPremium.BackgroundTransparency = 0.35
BtnPremium.Text              = ""
BtnPremium.ZIndex            = 5
BtnPremium.LayoutOrder       = 2
BtnPremium.Parent            = BtnRow
makeCorner(14).Parent = BtnPremium
makeStroke(CONFIG.COLOR_PREMIUM, 1.5, 0.3).Parent = BtnPremium

local PremTitleLbl = Instance.new("TextLabel")
PremTitleLbl.Size            = UDim2.new(1, 0, 0, 26)
PremTitleLbl.Position        = UDim2.new(0, 0, 0.5, -22)
PremTitleLbl.BackgroundTransparency = 1
PremTitleLbl.Text            = "👑 Premium"
PremTitleLbl.TextColor3      = CONFIG.COLOR_PREM_TEXT
PremTitleLbl.TextSize        = 20
PremTitleLbl.Font            = Enum.Font.GothamBold
PremTitleLbl.ZIndex          = 6
PremTitleLbl.Parent          = BtnPremium

local PremDescLbl = Instance.new("TextLabel")
PremDescLbl.Size             = UDim2.new(1, -16, 0, 18)
PremDescLbl.Position         = UDim2.new(0, 8, 0.5, 8)
PremDescLbl.BackgroundTransparency = 1
PremDescLbl.Text             = "Full access with key"
PremDescLbl.TextColor3       = Color3.fromRGB(255, 220, 100)
PremDescLbl.TextTransparency = 0.2
PremDescLbl.TextSize         = 13
PremDescLbl.Font             = Enum.Font.Gotham
PremDescLbl.ZIndex           = 6
PremDescLbl.Parent           = BtnPremium

-- Close button (main card X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size                = UDim2.new(0, 28, 0, 28)
CloseBtn.Position            = UDim2.new(1, -14, 0, -14)
CloseBtn.AnchorPoint         = Vector2.new(0.5, 0.5)
CloseBtn.BackgroundColor3    = Color3.fromRGB(180, 40, 55)
CloseBtn.BackgroundTransparency = 0.3
CloseBtn.Text                = "✕"
CloseBtn.TextColor3          = Color3.fromRGB(255, 200, 200)
CloseBtn.TextSize            = 13
CloseBtn.Font                = Enum.Font.GothamBold
CloseBtn.ZIndex              = 10
CloseBtn.Parent              = Card
makeCorner(14).Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    tween(Card,    { BackgroundTransparency = 1 }, 0.3)
    tween(Overlay, { BackgroundTransparency = 1 }, 0.3)
    task.delay(0.35, function() ScreenGui:Destroy() end)
end)

-- ============================================================
-- TOAST NOTIFICATION
-- ============================================================
local function showToast(msg, color)
    local toast = Instance.new("Frame")
    toast.Size               = UDim2.new(0, 310, 0, 44)
    toast.Position           = UDim2.new(0.5, 0, 1, 70)
    toast.AnchorPoint        = Vector2.new(0.5, 1)
    toast.BackgroundColor3   = color or CONFIG.COLOR_ACCENT
    toast.BackgroundTransparency = 0.2
    toast.ZIndex             = 80
    toast.Parent             = ScreenGui
    makeCorner(12).Parent = toast
    makeStroke(color or CONFIG.COLOR_ACCENT, 1, 0.25).Parent = toast

    local lbl = Instance.new("TextLabel")
    lbl.Size                 = UDim2.fromScale(1, 1)
    lbl.BackgroundTransparency = 1
    lbl.Text                 = msg
    lbl.TextColor3           = Color3.fromRGB(230, 248, 255)
    lbl.TextSize             = 16
    lbl.Font                 = Enum.Font.GothamMedium
    lbl.ZIndex               = 81
    lbl.Parent               = toast

    tween(toast, { Position = UDim2.new(0.5, 0, 1, -20) }, 0.3)
    task.delay(2.5, function()
        tween(toast, { Position = UDim2.new(0.5, 0, 1, 70) }, 0.3)
        task.delay(0.35, function() toast:Destroy() end)
    end)
end

-- ============================================================
-- HELPER: CREATE MODAL
-- ============================================================
local function createModal(titleText, modalHeight, accentColor, titleColor)
    local ac = accentColor or CONFIG.COLOR_ACCENT
    local tc = titleColor  or CONFIG.COLOR_TEXT

    local modal = Instance.new("Frame")
    modal.Name               = "Modal"
    modal.Size               = UDim2.new(0, 380, 0, modalHeight or 300)
    modal.Position           = UDim2.fromScale(0.5, 0.5)
    modal.AnchorPoint        = Vector2.new(0.5, 0.5)
    modal.BackgroundColor3   = Color3.fromRGB(5, 14, 28)
    modal.BackgroundTransparency = 0.05
    modal.ZIndex             = 30
    modal.Visible            = false
    modal.Parent             = ScreenGui
    makeCorner(16).Parent = modal
    makeStroke(ac, 1.5, 0.3).Parent = modal

    -- Corner lights (uses accent color)
    local mCorners = {
        { pos = UDim2.new(0,-12,0,-12), anchor = Vector2.new(0,0) },
        { pos = UDim2.new(1,12, 0,-12), anchor = Vector2.new(1,0) },
        { pos = UDim2.new(0,-12,1,12),  anchor = Vector2.new(0,1) },
        { pos = UDim2.new(1,12, 1,12),  anchor = Vector2.new(1,1) },
    }
    for _, cp in ipairs(mCorners) do
        local l = Instance.new("ImageLabel")
        l.Size               = UDim2.new(0, 80, 0, 80)
        l.Position           = cp.pos
        l.AnchorPoint        = cp.anchor
        l.BackgroundTransparency = 1
        l.Image              = "rbxassetid://5028857084"
        l.ImageColor3        = ac
        l.ImageTransparency  = 0.6
        l.ZIndex             = 31
        l.Parent             = modal
    end

    -- Title
    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size            = UDim2.new(1, -50, 0, 36)
    titleLbl.Position        = UDim2.new(0, 16, 0, 14)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text            = titleText
    titleLbl.TextColor3      = tc
    titleLbl.TextSize        = 17
    titleLbl.Font            = Enum.Font.GothamBold
    titleLbl.TextXAlignment  = Enum.TextXAlignment.Left
    titleLbl.ZIndex          = 32
    titleLbl.Parent          = modal

    -- Divider
    local divM = Instance.new("Frame")
    divM.Size                = UDim2.new(1, -32, 0, 1)
    divM.Position            = UDim2.new(0, 16, 0, 52)
    divM.BackgroundColor3    = ac
    divM.BackgroundTransparency = 0.65
    divM.ZIndex              = 32
    divM.Parent              = modal

    -- Close button
    local closeM = Instance.new("TextButton")
    closeM.Size              = UDim2.new(0, 26, 0, 26)
    closeM.Position          = UDim2.new(1, -10, 0, -10)
    closeM.AnchorPoint       = Vector2.new(0.5, 0.5)
    closeM.BackgroundColor3  = Color3.fromRGB(180, 40, 55)
    closeM.BackgroundTransparency = 0.3
    closeM.Text              = "✕"
    closeM.TextColor3        = Color3.fromRGB(255, 200, 200)
    closeM.TextSize          = 12
    closeM.Font              = Enum.Font.GothamBold
    closeM.ZIndex            = 38
    closeM.Parent            = modal
    makeCorner(13).Parent = closeM

    local storedH = modalHeight or 300

    local function openModal()
        modal.Size               = UDim2.new(0, 380, 0, 0)
        modal.BackgroundTransparency = 1
        modal.Visible            = true
        tween(modal, {
            Size = UDim2.new(0, 380, 0, storedH),
            BackgroundTransparency = 0.05
        }, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end

    local function closeModal()
        tween(modal, {
            Size = UDim2.new(0, 380, 0, 0),
            BackgroundTransparency = 1
        }, 0.2)
        task.delay(0.22, function() modal.Visible = false end)
    end

    closeM.MouseButton1Click:Connect(closeModal)

    return modal, openModal, closeModal
end

-- ============================================================
-- HELPER: CREATE GAME LIST
-- BUG FIX: game button TextColor3 now uses accentColor-aware coloring.
-- For premium (gold accent) buttons now show gold text instead of blue.
-- ============================================================
local function createGameList(parent, games, startY, accentColor, onSelect)
    local ac = accentColor or CONFIG.COLOR_ACCENT
    -- Decide text color: if accent is gold/warm use prem text, else use standard blue-white
    local isPremium = (ac == CONFIG.COLOR_PREMIUM)
    local textColor = isPremium and CONFIG.COLOR_PREM_TEXT or Color3.fromRGB(180, 220, 255)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size              = UDim2.new(1, -32, 1, -(startY + 14))
    scroll.Position          = UDim2.new(0, 16, 0, startY)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel   = 0
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = ac
    scroll.ZIndex            = 35
    scroll.CanvasSize        = UDim2.new(0, 0, 0, #games * 52)
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.Parent            = parent

    local layout = Instance.new("UIListLayout")
    layout.SortOrder         = Enum.SortOrder.LayoutOrder
    layout.Padding           = UDim.new(0, 8)
    layout.Parent            = scroll

    for i, g in ipairs(games) do
        local btn = Instance.new("TextButton")
        btn.Size             = UDim2.new(1, 0, 0, 44)
        btn.BackgroundColor3 = ac
        btn.BackgroundTransparency = 0.82
        btn.Text             = g.name
        btn.TextColor3       = textColor
        btn.TextSize         = 15
        btn.Font             = Enum.Font.GothamMedium
        btn.TextXAlignment   = Enum.TextXAlignment.Left
        btn.ZIndex           = 36
        btn.LayoutOrder      = i
        btn.Parent           = scroll
        makeCorner(10).Parent = btn
        makeStroke(ac, 1, 0.55).Parent = btn
        makePadding(0, 0, 14, 8).Parent = btn

        btn.MouseEnter:Connect(function()
            tween(btn, { BackgroundTransparency = 0.55 }, 0.12)
        end)
        btn.MouseLeave:Connect(function()
            tween(btn, { BackgroundTransparency = 0.82 }, 0.12)
        end)
        btn.MouseButton1Click:Connect(function()
            onSelect(g)
        end)
    end
end

-- ============================================================
-- FOLDER 2 – FREE GAME MODAL (blue/red)
-- ============================================================
local FreeModal, openFreeModal, closeFreeModal = createModal(
    "🆓 Select Game  —  Free",
    340,
    CONFIG.COLOR_ACCENT,
    CONFIG.COLOR_TEXT
)

createGameList(FreeModal, CONFIG.GAMES_FREE, 64, CONFIG.COLOR_ACCENT, function(g)
    closeFreeModal()
    showToast("🆓 Loading " .. g.name .. "...", CONFIG.COLOR_FREE)
    task.delay(0.8, function()
        local ok, err = pcall(function()
            local src = game:HttpGet(REPO_RAW .. "MainScript/Script/MenuFree/MenuFreeLoader.lua")
            local fn, compErr = loadstring(src)
            if not fn then error(tostring(compErr)) end
            fn()
        end)
        if not ok then
            showToast("❌ Load error: " .. tostring(err):sub(1,40), Color3.fromRGB(200,50,50))
        end
    end)
end)

-- ============================================================
-- FOLDER 1 (Key Input) – KEY MODAL
-- ============================================================
local KeyModal, openKeyModal, closeKeyModal = createModal(
    "🔑 Enter Premium Key",
    210,
    CONFIG.COLOR_PREMIUM,
    CONFIG.COLOR_PREM_TEXT
)

local KeyInput = Instance.new("TextBox")
KeyInput.Size                = UDim2.new(1, -32, 0, 42)
KeyInput.Position            = UDim2.new(0, 16, 0, 64)
KeyInput.BackgroundColor3    = Color3.fromRGB(60, 45, 5)
KeyInput.BackgroundTransparency = 0.5
KeyInput.PlaceholderText     = "Enter your key... (OCEAN-xxxx)"
KeyInput.PlaceholderColor3   = Color3.fromRGB(160, 130, 60)
KeyInput.Text                = ""
KeyInput.TextColor3          = CONFIG.COLOR_PREM_TEXT
KeyInput.TextSize            = 14
KeyInput.Font                = Enum.Font.GothamMedium
KeyInput.ClearTextOnFocus    = false
KeyInput.ZIndex              = 36
KeyInput.Parent              = KeyModal
makeCorner(10).Parent = KeyInput
makeStroke(CONFIG.COLOR_PREMIUM, 1, 0.4).Parent = KeyInput
makePadding(0, 0, 12, 10).Parent = KeyInput

local KeyError = Instance.new("TextLabel")
KeyError.Size                = UDim2.new(1, -32, 0, 18)
KeyError.Position            = UDim2.new(0, 16, 0, 112)
KeyError.BackgroundTransparency = 1
KeyError.Text                = "Invalid or expired key!"
KeyError.TextColor3          = Color3.fromRGB(255, 110, 110)
KeyError.TextSize            = 13
KeyError.Font                = Enum.Font.Gotham
KeyError.TextXAlignment      = Enum.TextXAlignment.Left
KeyError.Visible             = false
KeyError.ZIndex              = 36
KeyError.Parent              = KeyModal

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size               = UDim2.new(1, -32, 0, 42)
VerifyBtn.Position           = UDim2.new(0, 16, 0, 150)
VerifyBtn.BackgroundColor3   = Color3.fromRGB(130, 95, 5)
VerifyBtn.BackgroundTransparency = 0.25
VerifyBtn.Text               = "Verify Key"
VerifyBtn.TextColor3         = CONFIG.COLOR_PREM_TEXT
VerifyBtn.TextSize           = 15
VerifyBtn.Font               = Enum.Font.GothamBold
VerifyBtn.ZIndex             = 36
VerifyBtn.Parent             = KeyModal
makeCorner(10).Parent = VerifyBtn
makeStroke(CONFIG.COLOR_PREMIUM, 1.5, 0.3).Parent = VerifyBtn

VerifyBtn.MouseEnter:Connect(function()
    tween(VerifyBtn, { BackgroundTransparency = 0.1 }, 0.12)
end)
VerifyBtn.MouseLeave:Connect(function()
    tween(VerifyBtn, { BackgroundTransparency = 0.25 }, 0.12)
end)

-- ============================================================
-- FOLDER 3 – PREMIUM GAME MODAL (yellow/gold)
-- ============================================================
local PremiumModal, openPremiumModal, closePremiumModal = createModal(
    "👑 Select Game  —  Premium",
    420,
    CONFIG.COLOR_PREMIUM,
    CONFIG.COLOR_PREM_TEXT
)

createGameList(PremiumModal, CONFIG.GAMES_PREMIUM, 64, CONFIG.COLOR_PREMIUM, function(g)
    closePremiumModal()
    showToast("👑 Loading " .. g.name .. "...", CONFIG.COLOR_PREMIUM)
    task.delay(0.8, function()
        local ok, err = pcall(function()
            local src = game:HttpGet(REPO_RAW .. "MainScript/Script/MenuPremium/MenuPremiumLoader.lua")
            local fn, compErr = loadstring(src)
            if not fn then error(tostring(compErr)) end
            fn()
        end)
        if not ok then
            showToast("❌ Load error: " .. tostring(err):sub(1,40), Color3.fromRGB(200,50,50))
        end
    end)
end)

-- ============================================================
-- KEY VERIFICATION LOGIC
-- ============================================================
VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text:match("^%s*(.-)%s*$")
    KeyError.Visible = false

    if key == "" then
        KeyError.Text    = "Key cannot be empty!"
        KeyError.Visible = true
        return
    end

    VerifyBtn.Text   = "Verifying..."
    VerifyBtn.Active = false

    task.spawn(function()
        local valid = verifyKeySupabase(key)
        VerifyBtn.Text   = "Verify Key"
        VerifyBtn.Active = true

        if valid then
            closeKeyModal()
            task.delay(0.3, openPremiumModal)
            showToast("✅ Key valid! Welcome to Premium!", CONFIG.COLOR_PREMIUM)
        else
            KeyError.Text    = "Invalid or expired key!"
            KeyError.Visible = true
        end
    end)
end)

-- ============================================================
-- BUTTON EVENTS (main card)
-- ============================================================
BtnFree.MouseEnter:Connect(function()
    tween(BtnFree, { BackgroundTransparency = 0.2 }, 0.12)
end)
BtnFree.MouseLeave:Connect(function()
    tween(BtnFree, { BackgroundTransparency = 0.4 }, 0.12)
end)
BtnFree.MouseButton1Click:Connect(openFreeModal)

BtnPremium.MouseEnter:Connect(function()
    tween(BtnPremium, { BackgroundTransparency = 0.18 }, 0.12)
end)
BtnPremium.MouseLeave:Connect(function()
    tween(BtnPremium, { BackgroundTransparency = 0.35 }, 0.12)
end)
BtnPremium.MouseButton1Click:Connect(openKeyModal)

-- ============================================================
-- ENTRY ANIMATION
-- BUG FIX: Card is already parented above at correct size with
-- BackgroundTransparency=1. We tween it in cleanly from there.
-- No more Size=0→tween-back that caused a flash/jump on Back easing.
-- ============================================================
Overlay.BackgroundTransparency = 1
tween(Overlay, { BackgroundTransparency = 0.3 }, 0.3)
task.delay(0.1, function()
    tween(Card, {
        BackgroundTransparency = 0.08
    }, 0.38, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
end)

-- ============================================================
-- DRAGGABLE CARD
-- ============================================================
local dragging, dragInput, dragStart, startPos

Card.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging  = true
        dragStart = input.Position
        startPos  = Card.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Card.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Card.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

print("[OceanHub] Loader initialized successfully!")
