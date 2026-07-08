--[[
  OceanHub — LoaderUI/Main.lua
  Interactive loader: game selector + Free/Premium + drag + [X]
]]

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer      = Players.LocalPlayer
local PlayerGui        = LocalPlayer:WaitForChild("PlayerGui")

local R = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
local CFG = {
    ICON      = "rbxassetid://84718341622420",
    HUB_NAME  = "OceanHub",
    VERSION   = "v1.0",
    CARD      = Color3.fromRGB(10, 25, 50),
    ACCENT    = Color3.fromRGB(0, 160, 230),
    FREE_COL  = Color3.fromRGB(160, 30, 45),
    PREM_COL  = Color3.fromRGB(200, 160, 20),
    PREM_BG   = Color3.fromRGB(110, 80, 5),
    PREM_TEXT = Color3.fromRGB(255, 230, 120),
    TEXT      = Color3.fromRGB(200, 230, 255),
    MUTED     = Color3.fromRGB(100, 150, 200),
    GAMES_FREE = {
        { name = "🍋 Sell Lemons", folder = "Sell%20Lemons" },
        { name = "⚙️ Default",     folder = "Default" },
    },
    GAMES_PREM = {
        { name = "🍋 Sell Lemons", folder = "Sell%20Lemons" },
        { name = "⚙️ Default",     folder = "Default" },
    },
}

-- ── HELPERS ───────────────────────────────────────────────────
local function mkCorner(r, p)
    local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, r or 8); c.Parent = p
end
local function mkStroke(col, th, tr, p)
    local s = Instance.new("UIStroke"); s.Color = col; s.Thickness = th or 1.5; s.Transparency = tr or 0.4; s.Parent = p
end
local function mkPad(t, b, l, r, p)
    local x = Instance.new("UIPadding")
    x.PaddingTop = UDim.new(0,t); x.PaddingBottom = UDim.new(0,b)
    x.PaddingLeft = UDim.new(0,l); x.PaddingRight = UDim.new(0,r)
    x.Parent = p
end
local function tw(obj, props, dur, style, dir)
    TweenService:Create(obj, TweenInfo.new(
        dur or 0.25, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out
    ), props):Play()
end
local function mkLabel(parent, text, sz, col, font, align, z)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Text         = text
    l.TextColor3   = col or CFG.TEXT
    l.TextSize     = sz or 14
    l.Font         = font or Enum.Font.Gotham
    l.TextXAlignment = align or Enum.TextXAlignment.Left
    l.ZIndex       = z or 5
    l.Parent       = parent
    return l
end
local function mkBtn(parent, z)
    local b = Instance.new("TextButton")
    b.BackgroundTransparency = 1
    b.Text = ""; b.ZIndex = z or 5; b.Parent = parent
    return b
end

-- ── CLEANUP ───────────────────────────────────────────────────
for _, n in ipairs({"OceanHubLoader","OceanHubLoaderUI"}) do
    local o = PlayerGui:FindFirstChild(n); if o then o:Destroy() end
end

-- ── SCREEN GUI ────────────────────────────────────────────────
-- ZIndexBehavior.Global: ZIndex values are absolute, no Sibling stacking surprises
local Gui = Instance.new("ScreenGui")
Gui.Name           = "OceanHubLoaderUI"
Gui.ResetOnSpawn   = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
Gui.IgnoreGuiInset = true
Gui.Parent         = PlayerGui

-- dim overlay (behind everything, Active=false so it never eats clicks)
local Overlay = Instance.new("Frame")
Overlay.Size                   = UDim2.fromScale(1,1)
Overlay.BackgroundColor3       = Color3.fromRGB(3,10,20)
Overlay.BackgroundTransparency = 1
Overlay.ZIndex                 = 10
Overlay.Active                 = false
Overlay.Parent                 = Gui

-- ── CARD ──────────────────────────────────────────────────────
local Card = Instance.new("Frame")
Card.Name                   = "Card"
Card.Size                   = UDim2.new(0, 420, 0, 340)
Card.Position               = UDim2.fromScale(0.5, 0.5)
Card.AnchorPoint            = Vector2.new(0.5, 0.5)
Card.BackgroundColor3       = CFG.CARD
Card.BackgroundTransparency = 1    -- tweened in on entry
Card.ZIndex                 = 20
Card.Active                 = true
Card.Parent                 = Gui
mkCorner(20, Card)
mkStroke(CFG.ACCENT, 1.5, 0.35, Card)

