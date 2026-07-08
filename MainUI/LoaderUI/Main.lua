--[[
  OceanHub — LoaderUI/Main.lua
  Interactive loader: game selector + Free / Premium buttons.
  Draggable, has [X]. On selection: destroys self, loads target script.
]]

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui   = LocalPlayer:WaitForChild("PlayerGui")

-- ── CONFIG ────────────────────────────────────────────────────
local R   = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local CFG = {
    ICON        = "rbxassetid://84718341622420",
    HUB_NAME    = "OceanHub",
    VERSION     = "v1.0",
    BG          = Color3.fromRGB(7, 18, 32),
    CARD        = Color3.fromRGB(10, 25, 50),
    ACCENT      = Color3.fromRGB(0, 160, 230),
    FREE_COL    = Color3.fromRGB(160, 30, 45),
    PREM_COL    = Color3.fromRGB(200, 160, 20),
    PREM_BG     = Color3.fromRGB(110, 80, 5),
    PREM_TEXT   = Color3.fromRGB(255, 230, 120),
    TEXT        = Color3.fromRGB(200, 230, 255),
    MUTED       = Color3.fromRGB(100, 150, 200),
    GAMES_FREE  = {
        { name = "🍋 Sell Lemons",  folder = "Sell%20Lemons" },
        { name = "⚙️ Default",      folder = "Default"       },
    },
    GAMES_PREM  = {
        { name = "🍋 Sell Lemons",  folder = "Sell%20Lemons" },
        { name = "⚙️ Default",      folder = "Default"       },
    },
}

-- ── UTILITIES ─────────────────────────────────────────────────
local function corner(r, p) local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r or 8); c.Parent=p; return c end
local function stroke(col, th, tr, p) local s=Instance.new("UIStroke"); s.Color=col; s.Thickness=th or 1.5; s.Transparency=tr or 0.4; s.Parent=p; return s end
local function pad(t,b,l,r,p) local x=Instance.new("UIPadding"); x.PaddingTop=UDim.new(0,t); x.PaddingBottom=UDim.new(0,b); x.PaddingLeft=UDim.new(0,l); x.PaddingRight=UDim.new(0,r); x.Parent=p; return x end

local function tw(obj, props, dur, style, dir)
    TweenService:Create(obj, TweenInfo.new(dur or 0.25, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out), props):Play()
end

-- ── CLEANUP OLD ───────────────────────────────────────────────
for _, n in ipairs({"OceanHubLoader","OceanHubLoaderUI"}) do
    local old = PlayerGui:FindFirstChild(n)
    if old then old:Destroy() end
end

-- ── ROOT GUI ──────────────────────────────────────────────────
local Gui = Instance.new("ScreenGui")
Gui.Name           = "OceanHubLoaderUI"
Gui.ResetOnSpawn   = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.IgnoreGuiInset = true
Gui.Parent         = PlayerGui

local Overlay = Instance.new("Frame")
Overlay.Size                  = UDim2.fromScale(1,1)
Overlay.BackgroundColor3      = Color3.fromRGB(3,10,20)
Overlay.BackgroundTransparency = 1  -- animated in
Overlay.ZIndex                = 1
Overlay.Active                = false  -- don't block clicks from passing through
Overlay.Parent                = Gui

-- ── MAIN CARD ─────────────────────────────────────────────────
local Card = Instance.new("Frame")
Card.Name                   = "Card"
Card.Size                   = UDim2.new(0, 420, 0, 340)
Card.Position               = UDim2.fromScale(0.5, 0.5)
Card.AnchorPoint            = Vector2.new(0.5, 0.5)
Card.BackgroundColor3       = CFG.CARD
Card.BackgroundTransparency = 1  -- animated in
Card.ZIndex                 = 2
Card.Active                 = true
Card.Parent                 = Gui
corner(20, Card)
stroke(CFG.ACCENT, 1.5, 0.35, Card)