-- ── [X] CLOSE BTN ─────────────────────────────────────────────
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
CloseBtn.ZIndex              = 50
CloseBtn.Parent              = Card
mkCorner(14, CloseBtn)

-- ── ICON ──────────────────────────────────────────────────────
local Ico = Instance.new("ImageLabel")
Ico.Size                    = UDim2.new(0,52,0,52)
Ico.Position                = UDim2.new(0,16,0,18)
Ico.BackgroundColor3        = Color3.fromRGB(15,70,160)
Ico.Image                   = CFG.ICON
Ico.ScaleType               = Enum.ScaleType.Fit
Ico.ZIndex                  = 25
Ico.Parent                  = Card
mkCorner(12, Ico); mkStroke(CFG.ACCENT,1.5,0.4,Ico)

-- fallback emoji if image doesn't load
local IcoTxt = mkLabel(Ico, "🌊", 28, CFG.TEXT, Enum.Font.GothamBold, Enum.TextXAlignment.Center, 26)
IcoTxt.Size = UDim2.fromScale(1,1)
IcoTxt.AnchorPoint = Vector2.new(0,0)
IcoTxt.Position = UDim2.new(0,0,0,0)

-- ── TITLE / SUBTITLE ──────────────────────────────────────────
local HubTitle = mkLabel(Card, CFG.HUB_NAME, 26, CFG.TEXT, Enum.Font.GothamBold, Enum.TextXAlignment.Left, 25)
HubTitle.Size     = UDim2.new(1,-90,0,30)
HubTitle.Position = UDim2.new(0,80,0,22)

local HubSub = mkLabel(Card, "LOADER "..CFG.VERSION, 13, CFG.MUTED, Enum.Font.GothamMedium, Enum.TextXAlignment.Left, 25)
HubSub.Size     = UDim2.new(1,-90,0,18)
HubSub.Position = UDim2.new(0,80,0,54)

-- ── DIVIDER ───────────────────────────────────────────────────
local Div = Instance.new("Frame")
Div.Size                 = UDim2.new(1,-32,0,1)
Div.Position             = UDim2.new(0,16,0,90)
Div.BackgroundColor3     = CFG.ACCENT
Div.BackgroundTransparency = 0.65
Div.ZIndex               = 22
Div.Parent               = Card

-- ── "Choose access type" ──────────────────────────────────────
local ChooseLbl = mkLabel(Card, "Choose your access type", 14, CFG.MUTED, Enum.Font.Gotham, Enum.TextXAlignment.Left, 22)
ChooseLbl.Size     = UDim2.new(1,-32,0,22)
ChooseLbl.Position = UDim2.new(0,16,0,102)

-- ── FREE / PREMIUM BUTTONS ────────────────────────────────────
local function makeAccessBtn(posX, bgCol, accentCol, titleTxt, descTxt, textCol)
    local btn = Instance.new("TextButton")
    btn.Size                   = UDim2.new(0,177,0,110)
    btn.Position               = UDim2.new(0,posX,0,132)
    btn.BackgroundColor3       = bgCol
    btn.BackgroundTransparency = 0.4
    btn.Text                   = ""
    btn.ZIndex                 = 23
    btn.Active                 = true
    btn.Parent                 = Card
    mkCorner(14, btn); mkStroke(accentCol, 1.5, 0.35, btn)

    local tl = mkLabel(btn, titleTxt, 24, textCol, Enum.Font.GothamBold, Enum.TextXAlignment.Center, 24)
    tl.Size = UDim2.new(1,0,0,28); tl.Position = UDim2.new(0,0,0,32)

    local dl = mkLabel(btn, descTxt, 14, textCol, Enum.Font.Gotham, Enum.TextXAlignment.Center, 24)
    dl.Size = UDim2.new(1,-8,0,18); dl.Position = UDim2.new(0,4,0,66)
    dl.TextTransparency = 0.3

    btn.MouseEnter:Connect(function() tw(btn,{BackgroundTransparency=0.2},0.12) end)
    btn.MouseLeave:Connect(function() tw(btn,{BackgroundTransparency=0.4},0.12) end)
    return btn
end

local BtnFree = makeAccessBtn(16,
    Color3.fromRGB(100,20,30), CFG.FREE_COL,
    "🆓 Free", "Free scripts",
    Color3.fromRGB(255,200,205))

local BtnPremium = makeAccessBtn(207,
    CFG.PREM_BG, CFG.PREM_COL,
    "👑 Premium", "Key required",
    CFG.PREM_TEXT)

-- ── FOOTER ────────────────────────────────────────────────────
local Footer = mkLabel(Card, "OceanUltimate  •  github.com/OceanUltimate/OceanHub", 10,
    Color3.fromRGB(40,65,100), Enum.Font.Gotham, Enum.TextXAlignment.Center, 21)
Footer.Size     = UDim2.new(1,0,0,16)
Footer.Position = UDim2.new(0,0,1,-20)

-- ── TOAST ─────────────────────────────────────────────────────
local function showToast(msg, color)
    local t = Instance.new("Frame")
    t.Size = UDim2.new(0,310,0,44); t.Position = UDim2.new(0.5,0,1,70)
    t.AnchorPoint = Vector2.new(0.5,1)
    t.BackgroundColor3 = color or CFG.ACCENT
    t.BackgroundTransparency = 0.2; t.ZIndex = 80; t.Parent = Gui
    mkCorner(12,t); mkStroke(color or CFG.ACCENT,1,0.25,t)
    local l = mkLabel(t, msg, 15, Color3.fromRGB(230,248,255), Enum.Font.GothamMedium, Enum.TextXAlignment.Center, 81)
    l.Size = UDim2.fromScale(1,1); l.Position = UDim2.new(0,0,0,0)
    tw(t, {Position=UDim2.new(0.5,0,1,-20)}, 0.3)
    task.delay(2.5, function()
        tw(t, {Position=UDim2.new(0.5,0,1,70)}, 0.3)
        task.delay(0.35, function() if t and t.Parent then t:Destroy() end end)
    end)
end

-- ── DESTROY SELF & LOAD SCRIPT ────────────────────────────────
local function loadScript(path, toastMsg, toastCol)
    showToast(toastMsg, toastCol)
    task.delay(0.4, function()
        if Gui and Gui.Parent then Gui:Destroy() end
        local old = PlayerGui:FindFirstChild("OceanHubLoader")
        if old then old:Destroy() end
        local ok, err = pcall(function()
            local src = game:HttpGet(R .. path)
            assert(src and src ~= "", "Empty response from GitHub")
            local fn, ce = loadstring(src)
            assert(fn, tostring(ce))
            fn()
        end)
        if not ok then warn("[OceanHub] Load error: "..tostring(err)) end
    end)
end