-- [X] close
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size                = UDim2.new(0,28,0,28)
CloseBtn.Position            = UDim2.new(1,-10,0,-10)
CloseBtn.AnchorPoint         = Vector2.new(0.5,0.5)
CloseBtn.BackgroundColor3    = CFG.FREE_COL
CloseBtn.BackgroundTransparency = 0.3
CloseBtn.Text                = "✕"
CloseBtn.TextColor3          = Color3.fromRGB(255,200,200)
CloseBtn.TextSize            = 14
CloseBtn.Font                = Enum.Font.GothamBold
CloseBtn.ZIndex              = 10
CloseBtn.Parent              = Card
corner(14, CloseBtn)

-- Header
local Header = Instance.new("Frame")
Header.Size                  = UDim2.new(1,-32,0,60)
Header.Position              = UDim2.new(0,16,0,18)
Header.BackgroundTransparency = 1
Header.ZIndex                = 4
Header.Parent                = Card

local Ico = Instance.new("ImageLabel")
Ico.Size                     = UDim2.new(0,52,0,52)
Ico.Position                 = UDim2.new(0,0,0.5,0)
Ico.AnchorPoint              = Vector2.new(0,0.5)
Ico.BackgroundColor3         = Color3.fromRGB(15,70,160)
Ico.Image                    = CFG.ICON
Ico.ScaleType                = Enum.ScaleType.Fit
Ico.ZIndex                   = 5
Ico.Parent                   = Header
corner(12, Ico); stroke(CFG.ACCENT,1.5,0.4,Ico)

local IcoFallback = Instance.new("TextLabel")
IcoFallback.Size             = UDim2.fromScale(1,1)
IcoFallback.BackgroundTransparency = 1
IcoFallback.Text             = "🌊"
IcoFallback.TextSize         = 28
IcoFallback.Font             = Enum.Font.GothamBold
IcoFallback.ZIndex           = 6
IcoFallback.Parent           = Ico

local TitleBlock = Instance.new("Frame")
TitleBlock.Size              = UDim2.new(1,-68,1,0)
TitleBlock.Position          = UDim2.new(0,64,0,0)
TitleBlock.BackgroundTransparency = 1
TitleBlock.ZIndex            = 5
TitleBlock.Parent            = Header

local function makeLabel(parent, text, size, color, font, align, zidx)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Text                   = text
    l.TextColor3             = color or CFG.TEXT
    l.TextSize               = size or 14
    l.Font                   = font or Enum.Font.Gotham
    l.TextXAlignment         = align or Enum.TextXAlignment.Left
    l.ZIndex                 = zidx or 6
    l.Parent                 = parent
    return l
end

local HubTitle = makeLabel(TitleBlock, CFG.HUB_NAME, 26, CFG.TEXT, Enum.Font.GothamBold)
HubTitle.Size     = UDim2.new(1,0,0,30)
HubTitle.Position = UDim2.new(0,0,0,6)

local HubSub = makeLabel(TitleBlock, "LOADER "..CFG.VERSION, 13, CFG.MUTED, Enum.Font.GothamMedium)
HubSub.Size     = UDim2.new(1,0,0,18)
HubSub.Position = UDim2.new(0,0,0,38)

-- Divider
local Div = Instance.new("Frame")
Div.Size                 = UDim2.new(1,-32,0,1)
Div.Position             = UDim2.new(0,16,0,92)
Div.BackgroundColor3     = CFG.ACCENT
Div.BackgroundTransparency = 0.65
Div.ZIndex               = 4
Div.Parent               = Card

-- "Choose your access type" label
local ChooseLbl = makeLabel(Card, "Choose your access type", 15, CFG.MUTED, Enum.Font.Gotham, Enum.TextXAlignment.Left, 4)
ChooseLbl.Size     = UDim2.new(1,-32,0,22)
ChooseLbl.Position = UDim2.new(0,16,0,104)