-- ── MODAL FACTORY ─────────────────────────────────────────────
-- Returns: modal frame, openFn, closeFn
-- Modal ZIndex range: 100-130 (above card at 20-50)
local function makeModal(titleTxt, modalH, accentCol, titleCol)
    local ac = accentCol or CFG.ACCENT
    local modal = Instance.new("Frame")
    modal.Name               = "Modal"
    modal.Size               = UDim2.new(0,380,0,modalH)
    modal.Position           = UDim2.fromScale(0.5,0.5)
    modal.AnchorPoint        = Vector2.new(0.5,0.5)
    modal.BackgroundColor3   = Color3.fromRGB(5,14,28)
    modal.BackgroundTransparency = 0.05
    modal.ZIndex             = 100
    modal.Visible            = false
    modal.Active             = true
    modal.Parent             = Gui
    mkCorner(16, modal); mkStroke(ac, 1.5, 0.3, modal)

    local titleLbl = mkLabel(modal, titleTxt, 17, titleCol or CFG.TEXT, Enum.Font.GothamBold, Enum.TextXAlignment.Left, 102)
    titleLbl.Size = UDim2.new(1,-50,0,36); titleLbl.Position = UDim2.new(0,16,0,14)

    local divM = Instance.new("Frame")
    divM.Size = UDim2.new(1,-32,0,1); divM.Position = UDim2.new(0,16,0,52)
    divM.BackgroundColor3 = ac; divM.BackgroundTransparency = 0.65
    divM.ZIndex = 102; divM.Parent = modal

    local closeM = Instance.new("TextButton")
    closeM.Size = UDim2.new(0,26,0,26); closeM.Position = UDim2.new(1,-10,0,-10)
    closeM.AnchorPoint = Vector2.new(0.5,0.5)
    closeM.BackgroundColor3 = CFG.FREE_COL; closeM.BackgroundTransparency = 0.3
    closeM.Text = "✕"; closeM.TextColor3 = Color3.fromRGB(255,200,200)
    closeM.TextSize = 14; closeM.Font = Enum.Font.GothamBold
    closeM.ZIndex = 120; closeM.Parent = modal
    mkCorner(13, closeM)

    local function openModal()
        modal.Size = UDim2.new(0,380,0,0)
        modal.BackgroundTransparency = 1
        modal.Visible = true
        tw(modal, {Size=UDim2.new(0,380,0,modalH), BackgroundTransparency=0.05},
            0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    end
    local function closeModal()
        tw(modal, {Size=UDim2.new(0,380,0,0), BackgroundTransparency=1}, 0.2)
        task.delay(0.22, function() if modal and modal.Parent then modal.Visible = false end end)
    end

    closeM.MouseButton1Click:Connect(closeModal)
    return modal, openModal, closeModal
end

-- ── GAME LIST ─────────────────────────────────────────────────
local function buildGameList(parent, games, startY, accentCol, onSelect)
    local ac = accentCol or CFG.ACCENT
    local textCol = (ac == CFG.PREM_COL) and CFG.PREM_TEXT or Color3.fromRGB(180,220,255)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1,-32,1,-(startY+14))
    scroll.Position = UDim2.new(0,16,0,startY)
    scroll.BackgroundTransparency = 1; scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 3; scroll.ScrollBarImageColor3 = ac
    scroll.ZIndex = 105
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scroll.CanvasSize = UDim2.new(0,0,0,0)
    scroll.Parent = parent

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0,8)
    layout.Parent = scroll

    for i, g in ipairs(games) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1,0,0,44)
        btn.BackgroundColor3 = ac; btn.BackgroundTransparency = 0.6
        btn.Text = g.name; btn.TextColor3 = textCol
        btn.TextSize = 16; btn.Font = Enum.Font.GothamMedium
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.ZIndex = 110; btn.LayoutOrder = i; btn.Parent = scroll
        mkCorner(10, btn); mkStroke(ac,1,0.55,btn); mkPad(0,0,14,8,btn)

        btn.MouseEnter:Connect(function() tw(btn,{BackgroundTransparency=0.4},0.1) end)
        btn.MouseLeave:Connect(function() tw(btn,{BackgroundTransparency=0.6},0.1) end)
        btn.MouseButton1Click:Connect(function() onSelect(g) end)
    end
end

-- ── FREE MODAL ────────────────────────────────────────────────
local freeH = math.max(180, 64 + #CFG.GAMES_FREE*52 + 14)
local FreeModal, openFreeModal = makeModal("🆓 Select Game", freeH, CFG.ACCENT, CFG.TEXT)

buildGameList(FreeModal, CFG.GAMES_FREE, 64, CFG.ACCENT, function(g)
    loadScript(
        "MainScript/Script/MenuFree/FreeScript/"..g.folder.."/Main.lua",
        "🆓 Loading "..g.name.."...",
        CFG.FREE_COL
    )
end)

BtnFree.MouseButton1Click:Connect(openFreeModal)

-- ── PREMIUM MODAL + KEY INPUT ─────────────────────────────────
local KeyModal, openKeyModal, closeKeyModal = makeModal("🔑 Premium Key", 210, CFG.PREM_COL, CFG.PREM_TEXT)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1,-32,0,42); KeyInput.Position = UDim2.new(0,16,0,64)
KeyInput.BackgroundColor3 = Color3.fromRGB(60,45,5); KeyInput.BackgroundTransparency = 0.5
KeyInput.PlaceholderText = "Enter your key... (OCEAN-xxxx)"
KeyInput.PlaceholderColor3 = Color3.fromRGB(160,130,60)
KeyInput.Text = ""; KeyInput.TextColor3 = CFG.PREM_TEXT
KeyInput.TextSize = 14; KeyInput.Font = Enum.Font.GothamMedium
KeyInput.ClearTextOnFocus = false; KeyInput.ZIndex = 115; KeyInput.Parent = KeyModal
mkCorner(10, KeyInput); mkStroke(CFG.PREM_COL,1,0.4,KeyInput); mkPad(0,0,12,10,KeyInput)

pcall(function()
    if isfile and isfile("OceanHub_Key.txt") then KeyInput.Text = readfile("OceanHub_Key.txt") end
end)