-- ── FREE / PREMIUM BUTTONS ─────────────────────────────────────
local BtnRow = Instance.new("Frame")
BtnRow.Size                  = UDim2.new(1,-32,0,110)
BtnRow.Position              = UDim2.new(0,16,0,136)
BtnRow.BackgroundTransparency = 1
BtnRow.ZIndex                = 4
BtnRow.Parent                = Card

local rowLayout = Instance.new("UIListLayout")
rowLayout.FillDirection      = Enum.FillDirection.Horizontal
rowLayout.SortOrder          = Enum.SortOrder.LayoutOrder
rowLayout.Padding            = UDim.new(0,14)
rowLayout.Parent             = BtnRow

local function makeAccessBtn(parent, order, bgCol, accentCol, labelText, descText, textCol)
    local btn = Instance.new("TextButton")
    btn.Size                   = UDim2.new(0.5,-7,1,0)
    btn.BackgroundColor3       = bgCol
    btn.BackgroundTransparency = 0.4
    btn.Text                   = ""
    btn.ZIndex                 = 5
    btn.LayoutOrder            = order
    btn.Parent                 = parent
    corner(14, btn); stroke(accentCol, 1.5, 0.35, btn)

    local tl = makeLabel(btn, labelText, 24, textCol, Enum.Font.GothamBold, Enum.TextXAlignment.Center, 6)
    tl.Size     = UDim2.new(1,0,0,26)
    tl.Position = UDim2.new(0,0,0.5,-22)

    local dl = makeLabel(btn, descText, 15, textCol, Enum.Font.Gotham, Enum.TextXAlignment.Center, 6)
    dl.Size              = UDim2.new(1,-16,0,18)
    dl.Position          = UDim2.new(0,8,0.5,8)
    dl.TextTransparency  = 0.25

    btn.MouseEnter:Connect(function() tw(btn,{BackgroundTransparency=0.2},0.12) end)
    btn.MouseLeave:Connect(function() tw(btn,{BackgroundTransparency=0.4},0.12) end)
    return btn
end

local BtnFree    = makeAccessBtn(BtnRow, 1,
    Color3.fromRGB(160,30,45), CFG.FREE_COL,
    "🆓 Free", "Free game access",
    Color3.fromRGB(255,200,205))

local BtnPremium = makeAccessBtn(BtnRow, 2,
    CFG.PREM_BG, CFG.PREM_COL,
    "👑 Premium", "Full access with key",
    CFG.PREM_TEXT)

-- Footer
local Footer = makeLabel(Card, "OceanUltimate  •  github.com/OceanUltimate/OceanHub", 10, Color3.fromRGB(40,65,100), Enum.Font.Gotham, Enum.TextXAlignment.Center, 3)
Footer.Size     = UDim2.new(1,0,0,16)
Footer.Position = UDim2.new(0,0,1,-20)

-- ── TOAST ─────────────────────────────────────────────────────
local function showToast(msg, color)
    local t = Instance.new("Frame")
    t.Size               = UDim2.new(0,310,0,44)
    t.Position           = UDim2.new(0.5,0,1,70)
    t.AnchorPoint        = Vector2.new(0.5,1)
    t.BackgroundColor3   = color or CFG.ACCENT
    t.BackgroundTransparency = 0.2
    t.ZIndex             = 80
    t.Parent             = Gui
    corner(12,t); stroke(color or CFG.ACCENT,1,0.25,t)

    local l = Instance.new("TextLabel")
    l.Size               = UDim2.fromScale(1,1)
    l.BackgroundTransparency = 1
    l.Text               = msg
    l.TextColor3         = Color3.fromRGB(230,248,255)
    l.TextSize           = 15
    l.Font               = Enum.Font.GothamMedium
    l.ZIndex             = 81
    l.Parent             = t

    tw(t, {Position=UDim2.new(0.5,0,1,-20)}, 0.3)
    task.delay(2.5, function()
        tw(t, {Position=UDim2.new(0.5,0,1,70)}, 0.3)
        task.delay(0.35, function() if t and t.Parent then t:Destroy() end end)
    end)
end

-- ── MODAL FACTORY ─────────────────────────────────────────────
local function createModal(titleText, modalH, accentCol, titleCol)
    local ac = accentCol or CFG.ACCENT
    local tc = titleCol  or CFG.TEXT

    local modal = Instance.new("Frame")
    modal.Name               = "Modal"
    modal.Size               = UDim2.new(0,380,0,modalH or 300)
    modal.Position           = UDim2.fromScale(0.5,0.5)
    modal.AnchorPoint        = Vector2.new(0.5,0.5)
    modal.BackgroundColor3   = Color3.fromRGB(5,14,28)
    modal.BackgroundTransparency = 0.05
    modal.ZIndex             = 30
    modal.Visible            = false
    modal.Active             = true
    modal.Parent             = Gui
    corner(16,modal); stroke(ac,1.5,0.3,modal)

    local titleLbl = makeLabel(modal, titleText, 17, tc, Enum.Font.GothamBold, Enum.TextXAlignment.Left, 32)
    titleLbl.Size     = UDim2.new(1,-50,0,36)
    titleLbl.Position = UDim2.new(0,16,0,14)

    local divM = Instance.new("Frame")
    divM.Size                = UDim2.new(1,-32,0,1)
    divM.Position            = UDim2.new(0,16,0,52)
    divM.BackgroundColor3    = ac
    divM.BackgroundTransparency = 0.65
    divM.ZIndex              = 32
    divM.Parent              = modal

    local closeM = Instance.new("TextButton")
    closeM.Size              = UDim2.new(0,26,0,26)
    closeM.Position          = UDim2.new(1,-10,0,-10)
    closeM.AnchorPoint       = Vector2.new(0.5,0.5)
    closeM.BackgroundColor3  = CFG.FREE_COL
    closeM.BackgroundTransparency = 0.3
    closeM.Text              = "✕"
    closeM.TextColor3        = Color3.fromRGB(255,200,200)
    closeM.TextSize          = 14
    closeM.Font              = Enum.Font.GothamBold
    closeM.ZIndex            = 38
    closeM.Parent            = modal
    corner(13,closeM)

    local storedH = modalH or 300

    local function openModal()
        modal.Size               = UDim2.new(0,380,0,0)
        modal.BackgroundTransparency = 1
        modal.Visible            = true
        tw(modal, {Size=UDim2.new(0,380,0,storedH), BackgroundTransparency=0.05}, 0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end

    local function closeModal()
        tw(modal, {Size=UDim2.new(0,380,0,0), BackgroundTransparency=1}, 0.2)
        task.delay(0.22, function() if modal and modal.Parent then modal.Visible = false end end)
    end

    closeM.MouseButton1Click:Connect(closeModal)
    return modal, openModal, closeModal
end

-- ── GAME LIST BUILDER ─────────────────────────────────────────
local function buildGameList(parent, games, startY, accentCol, onSelect)
    local ac = accentCol or CFG.ACCENT
    local isPrem = (ac == CFG.PREM_COL)
    local textCol = isPrem and CFG.PREM_TEXT or Color3.fromRGB(180,220,255)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size              = UDim2.new(1,-32,1,-(startY+14))
    scroll.Position          = UDim2.new(0,16,0,startY)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel   = 0
    scroll.ScrollBarThickness = 3
    scroll.ScrollBarImageColor3 = ac
    scroll.ZIndex            = 35
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.CanvasSize        = UDim2.new(0,0,0,0)
    scroll.Parent            = parent

    local layout = Instance.new("UIListLayout")
    layout.SortOrder         = Enum.SortOrder.LayoutOrder
    layout.Padding           = UDim.new(0,8)
    layout.Parent            = scroll

    for i, g in ipairs(games) do
        local btn = Instance.new("TextButton")
        btn.Size             = UDim2.new(1,0,0,44)
        btn.BackgroundColor3 = ac
        btn.BackgroundTransparency = 0.6
        btn.Text             = g.name
        btn.TextColor3       = textCol
        btn.TextSize         = 16
        btn.Font             = Enum.Font.GothamMedium
        btn.TextXAlignment   = Enum.TextXAlignment.Left
        btn.ZIndex           = 36
        btn.LayoutOrder      = i
        btn.Parent           = scroll
        corner(10,btn); stroke(ac,1,0.55,btn); pad(0,0,14,8,btn)

        btn.MouseEnter:Connect(function() tw(btn,{BackgroundTransparency=0.4},0.1) end)
        btn.MouseLeave:Connect(function() tw(btn,{BackgroundTransparency=0.6},0.1) end)
        btn.MouseButton1Click:Connect(function() onSelect(g) end)
    end
end

-- ── DESTROY LOADER & LOAD SCRIPT ──────────────────────────────
local function loadScript(path, toastMsg, toastCol)
    showToast(toastMsg, toastCol)
    task.delay(0.5, function()
        -- Destroy loader UI
        if Gui and Gui.Parent then Gui:Destroy() end
        -- Also remove legacy OceanHubLoader if present
        local old = PlayerGui:FindFirstChild("OceanHubLoader")
        if old then old:Destroy() end

        local ok, err = pcall(function()
            local src = game:HttpGet(R .. path)
            if not src or src == "" then error("Empty response") end
            local fn, ce = loadstring(src)
            if not fn then error(tostring(ce)) end
            fn()
        end)
        if not ok then
            warn("[OceanHub Loader] Failed: " .. tostring(err))
        end
    end)
end

-- ── FREE FLOW ─────────────────────────────────────────────────
local freeModal, openFreeModal = createModal("🆓 Select Game", math.max(180, 64 + #CFG.GAMES_FREE * 52 + 14), CFG.ACCENT, CFG.TEXT)

buildGameList(freeModal, CFG.GAMES_FREE, 64, CFG.ACCENT, function(g)
    loadScript(
        "MainScript/Script/MenuFree/FreeScript/" .. g.folder .. "/Main.lua",
        "🆓 Loading " .. g.name .. "...",
        CFG.FREE_COL
    )
end)

BtnFree.MouseButton1Click:Connect(openFreeModal)

-- ── PREMIUM FLOW ──────────────────────────────────────────────
local function openPremiumMenu()
    showToast("👑 Loading Premium Menu...", CFG.PREM_COL)
    task.delay(0.5, function()
        if Gui and Gui.Parent then Gui:Destroy() end
        local old = PlayerGui:FindFirstChild("OceanHubLoader")
        if old then old:Destroy() end

        local ok, err = pcall(function()
            local src = game:HttpGet(R .. "MainScript/Script/MenuPremium/MenuPremiumLoader.lua")
            if not src or src == "" then error("Empty response") end
            local fn, ce = loadstring(src)
            if not fn then error(tostring(ce)) end
            fn()
        end)
        if not ok then warn("[OceanHub Loader] Premium load failed: " .. tostring(err)) end
    end)
end

-- Key modal
local KeyModal, openKeyModal, closeKeyModal = createModal("🔑 Enter Premium Key", 210, CFG.PREM_COL, CFG.PREM_TEXT)

local KeyInput = Instance.new("TextBox")
KeyInput.Size                = UDim2.new(1,-32,0,42)
KeyInput.Position            = UDim2.new(0,16,0,64)
KeyInput.BackgroundColor3    = Color3.fromRGB(60,45,5)
KeyInput.BackgroundTransparency = 0.5
KeyInput.PlaceholderText     = "Enter your key... (OCEAN-xxxx)"
KeyInput.PlaceholderColor3   = Color3.fromRGB(160,130,60)
KeyInput.Text                = ""
KeyInput.TextColor3          = CFG.PREM_TEXT
KeyInput.TextSize            = 14
KeyInput.Font                = Enum.Font.GothamMedium
KeyInput.ClearTextOnFocus    = false
KeyInput.ZIndex              = 36
KeyInput.Parent              = KeyModal
corner(10,KeyInput); stroke(CFG.PREM_COL,1,0.4,KeyInput); pad(0,0,12,10,KeyInput)

-- Load saved key
pcall(function()
    if isfile and isfile("OceanHub_Key.txt") then
        KeyInput.Text = readfile("OceanHub_Key.txt")
    end
end)

local KeyError = makeLabel(KeyModal, "Invalid or expired key!", 13, Color3.fromRGB(255,110,110), Enum.Font.Gotham, Enum.TextXAlignment.Left, 36)
KeyError.Size    = UDim2.new(1,-32,0,18)
KeyError.Position = UDim2.new(0,16,0,112)
KeyError.Visible = false

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size               = UDim2.new(1,-32,0,42)
VerifyBtn.Position           = UDim2.new(0,16,0,150)
VerifyBtn.BackgroundColor3   = Color3.fromRGB(130,95,5)
VerifyBtn.BackgroundTransparency = 0.25
VerifyBtn.Text               = "Verify Key"
VerifyBtn.TextColor3         = CFG.PREM_TEXT
VerifyBtn.TextSize           = 15
VerifyBtn.Font               = Enum.Font.GothamBold
VerifyBtn.ZIndex             = 36
VerifyBtn.Parent             = KeyModal
corner(10,VerifyBtn); stroke(CFG.PREM_COL,1.5,0.3,VerifyBtn)

VerifyBtn.MouseEnter:Connect(function() tw(VerifyBtn,{BackgroundTransparency=0.1},0.12) end)
VerifyBtn.MouseLeave:Connect(function() tw(VerifyBtn,{BackgroundTransparency=0.25},0.12) end)

BtnPremium.MouseButton1Click:Connect(openKeyModal)

-- Verify via Supabase (loads Supabase component on demand)
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
        local valid, msg = false, "Verification failed"
        local ok = pcall(function()
            local Supabase = loadstring(game:HttpGet(R.."MainScript/Component/Supabase/Main.lua"))()
            Supabase.Configure(
                "https://diepaphbtpepwzqdaujq.supabase.co",
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRpZXBhcGhidHBlcHd6cWRhdWpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI5OTk5MjIsImV4cCI6MjA5ODU3NTkyMn0.RBiaEWZD5D0H50X5YFJd7F-GaYXBG4nPcHqaLr-1KCI"
            )
            valid, msg = Supabase.VerifyKey(key, LocalPlayer.Name)
        end)
        if not ok then msg = "Supabase connection failed" end

        VerifyBtn.Text   = "Verify Key"
        VerifyBtn.Active = true

        if valid then
            pcall(function() if writefile then writefile("OceanHub_Key.txt", key) end end)
            closeKeyModal()
            task.delay(0.3, openPremiumMenu)
            showToast("✅ " .. (msg or "Welcome to Premium!"), CFG.PREM_COL)
        else
            KeyError.Text    = msg or "Invalid or expired key!"
            KeyError.Visible = true
        end
    end)
end)

-- ── CLOSE ─────────────────────────────────────────────────────
CloseBtn.MouseButton1Click:Connect(function()
    tw(Card,    {BackgroundTransparency=1}, 0.3)
    tw(Overlay, {BackgroundTransparency=1}, 0.3)
    task.delay(0.35, function() if Gui and Gui.Parent then Gui:Destroy() end end)
end)

-- ── DRAG ──────────────────────────────────────────────────────
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
        local d = input.Position - dragStart
        Card.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + d.X,
            startPos.Y.Scale, startPos.Y.Offset + d.Y
        )
    end
end)

-- ── ENTRY ANIMATION ───────────────────────────────────────────
tw(Overlay, {BackgroundTransparency=0.3}, 0.3)
task.delay(0.1, function()
    tw(Card, {BackgroundTransparency=0.08}, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
end)

print("[OceanHub] LoaderUI initialized.")