local KeyError = mkLabel(KeyModal, "Invalid or expired key!", 13, Color3.fromRGB(255,110,110),
    Enum.Font.Gotham, Enum.TextXAlignment.Left, 115)
KeyError.Size = UDim2.new(1,-32,0,18); KeyError.Position = UDim2.new(0,16,0,112)
KeyError.Visible = false

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(1,-32,0,42); VerifyBtn.Position = UDim2.new(0,16,0,150)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(130,95,5); VerifyBtn.BackgroundTransparency = 0.25
VerifyBtn.Text = "Verify Key"; VerifyBtn.TextColor3 = CFG.PREM_TEXT
VerifyBtn.TextSize = 15; VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.ZIndex = 115; VerifyBtn.Parent = KeyModal
mkCorner(10, VerifyBtn); mkStroke(CFG.PREM_COL,1.5,0.3,VerifyBtn)

VerifyBtn.MouseEnter:Connect(function() tw(VerifyBtn,{BackgroundTransparency=0.1},0.12) end)
VerifyBtn.MouseLeave:Connect(function() tw(VerifyBtn,{BackgroundTransparency=0.25},0.12) end)

BtnPremium.MouseButton1Click:Connect(openKeyModal)

VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text:match("^%s*(.-)%s*$")
    KeyError.Visible = false
    if key == "" then
        KeyError.Text = "Key cannot be empty!"; KeyError.Visible = true; return
    end
    VerifyBtn.Text = "Verifying..."; VerifyBtn.Active = false
    task.spawn(function()
        local valid, msg = false, "Connection failed"
        pcall(function()
            local Supabase = loadstring(game:HttpGet(R.."MainScript/Component/Supabase/Main.lua"))()
            Supabase.Configure(
                "https://diepaphbtpepwzqdaujq.supabase.co",
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRpZXBhcGhidHBlcHd6cWRhdWpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI5OTk5MjIsImV4cCI6MjA5ODU3NTkyMn0.RBiaEWZD5D0H50X5YFJd7F-GaYXBG4nPcHqaLr-1KCI"
            )
            valid, msg = Supabase.VerifyKey(key, LocalPlayer.Name)
        end)
        VerifyBtn.Text = "Verify Key"; VerifyBtn.Active = true
        if valid then
            pcall(function() if writefile then writefile("OceanHub_Key.txt", key) end end)
            closeKeyModal()
            showToast("✅ "..(msg or "Welcome to Premium!"), CFG.PREM_COL)
            task.delay(0.5, function()
                if Gui and Gui.Parent then Gui:Destroy() end
                local o = PlayerGui:FindFirstChild("OceanHubLoader"); if o then o:Destroy() end
                local ok,e = pcall(function()
                    local src = game:HttpGet(R.."MainScript/Script/MenuPremium/MenuPremiumLoader.lua")
                    local fn,ce = loadstring(src); assert(fn, tostring(ce)); fn()
                end)
                if not ok then warn("[OceanHub] Premium load error: "..tostring(e)) end
            end)
        else
            KeyError.Text = msg or "Invalid or expired key!"; KeyError.Visible = true
        end
    end)
end)

-- ── CLOSE CARD ────────────────────────────────────────────────
CloseBtn.MouseButton1Click:Connect(function()
    tw(Card, {BackgroundTransparency=1}, 0.3)
    tw(Overlay, {BackgroundTransparency=1}, 0.3)
    task.delay(0.35, function() if Gui and Gui.Parent then Gui:Destroy() end end)
end)

-- ── DRAG ──────────────────────────────────────────────────────
local dragging, dragInput, dragStart, startPos
Card.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = inp.Position; startPos = Card.Position
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
Card.InputChanged:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseMovement then dragInput = inp end
end)
UserInputService.InputChanged:Connect(function(inp)
    if inp == dragInput and dragging then
        local d = inp.Position - dragStart
        Card.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+d.X, startPos.Y.Scale, startPos.Y.Offset+d.Y)
    end
end)

-- ── ENTRY ANIMATION ───────────────────────────────────────────
tw(Overlay, {BackgroundTransparency=0.3}, 0.3)
task.delay(0.1, function()
    tw(Card, {BackgroundTransparency=0.08}, 0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
end)

print("[OceanHub] LoaderUI ready.")
