--[[
================================================================
   ██████╗  ██████╗███████╗ █████╗ ███╗   ██╗██╗   ██╗██╗
  ██╔═══██╗██╔════╝██╔════╝██╔══██╗████╗  ██║██║   ██║██║
  ██║   ██║██║     █████╗  ███████║██╔██╗ ██║██║   ██║██║
  ██║   ██║██║     ██╔══╝  ██╔══██║██║╚██╗██║██║   ██║██║
  ╚██████╔╝╚██████╗███████╗██║  ██║██║ ╚████║╚██████╔╝██║
   ╚═════╝  ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝
  
  OceanHub UI Library — OceanUI.lua
  Version  : 1.0.0
  Author   : OceanUltimate
  GitHub   : github.com/OceanUltimate/OceanHub
  
  All components in one file. No external dependencies.
  Pure Roblox Lua — compatible with loadstring execution.
  
  Components:
    Window      CreateWindow()
    Tab         CreateTab()
    Frame       CreateFrame()
    Button      CreateButton()
    Execute     CreateExecuteButton()
    Toggle      CreateToggle()
    Slider      CreateSlider()
    Dropdown    CreateDropdown()
    Input       CreateInput()
    TextArea    CreateTextArea()
    Keybind     CreateKeybind()
    ColorPicker CreateColorPicker()
    ProgressBar CreateProgressBar()
    Separator   CreateSeparator()
    Label       CreateLabel()
    Badge       CreateBadge()
    Avatar      CreateAvatar()
    SearchBox   CreateSearchBox()
    Notification Window:Notify()
    ContextMenu Window:ContextMenu()
================================================================
]]

-- ============================================================
-- -------SERVICES-------
-- ============================================================
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local HttpService      = game:GetService("HttpService")
local CoreGui          = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Mouse       = LocalPlayer:GetMouse()

-- ============================================================
-- -------INTERNAL STATE-------
-- ============================================================
local OceanUI        = {}
OceanUI.__index      = OceanUI
local _windows       = {}
local _notifStack    = {}
local _notifBaseY    = -12
local _connections   = {}
local _initialized   = false

-- ============================================================
-- -------THEME-------
-- ============================================================
local Theme = {
    -- Backgrounds
    BG           = Color3.fromRGB(7,   18,  32),
    BG2          = Color3.fromRGB(5,   13,  24),
    CARD         = Color3.fromRGB(10,  25,  50),
    CARD2        = Color3.fromRGB(13,  30,  58),
    CARD3        = Color3.fromRGB(16,  36,  68),
    CARD4        = Color3.fromRGB(20,  42,  78),
    SIDEBAR      = Color3.fromRGB(8,   20,  42),
    SIDEBAR2     = Color3.fromRGB(6,   16,  34),
    TOPBAR       = Color3.fromRGB(9,   22,  44),
    -- Accent
    ACCENT       = Color3.fromRGB(0,   160, 230),
    ACCENT2      = Color3.fromRGB(0,   130, 190),
    ACCENT3      = Color3.fromRGB(0,   100, 150),
    ACCENT_DARK  = Color3.fromRGB(0,   60,  110),
    ACCENT_GLOW  = Color3.fromRGB(0,   180, 255),
    -- Text
    TEXT         = Color3.fromRGB(200, 230, 255),
    TEXT2        = Color3.fromRGB(160, 200, 240),
    TEXT_MUTED   = Color3.fromRGB(90,  130, 180),
    TEXT_DIM     = Color3.fromRGB(45,  80,  130),
    TEXT_HINT    = Color3.fromRGB(30,  55,  95),
    -- Status
    SUCCESS      = Color3.fromRGB(40,  200, 95),
    SUCCESS_BG   = Color3.fromRGB(8,   45,  25),
    WARNING      = Color3.fromRGB(220, 165, 15),
    WARNING_BG   = Color3.fromRGB(40,  30,  5),
    DANGER       = Color3.fromRGB(210, 50,  60),
    DANGER_BG    = Color3.fromRGB(45,  10,  15),
    INFO         = Color3.fromRGB(80,  160, 255),
    INFO_BG      = Color3.fromRGB(10,  30,  65),
    -- Special
    EXECUTE      = Color3.fromRGB(155, 60,  225),
    EXECUTE_BG   = Color3.fromRGB(30,  10,  55),
    GOLD         = Color3.fromRGB(200, 160, 20),
    GOLD_BG      = Color3.fromRGB(40,  28,  5),
    PURPLE       = Color3.fromRGB(140, 80,  220),
    PINK         = Color3.fromRGB(220, 80,  150),
    TEAL         = Color3.fromRGB(20,  200, 160),
    -- Dividers
    DIVIDER      = Color3.fromRGB(0,   160, 230),
    DIVIDER2     = Color3.fromRGB(20,  50,  90),
    -- Corners / glow
    CORNER       = Color3.fromRGB(0,   160, 230),
    SHADOW       = Color3.fromRGB(0,   0,   0),
}

-- ============================================================
-- -------CONSTANTS-------
-- ============================================================
local K = {
    GLOW_IMAGE   = "rbxassetid://5028857084",
    ICON         = "rbxassetid://84718341622420",
    FONT_BOLD    = Enum.Font.GothamBold,
    FONT_MED     = Enum.Font.GothamMedium,
    FONT_REG     = Enum.Font.Gotham,
    FONT_MONO    = Enum.Font.Code,
    EASE_OUT     = Enum.EasingStyle.Quad,
    EASE_BACK    = Enum.EasingStyle.Back,
    EASE_BOUNCE  = Enum.EasingStyle.Bounce,
    DIR_OUT      = Enum.EasingDirection.Out,
    DIR_IN       = Enum.EasingDirection.In,
    DIR_INOUT    = Enum.EasingDirection.InOut,
    Z_BASE       = 10,
    Z_MODAL      = 30,
    Z_NOTIF      = 100,
    Z_CONTEXT    = 90,
    Z_TOOLTIP    = 80,
}

-- ============================================================
-- -------UTILITY LIBRARY-------
-- ============================================================
local U = {}

-- Core tween helper
function U.tween(obj, props, dur, style, dir)
    if not obj or not obj.Parent then return end
    local tw = TweenService:Create(obj,
        TweenInfo.new(
            dur   or 0.25,
            style or K.EASE_OUT,
            dir   or K.DIR_OUT
        ),
        props
    )
    tw:Play()
    return tw
end

-- Instance factory with property table
function U.new(class, props, parent)
    local inst = Instance.new(class)
    if props then
        for k, v in pairs(props) do
            inst[k] = v
        end
    end
    if parent then inst.Parent = parent end
    return inst
end

-- UICorner
function U.corner(r, parent)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or 8)
    if parent then c.Parent = parent end
    return c
end

-- UIStroke
function U.stroke(color, thickness, transparency, parent)
    local s = Instance.new("UIStroke")
    s.Color        = color        or Theme.ACCENT
    s.Thickness    = thickness    or 1.5
    s.Transparency = transparency or 0.4
    if parent then s.Parent = parent end
    return s
end

-- UIPadding
function U.pad(t, b, l, r, parent)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, t or 8)
    p.PaddingBottom = UDim.new(0, b or 8)
    p.PaddingLeft   = UDim.new(0, l or 8)
    p.PaddingRight  = UDim.new(0, r or 8)
    if parent then p.Parent = parent end
    return p
end

-- UIListLayout
function U.list(dir, gap, sort, parent)
    local l = Instance.new("UIListLayout")
    l.FillDirection = dir  or Enum.FillDirection.Vertical
    l.SortOrder     = sort or Enum.SortOrder.LayoutOrder
    l.Padding       = UDim.new(0, gap or 6)
    if parent then l.Parent = parent end
    return l
end

-- UIGridLayout
function U.grid(cellSize, gap, parent)
    local g = Instance.new("UIGridLayout")
    g.CellSize      = cellSize or UDim2.new(0.5,-4,0,34)
    g.CellPadding   = gap      or UDim2.new(0,6,0,6)
    g.SortOrder     = Enum.SortOrder.LayoutOrder
    if parent then g.Parent = parent end
    return g
end

-- TextLabel factory
function U.label(parent, text, size, color, font, align, zindex, props)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Text           = text   or ""
    l.TextColor3     = color  or Theme.TEXT
    l.TextSize       = size   or 13
    l.Font           = font   or K.FONT_MED
    l.TextXAlignment = align  or Enum.TextXAlignment.Left
    l.ZIndex         = zindex or 20
    l.RichText       = true
    if props then
        for k, v in pairs(props) do l[k] = v end
    end
    l.Parent = parent
    return l
end

-- Shadow image
function U.shadow(parent, zindex, size, offset)
    local s = Instance.new("ImageLabel")
    s.Size                   = size   or UDim2.new(1,28,1,28)
    s.Position               = offset or UDim2.new(0,-14,0,-14)
    s.BackgroundTransparency = 1
    s.Image                  = K.GLOW_IMAGE
    s.ImageColor3            = K.SHADOW
    s.ImageTransparency      = 0.65
    s.ZIndex                 = (zindex or K.Z_BASE) - 1
    s.Active                 = false  -- jangan intercept input
    s.Parent                 = parent
    return s
end

-- Corner glow lights
function U.glow(parent, color, zindex, size)
    local sz = size or 130
    local corners = {
        { pos = UDim2.new(0,-sz*.15,0,-sz*.15), anchor = Vector2.new(0,0) },
        { pos = UDim2.new(1,sz*.15, 0,-sz*.15), anchor = Vector2.new(1,0) },
        { pos = UDim2.new(0,-sz*.15,1,sz*.15),  anchor = Vector2.new(0,1) },
        { pos = UDim2.new(1,sz*.15, 1,sz*.15),  anchor = Vector2.new(1,1) },
    }
    local lights = {}
    for _, cp in ipairs(corners) do
        local l = Instance.new("ImageLabel")
        l.Size               = UDim2.new(0,sz,0,sz)
        l.Position           = cp.pos
        l.AnchorPoint        = cp.anchor
        l.BackgroundTransparency = 1
        l.Image              = K.GLOW_IMAGE
        l.ImageColor3        = color or Theme.CORNER
        l.ImageTransparency  = 0.62
        l.ZIndex             = (zindex or K.Z_BASE) - 1
        l.Active             = false  -- jangan intercept input
        l.Parent             = parent
        table.insert(lights, l)
    end
    return lights
end

-- Ripple effect
function U.ripple(parent, color, zindex)
    local rip = Instance.new("Frame")
    rip.Size                   = UDim2.new(0,0,0,0)
    rip.Position               = UDim2.fromScale(0.5,0.5)
    rip.AnchorPoint            = Vector2.new(0.5,0.5)
    rip.BackgroundColor3       = color or Theme.ACCENT
    rip.BackgroundTransparency = 0.72
    rip.ZIndex                 = (zindex or 20) + 1
    rip.Parent                 = parent
    U.corner(999, rip)
    U.tween(rip, { Size = UDim2.new(2.5,0,2.5,0), BackgroundTransparency = 1 }, 0.55)
    task.delay(0.58, function() if rip then rip:Destroy() end end)
end

-- Shine sweep effect
function U.shine(parent, zindex)
    local shine = Instance.new("Frame")
    shine.Size                   = UDim2.new(0,30,1.4,0)
    shine.Position               = UDim2.new(0,-40,-.2,0)
    shine.BackgroundColor3       = Color3.fromRGB(255,255,255)
    shine.BackgroundTransparency = 0.82
    shine.Rotation               = 20
    shine.ZIndex                 = (zindex or 20) + 1
    shine.ClipsDescendants       = false
    shine.Parent                 = parent
    U.tween(shine, { Position = UDim2.new(1,40,-.2,0) }, 0.45)
    task.delay(0.5, function() if shine then shine:Destroy() end end)
end

-- Make a scrolling frame
function U.scroll(parent, size, pos, zindex)
    local s = Instance.new("ScrollingFrame")
    s.Size                    = size   or UDim2.fromScale(1,1)
    s.Position                = pos    or UDim2.new(0,0,0,0)
    s.BackgroundTransparency  = 1
    s.BorderSizePixel         = 0
    s.ScrollBarThickness      = 3
    s.ScrollBarImageColor3    = Theme.ACCENT
    s.ScrollBarImageTransparency = 0.45
    s.ZIndex                  = zindex or 12
    s.AutomaticCanvasSize     = Enum.AutomaticSize.Y
    s.CanvasSize              = UDim2.new(0,0,0,0)
    s.Parent                  = parent
    return s
end

-- Safe pcall wrapper
function U.safe(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then
        warn("[OceanUI] Error: " .. tostring(err))
    end
    return ok, err
end

-- Clamp number
function U.clamp(v, min, max)
    return math.max(min, math.min(max, v))
end

-- Round number
function U.round(v, dec)
    local mult = 10 ^ (dec or 0)
    return math.floor(v * mult + 0.5) / mult
end

-- HSV to Color3
function U.hsv(h, s, v)
    return Color3.fromHSV(h, s, v)
end

-- Lerp Color3
function U.lerpColor(a, b, t)
    return a:Lerp(b, t)
end

-- Format number with commas
function U.fmtNum(n)
    local s = tostring(math.floor(n))
    local result = ""
    local count = 0
    for i = #s, 1, -1 do
        if count > 0 and count % 3 == 0 then result = "," .. result end
        result = s:sub(i,i) .. result
        count = count + 1
    end
    return result
end

-- ============================================================
-- -------NOTIFICATION SYSTEM-------
-- ============================================================
local function _repositionNotifs(screenGui)
    local y = _notifBaseY
    for i = #_notifStack, 1, -1 do
        local n = _notifStack[i]
        if n and n.Parent == screenGui then
            U.tween(n, { Position = UDim2.new(1,-10,1,y) }, 0.22)
            y = y - (n.AbsoluteSize.Y + 6)
        elseif not (n and n.Parent) then
            table.remove(_notifStack, i)
        end
    end
end

local function Notify(screenGui, config)
    config = config or {}
    local title    = config.Title    or "OceanHub"
    local msg      = config.Message  or ""
    local ntype    = config.Type     or "info"
    local duration = config.Duration or 4
    local icon     = config.Icon     or nil

    local colorMap = {
        info    = { border = Theme.ACCENT,   bar = Theme.ACCENT,   bg = Theme.INFO_BG    },
        success = { border = Theme.SUCCESS,  bar = Theme.SUCCESS,  bg = Theme.SUCCESS_BG },
        warning = { border = Theme.WARNING,  bar = Theme.WARNING,  bg = Theme.WARNING_BG },
        danger  = { border = Theme.DANGER,   bar = Theme.DANGER,   bg = Theme.DANGER_BG  },
        execute = { border = Theme.EXECUTE,  bar = Theme.EXECUTE,  bg = Theme.EXECUTE_BG },
        gold    = { border = Theme.GOLD,     bar = Theme.GOLD,     bg = Theme.GOLD_BG    },
    }
    local iconMap = {
        info    = "ℹ",
        success = "✓",
        warning = "⚠",
        danger  = "✕",
        execute = "▶",
        gold    = "★",
    }
    local scheme = colorMap[ntype] or colorMap.info
    local ic     = icon or iconMap[ntype] or "ℹ"

    -- Frame
    local notif = Instance.new("Frame")
    notif.Name                   = "OceanNotif"
    notif.Size                   = UDim2.new(0,290,0,68)
    notif.Position               = UDim2.new(1,310,1,_notifBaseY)
    notif.AnchorPoint            = Vector2.new(1,1)
    notif.BackgroundColor3       = scheme.bg
    notif.BackgroundTransparency = 0.06
    notif.ZIndex                 = K.Z_NOTIF
    notif.Parent                 = screenGui
    U.corner(11, notif)
    U.stroke(scheme.border, 1.5, 0.28, notif)
    U.shadow(notif, K.Z_NOTIF, UDim2.new(1,20,1,20), UDim2.new(0,-10,0,-10))

    -- Left accent bar
    local bar = U.new("Frame", {
        Size             = UDim2.new(0,4,1,-18),
        Position         = UDim2.new(0,9,0,9),
        BackgroundColor3 = scheme.bar,
        ZIndex           = K.Z_NOTIF + 1,
    }, notif)
    U.corner(3, bar)

    -- Icon circle
    local iconCircle = U.new("Frame", {
        Size             = UDim2.new(0,30,0,30),
        Position         = UDim2.new(0,20,0.5,0),
        AnchorPoint      = Vector2.new(0,0.5),
        BackgroundColor3 = scheme.bar,
        BackgroundTransparency = 0.72,
        ZIndex           = K.Z_NOTIF + 1,
    }, notif)
    U.corner(15, iconCircle)

    local iconLbl = U.label(iconCircle, ic, 14, scheme.bar, K.FONT_BOLD, Enum.TextXAlignment.Center, K.Z_NOTIF+2)
    iconLbl.Size     = UDim2.fromScale(1,1)
    iconLbl.Position = UDim2.new(0,0,0,0)

    -- Title
    local titleLbl = U.label(notif, title, 13, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, K.Z_NOTIF+1)
    titleLbl.Size     = UDim2.new(1,-62,0,20)
    titleLbl.Position = UDim2.new(0,58,0,10)

    -- Message
    local msgLbl = U.label(notif, msg, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, K.Z_NOTIF+1)
    msgLbl.Size        = UDim2.new(1,-62,0,30)
    msgLbl.Position    = UDim2.new(0,58,0,30)
    msgLbl.TextWrapped = true

    -- Progress bar
    local progBg = U.new("Frame", {
        Size             = UDim2.new(1,0,0,3),
        Position         = UDim2.new(0,0,1,-3),
        BackgroundColor3 = Theme.CARD3,
        ZIndex           = K.Z_NOTIF + 1,
    }, notif)
    U.corner(2, progBg)

    local prog = U.new("Frame", {
        Size             = UDim2.new(1,0,1,0),
        BackgroundColor3 = scheme.bar,
        BackgroundTransparency = 0.25,
        ZIndex           = K.Z_NOTIF + 2,
    }, progBg)
    U.corner(2, prog)

    table.insert(_notifStack, notif)
    _repositionNotifs(screenGui)

    -- Slide in
    U.tween(notif, { Position = UDim2.new(1,-10,1,_notifBaseY) }, 0.3, K.EASE_BACK)

    -- Progress shrink
    U.tween(prog, { Size = UDim2.new(0,0,1,0) }, duration, Enum.EasingStyle.Linear)

    -- Auto dismiss
    task.delay(duration, function()
        U.tween(notif, { Position = UDim2.new(1,310,1,notif.Position.Y.Offset) }, 0.28)
        task.delay(0.32, function()
            local idx = table.find(_notifStack, notif)
            if idx then table.remove(_notifStack, idx) end
            notif:Destroy()
            _repositionNotifs(screenGui)
        end)
    end)

    return notif
end

-- ============================================================
-- -------TOOLTIP SYSTEM-------
-- ============================================================
local function attachTooltip(trigger, text, screenGui)
    if not text or text == "" then return end
    local tip = nil

    trigger.MouseEnter:Connect(function()
        if tip then tip:Destroy() end
        tip = U.new("Frame", {
            Size             = UDim2.new(0,0,0,26),
            BackgroundColor3 = Theme.CARD3,
            BackgroundTransparency = 0.1,
            ZIndex           = K.Z_TOOLTIP,
            AutomaticSize    = Enum.AutomaticSize.X,
        }, screenGui)
        U.corner(6, tip)
        U.stroke(Theme.ACCENT, 1, 0.55, tip)
        U.pad(0,0,8,8, tip)

        local lbl = U.label(tip, text, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Center, K.Z_TOOLTIP+1)
        lbl.Size = UDim2.new(0,0,1,0)
        lbl.AutomaticSize = Enum.AutomaticSize.X

        local conn
        conn = RunService.RenderStepped:Connect(function()
            if not tip or not tip.Parent then conn:Disconnect() return end
            local mp = UserInputService:GetMouseLocation()
            tip.Position = UDim2.new(0, mp.X + 12, 0, mp.Y - 30)
        end)
    end)

    trigger.MouseLeave:Connect(function()
        if tip then tip:Destroy() tip = nil end
    end)
end

-- ============================================================
-- -------CONTEXT MENU-------
-- ============================================================
local function ContextMenu(screenGui, config)
    config = config or {}
    local items    = config.Items    or {}
    local position = config.Position or UDim2.fromScale(0.5,0.5)

    -- Close existing
    local old = screenGui:FindFirstChild("OceanContextMenu")
    if old then old:Destroy() end

    local menu = U.new("Frame", {
        Name             = "OceanContextMenu",
        Size             = UDim2.new(0,160,0,0),
        Position         = position,
        BackgroundColor3 = Theme.CARD2,
        BackgroundTransparency = 0.05,
        ZIndex           = K.Z_CONTEXT,
        ClipsDescendants = true,
    }, screenGui)
    U.corner(10, menu)
    U.stroke(Theme.ACCENT, 1, 0.45, menu)
    U.shadow(menu, K.Z_CONTEXT)

    local menuLayout = U.list(Enum.FillDirection.Vertical, 0, nil, nil)
    menuLayout.Parent = menu
    U.pad(4,4,0,0, menu)

    local totalH = 8
    for i, item in ipairs(items) do
        local isDiv = item.Separator
        if isDiv then
            local div = U.new("Frame", {
                Name             = "Div",
                Size             = UDim2.new(1,-16,0,1),
                Position         = UDim2.new(0,8,0,0),
                BackgroundColor3 = Theme.DIVIDER2,
                BackgroundTransparency = 0.3,
                LayoutOrder      = i,
                ZIndex           = K.Z_CONTEXT + 1,
            }, menu)
            totalH = totalH + 9
        else
            local color = item.Color or Theme.TEXT
            local ic    = item.Icon  or ""
            local btn   = U.new("TextButton", {
                Name                   = "Item_"..i,
                Size                   = UDim2.new(1,0,0,32),
                BackgroundColor3       = Theme.ACCENT,
                BackgroundTransparency = 1,
                Text                   = "",
                ZIndex                 = K.Z_CONTEXT + 1,
                LayoutOrder            = i,
            }, menu)
            U.corner(7, btn)

            local lbl = U.label(btn, (ic~="" and ic.."  " or "")..item.Name, 12, color, K.FONT_MED, Enum.TextXAlignment.Left, K.Z_CONTEXT+2)
            lbl.Size     = UDim2.new(1,-16,1,0)
            lbl.Position = UDim2.new(0,10,0,0)

            btn.MouseEnter:Connect(function()
                U.tween(btn, { BackgroundTransparency = 0.8 }, 0.1)
            end)
            btn.MouseLeave:Connect(function()
                U.tween(btn, { BackgroundTransparency = 1 }, 0.1)
            end)
            btn.MouseButton1Click:Connect(function()
                menu:Destroy()
                if item.Callback then task.spawn(item.Callback) end
            end)
            totalH = totalH + 32
        end
    end

    -- Animate open
    U.tween(menu, { Size = UDim2.new(0,160,0,totalH) }, 0.2, K.EASE_BACK)

    -- Close on outside click
    local closeConn
    closeConn = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            task.delay(0.05, function()
                if menu and menu.Parent then menu:Destroy() end
                closeConn:Disconnect()
            end)
        end
    end)

    return menu
end

-- ============================================================
-- -------BUTTON-------
-- ============================================================
local function createButton(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Button"
    local desc     = config.Desc     or ""
    local color    = config.Color    or Theme.ACCENT
    local callback = config.Callback or function() end
    local icon     = config.Icon     or ""
    local tooltip  = config.Tooltip  or ""
    local disabled = config.Disabled or false

    local hasDesc = desc ~= ""
    local h = hasDesc and 46 or 34

    local Row = U.new("Frame", {
        Name                   = "Btn_"..name,
        Size                   = UDim2.new(1,0,0,h),
        BackgroundColor3       = color,
        BackgroundTransparency = disabled and 0.88 or 0.82,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Row)
    U.stroke(color, 1, disabled and 0.7 or 0.52, Row)

    local nameCol = disabled and Theme.TEXT_DIM or Theme.TEXT
    local nameLbl = U.label(Row, (icon~="" and icon.."  " or "")..name, 13, nameCol, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-12,0,22)
    nameLbl.Position = UDim2.new(0,12,0, hasDesc and 6 or 6)

    if hasDesc then
        local descLbl = U.label(Row, desc, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
        descLbl.Size     = UDim2.new(1,-12,0,14)
        descLbl.Position = UDim2.new(0,12,0,24)
    end

    local hitbox = U.new("TextButton", {
        Size                   = UDim2.fromScale(1,1),
        BackgroundTransparency = 1,
        Text                   = "",
        ZIndex                 = 22,
        Active                 = not disabled,
    }, Row)

    if not disabled then
        hitbox.MouseEnter:Connect(function()
            U.tween(Row, { BackgroundTransparency = 0.55 }, 0.12)
        end)
        hitbox.MouseLeave:Connect(function()
            U.tween(Row, { BackgroundTransparency = 0.82 }, 0.12)
        end)
        hitbox.MouseButton1Click:Connect(function()
            U.ripple(Row, color, 22)
            U.shine(Row, 22)
            U.tween(Row, { BackgroundTransparency = 0.3  }, 0.07)
            task.delay(0.1, function()
                U.tween(Row, { BackgroundTransparency = 0.82 }, 0.18)
            end)
            task.spawn(callback)
        end)
    end

    local obj = {
        _frame   = Row,
        _label   = nameLbl,
        _hitbox  = hitbox,
    }

    function obj:SetText(t)   nameLbl.Text = t end
    function obj:SetColor(c)
        Row.BackgroundColor3 = c
        U.stroke(c, 1, 0.52, Row)
    end
    function obj:SetDisabled(v)
        disabled = v
        Row.BackgroundTransparency = v and 0.88 or 0.82
        hitbox.Active = not v
        nameLbl.TextColor3 = v and Theme.TEXT_DIM or Theme.TEXT
    end

    return obj
end

-- ============================================================
-- -------EXECUTE BUTTON-------
-- ============================================================
local function createExecuteButton(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Execute"
    local desc     = config.Desc     or "Run script"
    local script   = config.Script   or ""
    local callback = config.Callback or function() end
    local tooltip  = config.Tooltip  or ""

    local Row = U.new("Frame", {
        Name                   = "Exec_"..name,
        Size                   = UDim2.new(1,0,0,52),
        BackgroundColor3       = Theme.EXECUTE,
        BackgroundTransparency = 0.84,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(9, Row)
    U.stroke(Theme.EXECUTE, 1, 0.48, Row)

    -- Execute icon box
    local iconBox = U.new("Frame", {
        Size             = UDim2.new(0,36,0,36),
        Position         = UDim2.new(0,8,0.5,0),
        AnchorPoint      = Vector2.new(0,0.5),
        BackgroundColor3 = Theme.EXECUTE,
        BackgroundTransparency = 0.6,
        ZIndex           = 21,
    }, Row)
    U.corner(9, iconBox)
    U.stroke(Theme.EXECUTE, 1, 0.55, iconBox)

    local iconLbl = U.label(iconBox, "▶", 15, Color3.fromRGB(210,150,255), K.FONT_BOLD, Enum.TextXAlignment.Center, 22)
    iconLbl.Size = UDim2.fromScale(1,1)

    local nameLbl = U.label(Row, name, 13, Color3.fromRGB(210,150,255), K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-58,0,20)
    nameLbl.Position = UDim2.new(0,52,0,8)

    local descLbl = U.label(Row, desc, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
    descLbl.Size     = UDim2.new(1,-58,0,15)
    descLbl.Position = UDim2.new(0,52,0,28)

    local hitbox = U.new("TextButton", {
        Size                   = UDim2.fromScale(1,1),
        BackgroundTransparency = 1,
        Text                   = "",
        ZIndex                 = 23,
    }, Row)

    hitbox.MouseEnter:Connect(function()
        U.tween(Row, { BackgroundTransparency = 0.6 }, 0.12)
    end)
    hitbox.MouseLeave:Connect(function()
        U.tween(Row, { BackgroundTransparency = 0.84 }, 0.12)
    end)
    hitbox.MouseButton1Click:Connect(function()
        U.ripple(Row, Theme.EXECUTE, 23)
        U.tween(iconLbl, { TextColor3 = Color3.fromRGB(255,255,255) }, 0.1)
        task.delay(0.22, function()
            U.tween(iconLbl, { TextColor3 = Color3.fromRGB(210,150,255) }, 0.2)
        end)
        if script ~= "" then
            local ok, err = pcall(function() loadstring(script)() end)
            if not ok then warn("[OceanUI Execute] "..tostring(err)) end
        end
        task.spawn(callback)
    end)

    return { _frame = Row }
end

-- ============================================================
-- -------TOGGLE-------
-- ============================================================
local function createToggle(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Toggle"
    local desc     = config.Desc     or ""
    local default  = config.Default  or false
    local callback = config.Callback or function() end
    local color    = config.Color    or Theme.ACCENT
    local state    = default

    local hasDesc = desc ~= ""
    local h = hasDesc and 46 or 34

    local Row = U.new("Frame", {
        Name                   = "Toggle_"..name,
        Size                   = UDim2.new(1,0,0,h),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Row)

    local nameLbl = U.label(Row, name, 13, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-70,0,22)
    nameLbl.Position = UDim2.new(0,12,0, hasDesc and 6 or 6)

    if hasDesc then
        local descLbl = U.label(Row, desc, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
        descLbl.Size     = UDim2.new(1,-70,0,14)
        descLbl.Position = UDim2.new(0,12,0,24)
    end

    -- Track
    local Track = U.new("TextButton", {
        Size                   = UDim2.new(0,46,0,24),
        Position               = UDim2.new(1,-56,0.5,0),
        AnchorPoint            = Vector2.new(0,0.5),
        BackgroundColor3       = state and color or Theme.TEXT_DIM,
        BackgroundTransparency = 0.18,
        Text                   = "",
        ZIndex                 = 21,
    }, Row)
    U.corner(12, Track)

    -- Knob
    local Knob = U.new("Frame", {
        Size             = UDim2.new(0,18,0,18),
        Position         = state and UDim2.new(1,-22,0.5,0) or UDim2.new(0,4,0.5,0),
        AnchorPoint      = Vector2.new(0,0.5),
        BackgroundColor3 = Color3.fromRGB(255,255,255),
        ZIndex           = 22,
    }, Track)
    U.corner(9, Knob)

    -- Inner glow dot
    local glowDot = U.new("Frame", {
        Size             = UDim2.new(0,8,0,8),
        Position         = UDim2.fromScale(0.5,0.5),
        AnchorPoint      = Vector2.new(0.5,0.5),
        BackgroundColor3 = color,
        BackgroundTransparency = state and 0.2 or 1,
        ZIndex           = 23,
    }, Knob)
    U.corner(4, glowDot)

    local function updateVisual(animate)
        local dur = animate and 0.2 or 0
        if state then
            U.tween(Track,   { BackgroundColor3 = color }, dur)
            U.tween(Knob,    { Position = UDim2.new(1,-22,0.5,0) }, dur, K.EASE_BACK)
            U.tween(glowDot, { BackgroundTransparency = 0.2 }, dur)
        else
            U.tween(Track,   { BackgroundColor3 = Theme.TEXT_DIM }, dur)
            U.tween(Knob,    { Position = UDim2.new(0,4,0.5,0) }, dur, K.EASE_BACK)
            U.tween(glowDot, { BackgroundTransparency = 1 }, dur)
        end
    end

    Track.MouseButton1Click:Connect(function()
        state = not state
        updateVisual(true)
        task.spawn(callback, state)
    end)

    local obj = { _frame = Row, _state = state }

    function obj:Set(v, silent)
        state = v
        self._state = v
        updateVisual(true)
        if not silent then task.spawn(callback, state) end
    end
    function obj:Get() return state end
    function obj:Toggle(silent)
        self:Set(not state, silent)
    end

    return obj
end

-- ============================================================
-- -------SLIDER-------
-- ============================================================
local function createSlider(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Slider"
    local desc     = config.Desc     or ""
    local min      = config.Min      or 0
    local max      = config.Max      or 100
    local default  = config.Default  or min
    local step     = config.Step     or 1
    local suffix   = config.Suffix   or ""
    local color    = config.Color    or Theme.ACCENT
    local callback = config.Callback or function() end
    local value    = U.clamp(default, min, max)

    local hasDesc = desc ~= ""
    local h = hasDesc and 60 or 52

    local Row = U.new("Frame", {
        Name                   = "Slider_"..name,
        Size                   = UDim2.new(1,0,0,h),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Row)

    local nameLbl = U.label(Row, name, 13, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-80,0,18)
    nameLbl.Position = UDim2.new(0,12,0,7)

    local valLbl = U.label(Row, tostring(value)..suffix, 13, color, K.FONT_BOLD, Enum.TextXAlignment.Right, 21)
    valLbl.Size     = UDim2.new(0,70,0,18)
    valLbl.Position = UDim2.new(1,-78,0,7)

    if hasDesc then
        local descLbl = U.label(Row, desc, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
        descLbl.Size     = UDim2.new(1,-12,0,14)
        descLbl.Position = UDim2.new(0,12,0,24)
    end

    local trackY = hasDesc and 44 or 36

    -- Track background
    local TrackBg = U.new("Frame", {
        Size             = UDim2.new(1,-26,0,8),
        Position         = UDim2.new(0,13,0,trackY),
        BackgroundColor3 = Theme.TEXT_DIM,
        BackgroundTransparency = 0.28,
        ZIndex           = 21,
    }, Row)
    U.corner(4, TrackBg)

    local pct = (value - min) / (max - min)

    -- Fill
    local TrackFill = U.new("Frame", {
        Size             = UDim2.new(pct,0,1,0),
        BackgroundColor3 = color,
        ZIndex           = 22,
    }, TrackBg)
    U.corner(4, TrackFill)

    -- Fill end glow
    local fillGlow = U.new("ImageLabel", {
        Size               = UDim2.new(0,20,0,20),
        Position           = UDim2.new(1,-10,0.5,0),
        AnchorPoint        = Vector2.new(0,0.5),
        BackgroundTransparency = 1,
        Image              = K.GLOW_IMAGE,
        ImageColor3        = color,
        ImageTransparency  = 0.5,
        ZIndex             = 23,
    }, TrackFill)

    -- Knob
    local Knob = U.new("TextButton", {
        Size             = UDim2.new(0,20,0,20),
        Position         = UDim2.new(pct,-10,0.5,0),
        AnchorPoint      = Vector2.new(0,0.5),
        BackgroundColor3 = Color3.fromRGB(255,255,255),
        Text             = "",
        ZIndex           = 23,
    }, TrackBg)
    U.corner(10, Knob)
    U.stroke(color, 2, 0.25, Knob)

    local function updateValue(newVal)
        value = U.clamp(U.round(newVal / step) * step, min, max)
        local r = (value - min) / (max - min)
        TrackFill.Size = UDim2.new(r,0,1,0)
        Knob.Position  = UDim2.new(r,-10,0.5,0)
        valLbl.Text    = tostring(value)..suffix
        task.spawn(callback, value)
    end

    local dragging = false
    Knob.MouseButton1Down:Connect(function()
        dragging = true
        U.tween(Knob, { Size = UDim2.new(0,24,0,24) }, 0.1)
    end)

    local conn1 = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
            dragging = false
            U.tween(Knob, { Size = UDim2.new(0,20,0,20) }, 0.1)
        end
    end)
    table.insert(_connections, conn1)

    local conn2 = UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local ap  = TrackBg.AbsolutePosition.X
            local as  = TrackBg.AbsoluteSize.X
            if as <= 0 then return end
            local rel = U.clamp((input.Position.X - ap) / as, 0, 1)
            updateValue(min + rel * (max - min))
        end
    end)
    table.insert(_connections, conn2)

    -- Click on track
    local trackBtn = U.new("TextButton", {
        Size                   = UDim2.fromScale(1,1),
        BackgroundTransparency = 1,
        Text                   = "",
        ZIndex                 = 24,
    }, TrackBg)
    trackBtn.MouseButton1Click:Connect(function()
        local ap  = TrackBg.AbsolutePosition.X
        local as  = TrackBg.AbsoluteSize.X
        if as <= 0 then return end
        local mp  = UserInputService:GetMouseLocation()
        local rel = U.clamp((mp.X - ap) / as, 0, 1)
        updateValue(min + rel * (max - min))
    end)

    local obj = { _frame = Row }
    function obj:Set(v, silent)
        value = U.clamp(v, min, max)
        local r = (value-min)/(max-min)
        TrackFill.Size = UDim2.new(r,0,1,0)
        Knob.Position  = UDim2.new(r,-10,0.5,0)
        valLbl.Text    = tostring(value)..suffix
        if not silent then task.spawn(callback, value) end
    end
    function obj:Get() return value end

    return obj
end

-- ============================================================
-- -------DROPDOWN-------
-- ============================================================
local function createDropdown(config, parent, order)
    config = config or {}
    local name      = config.Name     or "Dropdown"
    local options   = config.Options  or {}
    local default   = config.Default  or (options[1] or "Select...")
    local desc      = config.Desc     or ""
    local multi     = config.Multi    or false
    local callback  = config.Callback or function() end
    local selected  = default
    local multiSel  = {}
    local open      = false
    local searching = false

    local Container = U.new("Frame", {
        Name                   = "DD_"..name,
        Size                   = UDim2.new(1,0,0,50),
        BackgroundTransparency = 1,
        ZIndex                 = 20,
        LayoutOrder            = order,
        ClipsDescendants       = false,
    }, parent)

    local Row = U.new("Frame", {
        Size                   = UDim2.new(1,0,0,50),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.38,
        ZIndex                 = 20,
    }, Container)
    U.corner(8, Row)
    U.stroke(Theme.ACCENT, 1, 0.65, Row)

    local nameLbl = U.label(Row, name, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-14,0,16)
    nameLbl.Position = UDim2.new(0,12,0,5)

    local selLbl = U.label(Row, selected, 13, Theme.TEXT, K.FONT_MED, Enum.TextXAlignment.Left, 21)
    selLbl.Size     = UDim2.new(1,-44,0,18)
    selLbl.Position = UDim2.new(0,12,0,22)

    local arrow = U.label(Row, "▾", 14, Theme.TEXT_MUTED, K.FONT_BOLD, Enum.TextXAlignment.Center, 21)
    arrow.Size     = UDim2.new(0,26,0,26)
    arrow.Position = UDim2.new(1,-32,0.5,0)
    arrow.AnchorPoint = Vector2.new(0,0.5)

    -- Dropdown list panel
    local MAX_LIST_H = 160
    local LIST_ITEM_H = 30
    local listH = math.min(#options * LIST_ITEM_H + 8, MAX_LIST_H)

    local List = U.new("Frame", {
        Size             = UDim2.new(1,0,0,0),
        Position         = UDim2.new(0,0,0,54),
        BackgroundColor3 = Theme.CARD3,
        BackgroundTransparency = 0.08,
        ZIndex           = 28,
        ClipsDescendants = true,
        Visible          = false,
    }, Container)
    U.corner(8, List)
    U.stroke(Theme.ACCENT, 1, 0.5, List)
    U.shadow(List, 28)

    -- Search box inside list
    local SearchBox = U.new("TextBox", {
        Size                   = UDim2.new(1,-16,0,28),
        Position               = UDim2.new(0,8,0,5),
        BackgroundColor3       = Theme.CARD4,
        BackgroundTransparency = 0.3,
        PlaceholderText        = "Search...",
        PlaceholderColor3      = Theme.TEXT_DIM,
        Text                   = "",
        TextColor3             = Theme.TEXT,
        TextSize               = 12,
        Font                   = K.FONT_REG,
        ClearTextOnFocus       = false,
        ZIndex                 = 29,
    }, List)
    U.corner(6, SearchBox)
    U.stroke(Theme.ACCENT, 1, 0.7, SearchBox)
    U.pad(0,0,8,8, SearchBox)

    local listScroll = U.scroll(List, UDim2.new(1,0,1,-38), UDim2.new(0,0,0,38), 29)
    U.pad(4,4,6,6, listScroll)
    U.list(Enum.FillDirection.Vertical, 3, nil, listScroll)

    -- Build option buttons
    local optBtns = {}
    local function buildOptions(filter)
        -- Clear old
        for _, b in ipairs(optBtns) do if b and b.Parent then b:Destroy() end end
        optBtns = {}

        local count = 0
        for _, opt in ipairs(options) do
            local show = filter == "" or opt:lower():find(filter:lower(), 1, true)
            if show then
                local isSelected = multi and table.find(multiSel, opt) or (not multi and selected == opt)
                local optBtn = U.new("TextButton", {
                    Name                   = "Opt_"..opt,
                    Size                   = UDim2.new(1,0,0,26),
                    BackgroundColor3       = Theme.ACCENT,
                    BackgroundTransparency = isSelected and 0.72 or 1,
                    Text                   = (multi and isSelected and "✓  " or "")..opt,
                    TextColor3             = isSelected and Theme.TEXT or Theme.TEXT_MUTED,
                    TextSize               = 12,
                    Font                   = K.FONT_MED,
                    TextXAlignment         = Enum.TextXAlignment.Left,
                    ZIndex                 = 30,
                }, listScroll)
                U.corner(6, optBtn)
                U.pad(0,0,10,8, optBtn)
                table.insert(optBtns, optBtn)
                count = count + 1

                optBtn.MouseEnter:Connect(function()
                    if not (not multi and selected == opt) then
                        U.tween(optBtn, { BackgroundTransparency = 0.82, TextColor3 = Theme.TEXT }, 0.1)
                    end
                end)
                optBtn.MouseLeave:Connect(function()
                    if not (not multi and selected == opt) then
                        U.tween(optBtn, { BackgroundTransparency = 1, TextColor3 = Theme.TEXT_MUTED }, 0.1)
                    end
                end)
                optBtn.MouseButton1Click:Connect(function()
                    if multi then
                        local idx = table.find(multiSel, opt)
                        if idx then
                            table.remove(multiSel, idx)
                        else
                            table.insert(multiSel, opt)
                        end
                        selLbl.Text = #multiSel == 0 and "None selected" or table.concat(multiSel, ", ")
                        buildOptions(SearchBox.Text)
                        task.spawn(callback, multiSel)
                    else
                        selected = opt
                        selLbl.Text = opt
                        buildOptions(SearchBox.Text)
                        open = false
                        U.tween(List, { Size = UDim2.new(1,0,0,0) }, 0.18)
                        U.tween(arrow, { Rotation = 0 }, 0.18)
                        task.delay(0.2, function() List.Visible = false end)
                        Container.Size = UDim2.new(1,0,0,50)
                        task.spawn(callback, selected)
                    end
                end)
            end
        end

        -- Update canvas
        listScroll.CanvasSize = UDim2.new(0,0,0, count * 29 + 8)
    end

    buildOptions("")

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        buildOptions(SearchBox.Text)
    end)

    -- Toggle
    local toggleBtn = U.new("TextButton", {
        Size                   = UDim2.fromScale(1,1),
        BackgroundTransparency = 1,
        Text                   = "",
        ZIndex                 = 22,
    }, Row)

    toggleBtn.MouseButton1Click:Connect(function()
        open = not open
        if open then
            List.Visible = true
            List.Size    = UDim2.new(1,0,0,0)
            SearchBox.Text = ""
            buildOptions("")
            U.tween(List,  { Size = UDim2.new(1,0,0,listH+38) }, 0.25, K.EASE_BACK)
            U.tween(arrow, { Rotation = 180 }, 0.2)
            Container.Size = UDim2.new(1,0,0, 50 + listH + 38 + 6)
        else
            U.tween(List,  { Size = UDim2.new(1,0,0,0) }, 0.18)
            U.tween(arrow, { Rotation = 0 }, 0.18)
            task.delay(0.2, function() List.Visible = false end)
            Container.Size = UDim2.new(1,0,0,50)
        end
    end)

    local obj = { _frame = Container }
    function obj:Set(v)
        selected = v
        selLbl.Text = v
    end
    function obj:Get()
        return multi and multiSel or selected
    end
    function obj:SetOptions(opts)
        options = opts
        buildOptions(SearchBox.Text)
    end

    return obj
end

-- ============================================================
-- -------INPUT-------
-- ============================================================
local function createInput(config, parent, order)
    config = config or {}
    local name        = config.Name        or "Input"
    local placeholder = config.Placeholder or "Type here..."
    local default     = config.Default     or ""
    local desc        = config.Desc        or ""
    local numeric     = config.Numeric     or false
    local maxlen      = config.MaxLength   or nil
    local callback    = config.Callback    or function() end
    local onChange    = config.OnChange    or nil

    local Row = U.new("Frame", {
        Name                   = "Input_"..name,
        Size                   = UDim2.new(1,0,0,56),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Row)

    local nameLbl = U.label(Row, name, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-14,0,16)
    nameLbl.Position = UDim2.new(0,12,0,5)

    local Box = U.new("TextBox", {
        Size                   = UDim2.new(1,-26,0,28),
        Position               = UDim2.new(0,13,0,22),
        BackgroundColor3       = Theme.CARD,
        BackgroundTransparency = 0.38,
        PlaceholderText        = placeholder,
        PlaceholderColor3      = Theme.TEXT_DIM,
        Text                   = default,
        TextColor3             = Theme.TEXT,
        TextSize               = 13,
        Font                   = K.FONT_MED,
        ClearTextOnFocus       = false,
        ZIndex                 = 21,
    }, Row)
    U.corner(7, Box)
    local boxStroke = U.stroke(Theme.ACCENT, 1, 0.7, Box)
    U.pad(0,0,10,10, Box)

    Box.Focused:Connect(function()
        U.tween(Box,       { BackgroundTransparency = 0.2 }, 0.15)
        U.tween(boxStroke, { Transparency = 0.35 }, 0.15)
    end)
    Box.FocusLost:Connect(function(enter)
        U.tween(Box,       { BackgroundTransparency = 0.38 }, 0.15)
        U.tween(boxStroke, { Transparency = 0.7 }, 0.15)
        if maxlen and #Box.Text > maxlen then
            Box.Text = Box.Text:sub(1, maxlen)
        end
        if enter then task.spawn(callback, Box.Text) end
    end)

    if onChange then
        Box:GetPropertyChangedSignal("Text"):Connect(function()
            task.spawn(onChange, Box.Text)
        end)
    end

    local obj = { _frame = Row, _box = Box }
    function obj:Get()  return Box.Text end
    function obj:Set(v) Box.Text = v    end
    function obj:Focus() Box:CaptureFocus() end

    return obj
end

-- ============================================================
-- -------TEXTAREA-------
-- ============================================================
local function createTextArea(config, parent, order)
    config = config or {}
    local name        = config.Name        or "TextArea"
    local placeholder = config.Placeholder or "Type here..."
    local default     = config.Default     or ""
    local height      = config.Height      or 80
    local callback    = config.Callback    or function() end

    local Row = U.new("Frame", {
        Name                   = "TA_"..name,
        Size                   = UDim2.new(1,0,0,height+28),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Row)

    local nameLbl = U.label(Row, name, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-14,0,16)
    nameLbl.Position = UDim2.new(0,12,0,5)

    local Box = U.new("TextBox", {
        Size                   = UDim2.new(1,-26,0,height),
        Position               = UDim2.new(0,13,0,22),
        BackgroundColor3       = Theme.CARD,
        BackgroundTransparency = 0.38,
        PlaceholderText        = placeholder,
        PlaceholderColor3      = Theme.TEXT_DIM,
        Text                   = default,
        TextColor3             = Theme.TEXT,
        TextSize               = 12,
        Font                   = K.FONT_MONO,
        ClearTextOnFocus       = false,
        MultiLine              = true,
        TextXAlignment         = Enum.TextXAlignment.Left,
        TextYAlignment         = Enum.TextYAlignment.Top,
        ZIndex                 = 21,
    }, Row)
    U.corner(7, Box)
    U.stroke(Theme.ACCENT, 1, 0.7, Box)
    U.pad(6,6,10,10, Box)

    local obj = { _frame = Row, _box = Box }
    function obj:Get()  return Box.Text end
    function obj:Set(v) Box.Text = v    end

    return obj
end

-- ============================================================
-- -------KEYBIND-------
-- ============================================================
local function createKeybind(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Keybind"
    local default  = config.Default  or Enum.KeyCode.F
    local callback = config.Callback or function() end
    local current  = default
    local listening = false

    local Row = U.new("Frame", {
        Name                   = "Key_"..name,
        Size                   = UDim2.new(1,0,0,34),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Row)

    local nameLbl = U.label(Row, name, 13, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-90,0,34)
    nameLbl.Position = UDim2.new(0,12,0,0)

    local KeyBtn = U.new("TextButton", {
        Size                   = UDim2.new(0,76,0,26),
        Position               = UDim2.new(1,-84,0.5,0),
        AnchorPoint            = Vector2.new(0,0.5),
        BackgroundColor3       = Theme.ACCENT_DARK,
        BackgroundTransparency = 0.28,
        Text                   = tostring(current.Name),
        TextColor3             = Theme.ACCENT,
        TextSize               = 11,
        Font                   = K.FONT_BOLD,
        ZIndex                 = 21,
    }, Row)
    U.corner(6, KeyBtn)
    U.stroke(Theme.ACCENT, 1, 0.52, KeyBtn)

    KeyBtn.MouseButton1Click:Connect(function()
        listening = true
        KeyBtn.Text       = "..."
        KeyBtn.TextColor3 = Theme.WARNING
        U.tween(KeyBtn, { BackgroundColor3 = Theme.WARNING_BG }, 0.15)
        U.stroke(Theme.WARNING, 1, 0.4, KeyBtn)
    end)

    local kconn = UserInputService.InputBegan:Connect(function(input, gp)
        if listening and not gp and input.UserInputType == Enum.UserInputType.Keyboard then
            current   = input.KeyCode
            listening = false
            KeyBtn.Text       = tostring(current.Name)
            KeyBtn.TextColor3 = Theme.ACCENT
            U.tween(KeyBtn, { BackgroundColor3 = Theme.ACCENT_DARK }, 0.15)
            task.spawn(callback, current)
        end
        if not gp and not listening and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == current then
            task.spawn(callback, current)
        end
    end)
    table.insert(_connections, kconn)

    local obj = { _frame = Row }
    function obj:Get() return current end
    function obj:Set(k) current = k KeyBtn.Text = tostring(k.Name) end

    return obj
end

-- ============================================================
-- -------COLORPICKER-------
-- ============================================================
local function createColorPicker(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Color"
    local default  = config.Default  or Color3.fromRGB(0,160,230)
    local callback = config.Callback or function() end
    local color    = default
    local open     = false

    local Container = U.new("Frame", {
        Name                   = "Color_"..name,
        Size                   = UDim2.new(1,0,0,34),
        BackgroundTransparency = 1,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)

    local Row = U.new("Frame", {
        Size                   = UDim2.new(1,0,0,34),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
    }, Container)
    U.corner(8, Row)

    local nameLbl = U.label(Row, name, 13, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-62,0,34)
    nameLbl.Position = UDim2.new(0,12,0,0)

    local Swatch = U.new("TextButton", {
        Size             = UDim2.new(0,46,0,22),
        Position         = UDim2.new(1,-54,0.5,0),
        AnchorPoint      = Vector2.new(0,0.5),
        BackgroundColor3 = color,
        Text             = "",
        ZIndex           = 21,
    }, Row)
    U.corner(6, Swatch)
    U.stroke(Color3.fromRGB(255,255,255), 1, 0.55, Swatch)

    -- Panel
    local Panel = U.new("Frame", {
        Size             = UDim2.new(1,0,0,0),
        Position         = UDim2.new(0,0,0,38),
        BackgroundColor3 = Theme.CARD3,
        BackgroundTransparency = 0.12,
        ZIndex           = 25,
        ClipsDescendants = true,
        Visible          = false,
    }, Container)
    U.corner(8, Panel)
    U.stroke(Theme.ACCENT, 1, 0.62, Panel)
    U.pad(10,10,12,12, Panel)
    U.list(Enum.FillDirection.Vertical, 8, nil, Panel)

    local vals = {
        math.floor(color.R * 255),
        math.floor(color.G * 255),
        math.floor(color.B * 255),
    }
    local channels = {
        { label = "R", colorFn = function(v) return Color3.fromRGB(v,0,0)   end, accent = Color3.fromRGB(220,60,60)  },
        { label = "G", colorFn = function(v) return Color3.fromRGB(0,v,0)   end, accent = Color3.fromRGB(60,200,80)  },
        { label = "B", colorFn = function(v) return Color3.fromRGB(0,0,v)   end, accent = Color3.fromRGB(60,120,230) },
    }

    local function updateSwatch()
        color = Color3.fromRGB(vals[1], vals[2], vals[3])
        Swatch.BackgroundColor3 = color
        task.spawn(callback, color)
    end

    local PANEL_H = 0
    for i, ch in ipairs(channels) do
        local chRow = U.new("Frame", {
            Size                   = UDim2.new(1,0,0,22),
            BackgroundTransparency = 1,
            ZIndex                 = 26,
        }, Panel)

        local lbl2 = U.label(chRow, ch.label, 11, ch.accent, K.FONT_BOLD, Enum.TextXAlignment.Left, 27)
        lbl2.Size     = UDim2.new(0,14,1,0)
        lbl2.Position = UDim2.new(0,0,0,0)

        local bg2 = U.new("Frame", {
            Size             = UDim2.new(1,-52,0,8),
            Position         = UDim2.new(0,20,0.5,0),
            AnchorPoint      = Vector2.new(0,0.5),
            BackgroundColor3 = Theme.TEXT_DIM,
            BackgroundTransparency = 0.4,
            ZIndex           = 27,
        }, chRow)
        U.corner(4, bg2)

        local pct2  = vals[i] / 255
        local fill2 = U.new("Frame", {
            Size             = UDim2.new(pct2,0,1,0),
            BackgroundColor3 = ch.colorFn(vals[i]),
            ZIndex           = 28,
        }, bg2)
        U.corner(4, fill2)

        local knob2 = U.new("TextButton", {
            Size             = UDim2.new(0,16,0,16),
            Position         = UDim2.new(pct2,-8,0.5,0),
            AnchorPoint      = Vector2.new(0,0.5),
            BackgroundColor3 = Color3.fromRGB(255,255,255),
            Text             = "",
            ZIndex           = 29,
        }, bg2)
        U.corner(8, knob2)
        U.stroke(ch.accent, 1.5, 0.3, knob2)

        local val2 = U.label(chRow, tostring(vals[i]), 10, ch.accent, K.FONT_BOLD, Enum.TextXAlignment.Right, 27)
        val2.Size     = UDim2.new(0,28,1,0)
        val2.Position = UDim2.new(1,-28,0,0)

        local drag2 = false
        knob2.MouseButton1Down:Connect(function() drag2 = true end)
        local dc = UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 then drag2 = false end
        end)
        table.insert(_connections, dc)
        local dc2 = UserInputService.InputChanged:Connect(function(inp)
            if drag2 and inp.UserInputType == Enum.UserInputType.MouseMovement then
                local ap = bg2.AbsolutePosition.X
                local as = bg2.AbsoluteSize.X
                if as <= 0 then return end
                local r2 = U.clamp((inp.Position.X - ap) / as, 0, 1)
                vals[i] = math.floor(r2 * 255)
                fill2.Size    = UDim2.new(r2,0,1,0)
                knob2.Position = UDim2.new(r2,-8,0.5,0)
                fill2.BackgroundColor3 = ch.colorFn(vals[i])
                val2.Text = tostring(vals[i])
                updateSwatch()
            end
        end)
        table.insert(_connections, dc2)
        PANEL_H = PANEL_H + 30
    end

    -- Hex input
    local hexRow = U.new("Frame", {
        Size                   = UDim2.new(1,0,0,26),
        BackgroundTransparency = 1,
        ZIndex                 = 26,
    }, Panel)

    local hexLbl = U.label(hexRow, "#", 11, Theme.TEXT_MUTED, K.FONT_BOLD, Enum.TextXAlignment.Left, 27)
    hexLbl.Size     = UDim2.new(0,12,1,0)

    local hexBox = U.new("TextBox", {
        Size                   = UDim2.new(1,-16,0,24),
        Position               = UDim2.new(0,14,0.5,0),
        AnchorPoint            = Vector2.new(0,0.5),
        BackgroundColor3       = Theme.CARD4,
        BackgroundTransparency = 0.35,
        PlaceholderText        = "RRGGBB",
        PlaceholderColor3      = Theme.TEXT_DIM,
        Text                   = string.format("%02X%02X%02X", vals[1], vals[2], vals[3]),
        TextColor3             = Theme.TEXT,
        TextSize               = 12,
        Font                   = K.FONT_MONO,
        ClearTextOnFocus       = false,
        ZIndex                 = 27,
    }, hexRow)
    U.corner(5, hexBox)
    U.stroke(Theme.ACCENT, 1, 0.7, hexBox)
    U.pad(0,0,8,8, hexBox)

    PANEL_H = PANEL_H + 36

    Swatch.MouseButton1Click:Connect(function()
        open = not open
        if open then
            Panel.Visible = true
            Panel.Size    = UDim2.new(1,0,0,0)
            U.tween(Panel, { Size = UDim2.new(1,0,0,PANEL_H) }, 0.25, K.EASE_BACK)
            Container.Size = UDim2.new(1,0,0, 34 + PANEL_H + 6)
        else
            U.tween(Panel, { Size = UDim2.new(1,0,0,0) }, 0.2)
            task.delay(0.22, function() Panel.Visible = false end)
            Container.Size = UDim2.new(1,0,0,34)
        end
    end)

    local obj = { _frame = Container }
    function obj:Get() return color end
    function obj:Set(c)
        color = c
        Swatch.BackgroundColor3 = c
        vals = { math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255) }
    end
    return obj
end

-- ============================================================
-- -------PROGRESS BAR-------
-- ============================================================
local function createProgressBar(config, parent, order)
    config = config or {}
    local name   = config.Name   or "Progress"
    local value  = config.Value  or 0
    local max    = config.Max    or 100
    local color  = config.Color  or Theme.ACCENT
    local suffix = config.Suffix or "%"
    local anim   = config.Animate ~= false

    local Row = U.new("Frame", {
        Name                   = "Prog_"..name,
        Size                   = UDim2.new(1,0,0,46),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Row)

    local pct = U.clamp(value/max, 0, 1)

    local nameLbl = U.label(Row, name, 12, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
    nameLbl.Size     = UDim2.new(1,-70,0,18)
    nameLbl.Position = UDim2.new(0,12,0,6)

    local valLbl = U.label(Row, U.round(pct*100)..suffix, 12, color, K.FONT_BOLD, Enum.TextXAlignment.Right, 21)
    valLbl.Size     = UDim2.new(0,60,0,18)
    valLbl.Position = UDim2.new(1,-68,0,6)

    local TrackBg = U.new("Frame", {
        Size             = UDim2.new(1,-26,0,10),
        Position         = UDim2.new(0,13,0,30),
        BackgroundColor3 = Theme.TEXT_DIM,
        BackgroundTransparency = 0.35,
        ZIndex           = 21,
    }, Row)
    U.corner(5, TrackBg)

    local Fill = U.new("Frame", {
        Size             = UDim2.new(pct,0,1,0),
        BackgroundColor3 = color,
        ZIndex           = 22,
    }, TrackBg)
    U.corner(5, Fill)

    -- Shimmer
    if anim then
        local shimmer = U.new("Frame", {
            Size                   = UDim2.new(0,30,1.2,0),
            Position               = UDim2.new(0,-35,-.1,0),
            BackgroundColor3       = Color3.fromRGB(255,255,255),
            BackgroundTransparency = 0.75,
            ZIndex                 = 23,
            ClipsDescendants       = false,
        }, Fill)
        U.corner(5, shimmer)
        task.spawn(function()
            while Fill and Fill.Parent do
                shimmer.Position = UDim2.new(0,-35,-.1,0)
                U.tween(shimmer, { Position = UDim2.new(1,10,-.1,0) }, 1.4, Enum.EasingStyle.Quad)
                task.wait(2.2)
            end
        end)
    end

    local obj = { _frame = Row }
    function obj:Set(v)
        value = U.clamp(v, 0, max)
        local r = value/max
        U.tween(Fill, { Size = UDim2.new(r,0,1,0) }, 0.3)
        valLbl.Text = U.round(r*100)..suffix
    end
    function obj:Get()  return value end
    function obj:SetMax(m) max = m end

    return obj
end

-- ============================================================
-- -------SEPARATOR-------
-- ============================================================
local function createSeparator(config, parent, order)
    config = config or {}
    local label = config.Label or ""
    local color = config.Color or Theme.TEXT_DIM

    local Row = U.new("Frame", {
        Name                   = "Sep",
        Size                   = UDim2.new(1,0,0,20),
        BackgroundTransparency = 1,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)

    if label ~= "" then
        local lbl = U.label(Row, label, 11, color, K.FONT_BOLD, Enum.TextXAlignment.Center, 21)
        lbl.Size     = UDim2.new(0.4,0,1,0)
        lbl.Position = UDim2.new(0.3,0,0,0)

        local lineL = U.new("Frame", {
            Size             = UDim2.new(0.28,-8,0,1),
            Position         = UDim2.new(0,0,0.5,0),
            BackgroundColor3 = color,
            BackgroundTransparency = 0.45,
            ZIndex           = 21,
        }, Row)

        local lineR = U.new("Frame", {
            Size             = UDim2.new(0.28,-8,0,1),
            Position         = UDim2.new(0.72,8,0.5,0),
            BackgroundColor3 = color,
            BackgroundTransparency = 0.45,
            ZIndex           = 21,
        }, Row)
    else
        local line = U.new("Frame", {
            Size             = UDim2.new(1,-24,0,1),
            Position         = UDim2.new(0,12,0.5,0),
            BackgroundColor3 = color,
            BackgroundTransparency = 0.5,
            ZIndex           = 21,
        }, Row)
        U.corner(1, line)
    end

    return { _frame = Row }
end

-- ============================================================
-- -------LABEL-------
-- ============================================================
local function createLabel(config, parent, order)
    config = config or {}
    local text  = config.Text  or ""
    local color = config.Color or Theme.TEXT_MUTED
    local size  = config.Size  or 12
    local rich  = config.Rich  or false

    local Lbl = U.label(parent, text, size, color, K.FONT_REG, Enum.TextXAlignment.Left, 20)
    Lbl.Name        = "Lbl"
    Lbl.Size        = UDim2.new(1,0,0,20)
    Lbl.TextWrapped = true
    Lbl.RichText    = rich
    Lbl.LayoutOrder = order
    U.pad(0,0,12,0, Lbl)

    local obj = { _frame = Lbl }
    function obj:Set(v) Lbl.Text = v end
    function obj:Get()  return Lbl.Text end
    return obj
end

-- ============================================================
-- -------BADGE-------
-- ============================================================
local function createBadge(config, parent, order)
    config = config or {}
    local text    = config.Text    or "Badge"
    local color   = config.Color   or Theme.ACCENT
    local bgColor = config.BgColor or Theme.CARD3

    local Badge = U.new("Frame", {
        Name                   = "Badge_"..text,
        Size                   = UDim2.new(0, 0, 0, 22),
        AutomaticSize          = Enum.AutomaticSize.X,
        BackgroundColor3       = bgColor,
        BackgroundTransparency = 0.35,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(11, Badge)
    U.stroke(color, 1, 0.55, Badge)
    U.pad(0, 0, 8, 8, Badge)

    local lbl = U.label(Badge, text, 11, color, K.FONT_BOLD, Enum.TextXAlignment.Center, 21)
    lbl.Size         = UDim2.new(0, 0, 1, 0)
    lbl.AutomaticSize = Enum.AutomaticSize.X

    local obj = { _frame = Badge }
    function obj:Set(v) lbl.Text = v end
    function obj:Get()  return lbl.Text end
    return obj
end

-- ============================================================
-- -------ANIMATION LIBRARY-------
-- ============================================================
local Anim = {}

function Anim.fadeIn(obj, dur)
    obj.BackgroundTransparency = 1
    U.tween(obj, { BackgroundTransparency = 0.05 }, dur or 0.3)
end

function Anim.fadeOut(obj, dur, callback)
    U.tween(obj, { BackgroundTransparency = 1 }, dur or 0.3)
    if callback then task.delay(dur or 0.3, callback) end
end

function Anim.slideIn(obj, from, dur)
    -- from: "left","right","top","bottom"
    local startPos = {
        left   = UDim2.new(-1,0,obj.Position.Y.Scale,obj.Position.Y.Offset),
        right  = UDim2.new(2,0,obj.Position.Y.Scale,obj.Position.Y.Offset),
        top    = UDim2.new(obj.Position.X.Scale,obj.Position.X.Offset,-1,0),
        bottom = UDim2.new(obj.Position.X.Scale,obj.Position.X.Offset,2,0),
    }
    local endPos = obj.Position
    obj.Position = startPos[from] or startPos.left
    U.tween(obj, { Position = endPos }, dur or 0.3, K.EASE_BACK)
end

function Anim.bounce(obj, scale, dur)
    local orig = obj.Size
    U.tween(obj, { Size = UDim2.new(
        orig.X.Scale*(scale or 1.06), orig.X.Offset,
        orig.Y.Scale*(scale or 1.06), orig.Y.Offset
    )}, (dur or 0.12))
    task.delay(dur or 0.12, function()
        U.tween(obj, { Size = orig }, (dur or 0.12), K.EASE_BACK)
    end)
end

function Anim.pulse(obj, color1, color2, times)
    times = times or 3
    local orig = obj.BackgroundColor3
    local function doPulse(n)
        if n <= 0 then
            U.tween(obj, { BackgroundColor3 = orig }, 0.15)
            return
        end
        U.tween(obj, { BackgroundColor3 = color1 or Theme.ACCENT_GLOW }, 0.15)
        task.delay(0.18, function()
            U.tween(obj, { BackgroundColor3 = color2 or orig }, 0.15)
            task.delay(0.18, function() doPulse(n-1) end)
        end)
    end
    doPulse(times)
end

function Anim.typewrite(label, text, speed)
    speed = speed or 0.04
    label.Text = ""
    task.spawn(function()
        for i = 1, #text do
            label.Text = text:sub(1,i)
            task.wait(speed)
        end
    end)
end

OceanUI.Anim = Anim

-- ============================================================
-- -------UTILS EXTRA-------
-- ============================================================

-- Timestamp formatter
function U.timestamp()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- Color to hex string
function U.colorToHex(c)
    return string.format("#%02X%02X%02X",
        math.floor(c.R*255),
        math.floor(c.G*255),
        math.floor(c.B*255)
    )
end

-- Hex string to Color3
function U.hexToColor(hex)
    hex = hex:gsub("#","")
    local r = tonumber(hex:sub(1,2),16) or 0
    local g = tonumber(hex:sub(3,4),16) or 0
    local b = tonumber(hex:sub(5,6),16) or 0
    return Color3.fromRGB(r,g,b)
end

-- Generate random pastel color
function U.randomPastel()
    return Color3.fromHSV(math.random(), 0.4, 0.95)
end

-- Truncate string
function U.truncate(str, maxLen, suffix)
    suffix = suffix or "..."
    if #str <= maxLen then return str end
    return str:sub(1, maxLen - #suffix) .. suffix
end

-- Split string
function U.split(str, sep)
    local result = {}
    for s in str:gmatch("[^"..sep.."]+") do
        table.insert(result, s)
    end
    return result
end

-- Trim whitespace
function U.trim(str)
    return str:match("^%s*(.-)%s*$")
end

-- Deep copy table
function U.deepCopy(orig)
    local copy = {}
    for k, v in pairs(orig) do
        if type(v) == "table" then
            copy[k] = U.deepCopy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

-- Map function over table
function U.map(tbl, fn)
    local result = {}
    for i, v in ipairs(tbl) do
        result[i] = fn(v, i)
    end
    return result
end

-- Filter table
function U.filter(tbl, fn)
    local result = {}
    for _, v in ipairs(tbl) do
        if fn(v) then table.insert(result, v) end
    end
    return result
end

-- Find in table
function U.find(tbl, fn)
    for _, v in ipairs(tbl) do
        if fn(v) then return v end
    end
    return nil
end

-- ============================================================
-- -------THEME PRESETS-------
-- ============================================================
local Themes = {}

Themes.Ocean = U.deepCopy(Theme)

Themes.Crimson = U.deepCopy(Theme)
Themes.Crimson.ACCENT      = Color3.fromRGB(220, 50,  80)
Themes.Crimson.ACCENT2     = Color3.fromRGB(180, 30,  60)
Themes.Crimson.ACCENT_DARK = Color3.fromRGB(80,  10,  25)
Themes.Crimson.CORNER      = Color3.fromRGB(220, 50,  80)
Themes.Crimson.DIVIDER     = Color3.fromRGB(220, 50,  80)

Themes.Forest = U.deepCopy(Theme)
Themes.Forest.BG           = Color3.fromRGB(8,   20,  12)
Themes.Forest.CARD         = Color3.fromRGB(12,  28,  18)
Themes.Forest.CARD2        = Color3.fromRGB(15,  34,  22)
Themes.Forest.SIDEBAR      = Color3.fromRGB(9,   22,  14)
Themes.Forest.ACCENT       = Color3.fromRGB(50,  200, 100)
Themes.Forest.ACCENT2      = Color3.fromRGB(30,  160, 75)
Themes.Forest.ACCENT_DARK  = Color3.fromRGB(10,  60,  25)
Themes.Forest.CORNER       = Color3.fromRGB(50,  200, 100)

Themes.Sunset = U.deepCopy(Theme)
Themes.Sunset.BG           = Color3.fromRGB(22,  10,  5)
Themes.Sunset.CARD         = Color3.fromRGB(35,  18,  8)
Themes.Sunset.CARD2        = Color3.fromRGB(42,  22,  10)
Themes.Sunset.SIDEBAR      = Color3.fromRGB(28,  12,  5)
Themes.Sunset.ACCENT       = Color3.fromRGB(230, 120, 30)
Themes.Sunset.ACCENT2      = Color3.fromRGB(190, 80,  15)
Themes.Sunset.ACCENT_DARK  = Color3.fromRGB(80,  30,  5)
Themes.Sunset.CORNER       = Color3.fromRGB(230, 120, 30)

Themes.Void = U.deepCopy(Theme)
Themes.Void.BG             = Color3.fromRGB(5,   5,   10)
Themes.Void.CARD           = Color3.fromRGB(10,  10,  20)
Themes.Void.CARD2          = Color3.fromRGB(14,  14,  28)
Themes.Void.SIDEBAR        = Color3.fromRGB(7,   7,   15)
Themes.Void.ACCENT         = Color3.fromRGB(140, 80,  230)
Themes.Void.ACCENT2        = Color3.fromRGB(100, 50,  190)
Themes.Void.ACCENT_DARK    = Color3.fromRGB(40,  15,  80)
Themes.Void.CORNER         = Color3.fromRGB(140, 80,  230)

Themes.Gold = U.deepCopy(Theme)
Themes.Gold.BG             = Color3.fromRGB(16,  12,  4)
Themes.Gold.CARD           = Color3.fromRGB(26,  20,  6)
Themes.Gold.CARD2          = Color3.fromRGB(32,  24,  8)
Themes.Gold.SIDEBAR        = Color3.fromRGB(20,  15,  5)
Themes.Gold.ACCENT         = Color3.fromRGB(210, 170, 30)
Themes.Gold.ACCENT2        = Color3.fromRGB(170, 130, 15)
Themes.Gold.ACCENT_DARK    = Color3.fromRGB(70,  50,  5)
Themes.Gold.CORNER         = Color3.fromRGB(210, 170, 30)

OceanUI.Themes = Themes

function OceanUI:ApplyTheme(themeName)
    local t = Themes[themeName]
    if not t then
        warn("[OceanUI] Theme not found: "..tostring(themeName))
        return
    end
    for k, v in pairs(t) do
        Theme[k] = v
    end
end

-- ============================================================
-- -------COMPONENT: STAT CARD-------
-- ============================================================
local function createStatCard(config, parent, order)
    config = config or {}
    local label    = config.Label    or "Stat"
    local value    = config.Value    or "0"
    local icon     = config.Icon     or "📊"
    local color    = config.Color    or Theme.ACCENT
    local sub      = config.Sub      or ""

    local Card = U.new("Frame", {
        Name                   = "Stat_"..label,
        Size                   = UDim2.new(1,0,0,64),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.35,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(10, Card)
    U.stroke(color, 1, 0.65, Card)

    -- Left color accent
    local accent = U.new("Frame", {
        Size             = UDim2.new(0,4,0.7,0),
        Position         = UDim2.new(0,0,0.15,0),
        BackgroundColor3 = color,
        ZIndex           = 21,
    }, Card)
    U.corner(2, accent)

    -- Icon circle
    local iconCircle = U.new("Frame", {
        Size             = UDim2.new(0,38,0,38),
        Position         = UDim2.new(0,14,0.5,0),
        AnchorPoint      = Vector2.new(0,0.5),
        BackgroundColor3 = color,
        BackgroundTransparency = 0.7,
        ZIndex           = 21,
    }, Card)
    U.corner(19, iconCircle)

    local iconLbl = U.label(iconCircle, icon, 18, color, K.FONT_BOLD, Enum.TextXAlignment.Center, 22)
    iconLbl.Size = UDim2.fromScale(1,1)

    -- Value
    local valueLbl = U.label(Card, tostring(value), 22, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    valueLbl.Size     = UDim2.new(1,-66,0,28)
    valueLbl.Position = UDim2.new(0,62,0,9)

    -- Label
    local labelLbl = U.label(Card, label, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, 21)
    labelLbl.Size     = UDim2.new(1,-66,0,14)
    labelLbl.Position = UDim2.new(0,62,0,36)

    -- Sub info
    if sub ~= "" then
        local subLbl = U.label(Card, sub, 10, color, K.FONT_REG, Enum.TextXAlignment.Right, 21)
        subLbl.Size     = UDim2.new(0,80,0,14)
        subLbl.Position = UDim2.new(1,-88,0,8)
    end

    local obj = { _frame = Card }
    function obj:SetValue(v)
        valueLbl.Text = tostring(v)
    end
    function obj:SetSub(v)
        -- update sub if needed
    end
    return obj
end

-- ============================================================
-- -------COMPONENT: TABLE (data grid)-------
-- ============================================================
local function createTable(config, parent, order)
    config = config or {}
    local headers  = config.Headers or { "Column 1", "Column 2" }
    local rows     = config.Rows    or {}
    local height   = config.Height  or 160

    local Container = U.new("Frame", {
        Name                   = "Table",
        Size                   = UDim2.new(1,0,0,height+36),
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.38,
        ZIndex                 = 20,
        LayoutOrder            = order,
        ClipsDescendants       = true,
    }, parent)
    U.corner(8, Container)
    U.stroke(Theme.ACCENT, 1, 0.65, Container)

    -- Header row
    local HeaderRow = U.new("Frame", {
        Size             = UDim2.new(1,0,0,32),
        BackgroundColor3 = Theme.CARD,
        BackgroundTransparency = 0.35,
        ZIndex           = 21,
    }, Container)
    U.corner(8, HeaderRow)

    local headerFix2 = U.new("Frame", {
        Size                   = UDim2.new(1,0,0,10),
        Position               = UDim2.new(0,0,1,-10),
        BackgroundColor3       = Theme.CARD,
        BackgroundTransparency = 0.35,
        BorderSizePixel        = 0,
        ZIndex                 = 21,
    }, HeaderRow)

    local colW = 1 / #headers
    for i, h in ipairs(headers) do
        local hLbl = U.label(HeaderRow, h, 11, Theme.ACCENT, K.FONT_BOLD, Enum.TextXAlignment.Left, 22)
        hLbl.Size     = UDim2.new(colW,-4,1,0)
        hLbl.Position = UDim2.new(colW*(i-1),10,0,0)
    end

    -- Data scroll
    local dataScroll = U.scroll(Container, UDim2.new(1,0,1,-36), UDim2.new(0,0,0,32), 21)
    U.list(Enum.FillDirection.Vertical, 0, nil, dataScroll)

    local function addRow(rowData, idx)
        local even = idx % 2 == 0
        local row = U.new("Frame", {
            Size             = UDim2.new(1,0,0,28),
            BackgroundColor3 = even and Theme.CARD3 or Theme.CARD2,
            BackgroundTransparency = even and 0.5 or 0.7,
            ZIndex           = 22,
            LayoutOrder      = idx,
        }, dataScroll)

        local div = U.new("Frame", {
            Size             = UDim2.new(1,0,0,1),
            Position         = UDim2.new(0,0,1,-1),
            BackgroundColor3 = Theme.DIVIDER2,
            BackgroundTransparency = 0.5,
            ZIndex           = 23,
        }, row)

        for j, cell in ipairs(rowData) do
            local cellLbl = U.label(row, tostring(cell), 12, Theme.TEXT2, K.FONT_REG, Enum.TextXAlignment.Left, 22)
            cellLbl.Size     = UDim2.new(colW,-4,1,-4)
            cellLbl.Position = UDim2.new(colW*(j-1),10,0,2)
        end

        row.MouseEnter:Connect(function()
            U.tween(row, { BackgroundTransparency = 0.35 }, 0.1)
        end)
        row.MouseLeave:Connect(function()
            U.tween(row, { BackgroundTransparency = even and 0.5 or 0.7 }, 0.1)
        end)
    end

    for i, row in ipairs(rows) do
        addRow(row, i)
    end

    local obj = { _frame = Container }
    function obj:AddRow(rowData)
        local idx = #dataScroll:GetChildren() - 1
        addRow(rowData, idx + 1)
    end
    function obj:Clear()
        for _, c in ipairs(dataScroll:GetChildren()) do
            if c:IsA("Frame") then c:Destroy() end
        end
    end
    return obj
end

-- ============================================================
-- -------COMPONENT: RADIO GROUP-------
-- ============================================================
local function createRadioGroup(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Radio"
    local options  = config.Options  or {}
    local default  = config.Default  or (options[1] or "")
    local callback = config.Callback or function() end
    local selected = default

    local Container = U.new("Frame", {
        Name                   = "Radio_"..name,
        Size                   = UDim2.new(1,0,0,0),
        AutomaticSize          = Enum.AutomaticSize.Y,
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Container)
    U.pad(8,8,12,12, Container)
    U.list(Enum.FillDirection.Vertical, 6, nil, Container)

    local titleLbl = U.label(Container, name, 12, Theme.TEXT_MUTED, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    titleLbl.Size = UDim2.new(1,0,0,18)

    local btns = {}
    for _, opt in ipairs(options) do
        local row = U.new("TextButton", {
            Size                   = UDim2.new(1,0,0,28),
            BackgroundTransparency = 1,
            Text                   = "",
            ZIndex                 = 21,
        }, Container)

        -- Radio circle
        local circle = U.new("Frame", {
            Size             = UDim2.new(0,18,0,18),
            Position         = UDim2.new(0,0,0.5,0),
            AnchorPoint      = Vector2.new(0,0.5),
            BackgroundColor3 = opt==selected and Theme.ACCENT or Theme.TEXT_DIM,
            BackgroundTransparency = opt==selected and 0.3 or 0.5,
            ZIndex           = 22,
        }, row)
        U.corner(9, circle)
        U.stroke(opt==selected and Theme.ACCENT or Theme.TEXT_DIM, 1.5, 0.3, circle)

        -- Inner dot
        local dot = U.new("Frame", {
            Size             = UDim2.new(0,8,0,8),
            Position         = UDim2.fromScale(0.5,0.5),
            AnchorPoint      = Vector2.new(0.5,0.5),
            BackgroundColor3 = Color3.fromRGB(255,255,255),
            BackgroundTransparency = opt==selected and 0 or 1,
            ZIndex           = 23,
        }, circle)
        U.corner(4, dot)

        local optLbl = U.label(row, opt, 13, opt==selected and Theme.TEXT or Theme.TEXT_MUTED, K.FONT_MED, Enum.TextXAlignment.Left, 22)
        optLbl.Size     = UDim2.new(1,-28,1,0)
        optLbl.Position = UDim2.new(0,26,0,0)

        table.insert(btns, { row=row, circle=circle, dot=dot, lbl=optLbl, opt=opt })

        row.MouseButton1Click:Connect(function()
            selected = opt
            for _, b in ipairs(btns) do
                local isSelected = b.opt == opt
                U.tween(b.circle, {
                    BackgroundColor3       = isSelected and Theme.ACCENT or Theme.TEXT_DIM,
                    BackgroundTransparency = isSelected and 0.3 or 0.5,
                }, 0.15)
                U.tween(b.dot, { BackgroundTransparency = isSelected and 0 or 1 }, 0.15)
                U.tween(b.lbl, { TextColor3 = isSelected and Theme.TEXT or Theme.TEXT_MUTED }, 0.15)
            end
            task.spawn(callback, selected)
        end)
    end

    local obj = { _frame = Container }
    function obj:Get() return selected end
    function obj:Set(v)
        selected = v
        for _, b in ipairs(btns) do
            local isS = b.opt==v
            b.circle.BackgroundColor3       = isS and Theme.ACCENT or Theme.TEXT_DIM
            b.circle.BackgroundTransparency = isS and 0.3 or 0.5
            b.dot.BackgroundTransparency    = isS and 0 or 1
            b.lbl.TextColor3                = isS and Theme.TEXT or Theme.TEXT_MUTED
        end
    end
    return obj
end

-- ============================================================
-- -------COMPONENT: CHECKBOX GROUP-------
-- ============================================================
local function createCheckboxGroup(config, parent, order)
    config = config or {}
    local name     = config.Name     or "Checkbox"
    local options  = config.Options  or {}
    local defaults = config.Defaults or {}
    local callback = config.Callback or function() end
    local checked  = {}

    for _, d in ipairs(defaults) do checked[d] = true end

    local Container = U.new("Frame", {
        Name                   = "Check_"..name,
        Size                   = UDim2.new(1,0,0,0),
        AutomaticSize          = Enum.AutomaticSize.Y,
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.5,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(8, Container)
    U.pad(8,8,12,12, Container)
    U.list(Enum.FillDirection.Vertical, 6, nil, Container)

    local titleLbl = U.label(Container, name, 12, Theme.TEXT_MUTED, K.FONT_BOLD, Enum.TextXAlignment.Left, 21)
    titleLbl.Size = UDim2.new(1,0,0,18)

    for _, opt in ipairs(options) do
        local isChecked = checked[opt] or false

        local row = U.new("TextButton", {
            Size                   = UDim2.new(1,0,0,28),
            BackgroundTransparency = 1,
            Text                   = "",
            ZIndex                 = 21,
        }, Container)

        local box = U.new("Frame", {
            Size             = UDim2.new(0,18,0,18),
            Position         = UDim2.new(0,0,0.5,0),
            AnchorPoint      = Vector2.new(0,0.5),
            BackgroundColor3 = isChecked and Theme.ACCENT or Theme.TEXT_DIM,
            BackgroundTransparency = isChecked and 0.3 or 0.6,
            ZIndex           = 22,
        }, row)
        U.corner(4, box)
        U.stroke(isChecked and Theme.ACCENT or Theme.TEXT_DIM, 1.5, 0.3, box)

        local checkLbl = U.label(box, isChecked and "✓" or "", 12, Color3.fromRGB(255,255,255), K.FONT_BOLD, Enum.TextXAlignment.Center, 23)
        checkLbl.Size = UDim2.fromScale(1,1)

        local optLbl = U.label(row, opt, 13, isChecked and Theme.TEXT or Theme.TEXT_MUTED, K.FONT_MED, Enum.TextXAlignment.Left, 22)
        optLbl.Size     = UDim2.new(1,-28,1,0)
        optLbl.Position = UDim2.new(0,26,0,0)

        row.MouseButton1Click:Connect(function()
            isChecked = not isChecked
            checked[opt] = isChecked
            U.tween(box, {
                BackgroundColor3       = isChecked and Theme.ACCENT or Theme.TEXT_DIM,
                BackgroundTransparency = isChecked and 0.3 or 0.6,
            }, 0.15)
            checkLbl.Text = isChecked and "✓" or ""
            U.tween(optLbl, { TextColor3 = isChecked and Theme.TEXT or Theme.TEXT_MUTED }, 0.15)
            local result = {}
            for k, v in pairs(checked) do if v then table.insert(result, k) end end
            task.spawn(callback, result)
        end)
    end

    local obj = { _frame = Container }
    function obj:Get()
        local result = {}
        for k, v in pairs(checked) do if v then table.insert(result, k) end end
        return result
    end
    return obj
end

-- ============================================================
-- -------COMPONENT: ALERT / CONFIRM DIALOG-------
-- ============================================================
local function createDialog(screenGui, config)
    config = config or {}
    local title   = config.Title   or "Alert"
    local message = config.Message or ""
    local type_   = config.Type    or "alert"
    local onOk    = config.OnOk    or function() end
    local onCancel = config.OnCancel or function() end

    local colorMap = {
        alert   = Theme.ACCENT,
        success = Theme.SUCCESS,
        warning = Theme.WARNING,
        danger  = Theme.DANGER,
    }
    local color = colorMap[type_] or Theme.ACCENT

    local Overlay2 = U.new("Frame", {
        Size                   = UDim2.fromScale(1,1),
        BackgroundColor3       = Color3.fromRGB(0,0,0),
        BackgroundTransparency = 0.5,
        ZIndex                 = K.Z_MODAL - 1,
    }, screenGui)

    local Dialog = U.new("Frame", {
        Name                   = "Dialog",
        Size                   = UDim2.new(0,340,0,0),
        Position               = UDim2.fromScale(0.5,0.5),
        AnchorPoint            = Vector2.new(0.5,0.5),
        BackgroundColor3       = Theme.CARD,
        BackgroundTransparency = 0.06,
        ZIndex                 = K.Z_MODAL,
    }, screenGui)
    U.corner(14, Dialog)
    U.stroke(color, 1.5, 0.35, Dialog)
    U.shadow(Dialog, K.Z_MODAL)
    U.glow(Dialog, color, K.Z_MODAL, 100)

    -- Top color bar
    local topBar = U.new("Frame", {
        Size             = UDim2.new(1,0,0,5),
        BackgroundColor3 = color,
        BackgroundTransparency = 0.2,
        ZIndex           = K.Z_MODAL + 1,
    }, Dialog)
    U.corner(14, topBar)

    local titleLbl = U.label(Dialog, title, 16, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Center, K.Z_MODAL+1)
    titleLbl.Size     = UDim2.new(1,-32,0,24)
    titleLbl.Position = UDim2.new(0,16,0,20)

    local msgLbl = U.label(Dialog, message, 13, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Center, K.Z_MODAL+1)
    msgLbl.Size        = UDim2.new(1,-32,0,0)
    msgLbl.Position    = UDim2.new(0,16,0,52)
    msgLbl.AutomaticSize = Enum.AutomaticSize.Y
    msgLbl.TextWrapped = true

    local btnY = 80

    local function close()
        U.tween(Dialog,  { Size = UDim2.new(0,340,0,0), BackgroundTransparency=1 }, 0.2)
        U.tween(Overlay2,{ BackgroundTransparency=1 }, 0.2)
        task.delay(0.25, function() Dialog:Destroy() Overlay2:Destroy() end)
    end

    if type_ == "confirm" then
        local cancelBtn = U.new("TextButton", {
            Size                   = UDim2.new(0.5,-8,0,36),
            Position               = UDim2.new(0,12,0,btnY+8),
            BackgroundColor3       = Theme.TEXT_DIM,
            BackgroundTransparency = 0.5,
            Text                   = "Cancel",
            TextColor3             = Theme.TEXT_MUTED,
            TextSize               = 13,
            Font                   = K.FONT_BOLD,
            ZIndex                 = K.Z_MODAL+1,
        }, Dialog)
        U.corner(8, cancelBtn)
        cancelBtn.MouseButton1Click:Connect(function()
            close()
            task.spawn(onCancel)
        end)

        local okBtn = U.new("TextButton", {
            Size                   = UDim2.new(0.5,-8,0,36),
            Position               = UDim2.new(0.5,-4,0,btnY+8),
            BackgroundColor3       = color,
            BackgroundTransparency = 0.35,
            Text                   = "Confirm",
            TextColor3             = Theme.TEXT,
            TextSize               = 13,
            Font                   = K.FONT_BOLD,
            ZIndex                 = K.Z_MODAL+1,
        }, Dialog)
        U.corner(8, okBtn)
        okBtn.MouseButton1Click:Connect(function()
            close()
            task.spawn(onOk)
        end)
    else
        local okBtn = U.new("TextButton", {
            Size                   = UDim2.new(1,-24,0,36),
            Position               = UDim2.new(0,12,0,btnY+8),
            BackgroundColor3       = color,
            BackgroundTransparency = 0.35,
            Text                   = "OK",
            TextColor3             = Theme.TEXT,
            TextSize               = 13,
            Font                   = K.FONT_BOLD,
            ZIndex                 = K.Z_MODAL+1,
        }, Dialog)
        U.corner(8, okBtn)
        okBtn.MouseButton1Click:Connect(function()
            close()
            task.spawn(onOk)
        end)
    end

    -- Animate in
    Overlay2.BackgroundTransparency = 1
    U.tween(Overlay2, { BackgroundTransparency = 0.5 }, 0.2)
    Dialog.BackgroundTransparency = 1
    U.tween(Dialog, {
        Size = UDim2.new(0,340,0,btnY+62),
        BackgroundTransparency = 0.06
    }, 0.3, K.EASE_BACK)

    return Dialog
end

-- ============================================================
-- -------COMPONENT: LOADING SPINNER-------
-- ============================================================
local function createLoadingSpinner(config, parent, order)
    config = config or {}
    local size  = config.Size  or 32
    local color = config.Color or Theme.ACCENT
    local text  = config.Text  or "Loading..."

    local Container = U.new("Frame", {
        Name                   = "Spinner",
        Size                   = UDim2.new(1,0,0,size+24),
        BackgroundTransparency = 1,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)

    local spinnerFrame = U.new("Frame", {
        Size             = UDim2.new(0,size,0,size),
        Position         = UDim2.fromScale(0.5,0.5),
        AnchorPoint      = Vector2.new(0.5,0.5),
        BackgroundTransparency = 1,
        ZIndex           = 21,
    }, Container)

    -- Arc segments to simulate spinner
    for i = 1, 8 do
        local angle = (i-1) * 45
        local alpha = i / 8
        local seg = U.new("Frame", {
            Size             = UDim2.new(0,4,0,size*0.4),
            Position         = UDim2.fromScale(0.5,0.1),
            AnchorPoint      = Vector2.new(0.5,0),
            BackgroundColor3 = color,
            BackgroundTransparency = 1 - alpha * 0.9,
            Rotation         = angle,
            ZIndex           = 22,
        }, spinnerFrame)
        U.corner(2, seg)
    end

    -- Rotate animation
    task.spawn(function()
        local rot = 0
        while spinnerFrame and spinnerFrame.Parent do
            rot = (rot + 45) % 360
            spinnerFrame.Rotation = rot
            task.wait(0.08)
        end
    end)

    local textLbl = U.label(Container, text, 12, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Center, 21)
    textLbl.Size     = UDim2.new(1,0,0,16)
    textLbl.Position = UDim2.new(0,0,1,-18)

    local obj = { _frame = Container }
    function obj:SetText(t) textLbl.Text = t end
    function obj:Destroy() Container:Destroy() end
    return obj
end

-- ============================================================
-- -------COMPONENT: ACCORDION (multi-frame stack)-------
-- ============================================================
local function createAccordion(config, parent, order)
    config = config or {}
    local sections  = config.Sections or {}
    local exclusive = config.Exclusive ~= false

    local Container = U.new("Frame", {
        Name                   = "Accordion",
        Size                   = UDim2.new(1,0,0,0),
        AutomaticSize          = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.list(Enum.FillDirection.Vertical, 6, nil, Container)

    local openSections = {}

    for i, section in ipairs(sections) do
        local open     = section.Open or false
        local secName  = section.Name or "Section "..i
        local color    = section.Color or Theme.ACCENT

        local secFrame = U.new("Frame", {
            Name                   = "Sec_"..secName,
            Size                   = UDim2.new(1,0,0,0),
            AutomaticSize          = Enum.AutomaticSize.Y,
            BackgroundColor3       = Theme.CARD2,
            BackgroundTransparency = 0.38,
            ZIndex                 = 20,
            LayoutOrder            = i,
        }, Container)
        U.corner(8, secFrame)
        U.stroke(color, 1, 0.7, secFrame)

        local hdr = U.new("TextButton", {
            Size                   = UDim2.new(1,0,0,34),
            BackgroundColor3       = Theme.CARD,
            BackgroundTransparency = 0.45,
            Text                   = "",
            ZIndex                 = 21,
        }, secFrame)
        U.corner(8, hdr)

        local hdrFix3 = U.new("Frame", {
            Size                   = UDim2.new(1,0,0,10),
            Position               = UDim2.new(0,0,1,-10),
            BackgroundColor3       = Theme.CARD,
            BackgroundTransparency = 0.45,
            BorderSizePixel        = 0,
            ZIndex                 = 21,
        }, hdr)

        local leftBar2 = U.new("Frame", {
            Size             = UDim2.new(0,3,0,16),
            Position         = UDim2.new(0,8,0.5,0),
            AnchorPoint      = Vector2.new(0,0.5),
            BackgroundColor3 = color,
            ZIndex           = 22,
        }, hdr)
        U.corner(2, leftBar2)

        local secNameLbl = U.label(hdr, secName, 13, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, 22)
        secNameLbl.Size     = UDim2.new(1,-42,0,34)
        secNameLbl.Position = UDim2.new(0,18,0,0)

        local secArrow = U.label(hdr, open and "▾" or "▸", 13, Theme.TEXT_MUTED, K.FONT_BOLD, Enum.TextXAlignment.Center, 22)
        secArrow.Size     = UDim2.new(0,24,0,24)
        secArrow.Position = UDim2.new(1,-30,0.5,0)
        secArrow.AnchorPoint = Vector2.new(0,0.5)

        local body = U.new("Frame", {
            Size                   = UDim2.new(1,0,0,0),
            AutomaticSize          = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            ZIndex                 = 21,
            Visible                = open,
        }, secFrame)
        U.list(Enum.FillDirection.Vertical, 6, nil, body)
        U.pad(6,10,10,10, body)

        -- Populate body with items
        if section.Items then
            for j, item in ipairs(section.Items) do
                if item.Type == "button" then
                    createButton(item, body, j)
                elseif item.Type == "toggle" then
                    createToggle(item, body, j)
                elseif item.Type == "slider" then
                    createSlider(item, body, j)
                elseif item.Type == "label" then
                    createLabel(item, body, j)
                end
            end
        end

        if open then openSections[i] = true end

        hdr.MouseButton1Click:Connect(function()
            open = not open
            if exclusive and open then
                -- close others
                for k, _ in pairs(openSections) do
                    openSections[k] = false
                end
            end
            openSections[i] = open
            body.Visible  = open
            secArrow.Text = open and "▾" or "▸"
        end)
    end

    return { _frame = Container }
end

-- ============================================================
-- -------CREATE FRAME (base definition)-------
-- BUG FIX: createFrame was never defined; the patch below referenced
-- a nil value causing an immediate crash. Defined here with all standard
-- component methods, then extended by the patch below.
-- ============================================================
local function createFrame(config, parent, order)
    config = config or {}
    local title    = config.Title   or ""
    local color    = config.Color   or Theme.ACCENT
    local open     = config.Open    ~= false
    local desc     = config.Desc    or ""

    local hasTitle = title ~= ""
    local headerH  = hasTitle and 34 or 0

    local Container = U.new("Frame", {
        Name                   = "Frame_"..(title ~= "" and title or tostring(order)),
        Size                   = UDim2.new(1, 0, 0, 0),
        AutomaticSize          = Enum.AutomaticSize.Y,
        BackgroundColor3       = Theme.CARD2,
        BackgroundTransparency = 0.38,
        ZIndex                 = 20,
        LayoutOrder            = order,
    }, parent)
    U.corner(10, Container)
    U.stroke(color, 1, 0.68, Container)

    if hasTitle then
        local hdr = U.new("Frame", {
            Size             = UDim2.new(1, 0, 0, headerH),
            BackgroundColor3 = Theme.CARD,
            BackgroundTransparency = 0.42,
            ZIndex           = 21,
        }, Container)
        U.corner(10, hdr)
        -- Square off bottom corners of header
        U.new("Frame", {
            Size                   = UDim2.new(1, 0, 0, 10),
            Position               = UDim2.new(0, 0, 1, -10),
            BackgroundColor3       = Theme.CARD,
            BackgroundTransparency = 0.42,
            BorderSizePixel        = 0,
            ZIndex                 = 21,
        }, hdr)
        -- Left accent bar
        local bar = U.new("Frame", {
            Size             = UDim2.new(0, 3, 0, 16),
            Position         = UDim2.new(0, 10, 0.5, 0),
            AnchorPoint      = Vector2.new(0, 0.5),
            BackgroundColor3 = color,
            ZIndex           = 22,
        }, hdr)
        U.corner(2, bar)
        local titleLbl = U.label(hdr, title, 13, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, 22)
        titleLbl.Size     = UDim2.new(1, -24, 1, 0)
        titleLbl.Position = UDim2.new(0, 20, 0, 0)
    end

    local content = U.new("Frame", {
        Name                   = "Content",
        Size                   = UDim2.new(1, 0, 0, 0),
        AutomaticSize          = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        ZIndex                 = 21,
        Visible                = open,
    }, Container)
    U.list(Enum.FillDirection.Vertical, 6, nil, content)
    U.pad(8, 10, 10, 10, content)

    local frameOrder = 0
    local obj = { _frame = Container, _content = content }

    local function nextOrder() frameOrder = frameOrder + 1 return frameOrder end
    obj._order = 0
    function obj:_next() obj._order = obj._order + 1 return obj._order end

    function obj:CreateButton(cfg)         return createButton(cfg, self._content, self:_next()) end
    function obj:CreateExecuteButton(cfg)  return createExecuteButton(cfg, self._content, self:_next()) end
    function obj:CreateToggle(cfg)         return createToggle(cfg, self._content, self:_next()) end
    function obj:CreateSlider(cfg)         return createSlider(cfg, self._content, self:_next()) end
    function obj:CreateDropdown(cfg)       return createDropdown(cfg, self._content, self:_next()) end
    function obj:CreateInput(cfg)          return createInput(cfg, self._content, self:_next()) end
    function obj:CreateTextArea(cfg)       return createTextArea(cfg, self._content, self:_next()) end
    function obj:CreateKeybind(cfg)        return createKeybind(cfg, self._content, self:_next()) end
    function obj:CreateColorPicker(cfg)    return createColorPicker(cfg, self._content, self:_next()) end
    function obj:CreateProgressBar(cfg)    return createProgressBar(cfg, self._content, self:_next()) end
    function obj:CreateSeparator(cfg)      return createSeparator(cfg, self._content, self:_next()) end
    function obj:CreateLabel(cfg)          return createLabel(cfg, self._content, self:_next()) end
    function obj:CreateBadge(cfg)          return createBadge(cfg, self._content, self:_next()) end

    return obj
end

-- ============================================================
-- -------EXTEND FRAME WITH NEW COMPONENTS-------
-- ============================================================
-- Patch createFrame to add extended components defined later in this file.
-- BUG FIX: previously _origCreateFrame = createFrame was called when
-- createFrame was nil, crashing immediately. Now createFrame is defined
-- above and the patch safely wraps it.
local _origCreateFrame = createFrame
createFrame = function(config, parent, order)
    local f = _origCreateFrame(config, parent, order)

    function f:CreateStatCard(cfg)
        self._order = self._order + 1
        return createStatCard(cfg, self._content, self._order)
    end
    function f:CreateTable(cfg)
        self._order = self._order + 1
        return createTable(cfg, self._content, self._order)
    end
    function f:CreateRadioGroup(cfg)
        self._order = self._order + 1
        return createRadioGroup(cfg, self._content, self._order)
    end
    function f:CreateCheckboxGroup(cfg)
        self._order = self._order + 1
        return createCheckboxGroup(cfg, self._content, self._order)
    end
    function f:CreateAccordion(cfg)
        self._order = self._order + 1
        return createAccordion(cfg, self._content, self._order)
    end
    function f:CreateLoadingSpinner(cfg)
        self._order = self._order + 1
        return createLoadingSpinner(cfg, self._content, self._order)
    end

    return f
end

-- ============================================================
-- -------CREATE WINDOW (base definition)-------
-- BUG FIX: createWindow was never defined; the patch below referenced
-- a nil value. Defined here as a proper base, then extended by patch.
-- ============================================================
local function createWindow(config)
    config = config or {}
    local title    = config.Title    or "OceanHub"
    local subtitle = config.Subtitle or ""
    local icon     = config.Icon     or K.ICON
    local minW     = config.MinWidth or 560
    local minH     = config.MinHeight or 380

    -- Destroy old instance of same window
    local pg = Players.LocalPlayer:WaitForChild("PlayerGui")
    local existing = pg:FindFirstChild("OceanUI_"..title)
    if existing then existing:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name           = "OceanUI_"..title
    gui.ResetOnSpawn   = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent         = pg

    -- Dim overlay (Active=false agar tidak memblokir klik ke window)
    local overlay = U.new("Frame", {
        Size                   = UDim2.fromScale(1, 1),
        BackgroundColor3       = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.55,
        ZIndex                 = K.Z_BASE - 1,
        Active                 = false,
    }, gui)

    -- Main window frame
    local win = U.new("Frame", {
        Name                   = "Window",
        Size                   = UDim2.new(0, minW, 0, minH),
        Position               = UDim2.fromScale(0.5, 0.5),
        AnchorPoint            = Vector2.new(0.5, 0.5),
        BackgroundColor3       = Theme.BG,
        BackgroundTransparency = 0.04,
        ZIndex                 = K.Z_BASE,
    }, gui)
    U.corner(14, win)
    U.stroke(Theme.ACCENT, 1.5, 0.35, win)
    U.shadow(win, K.Z_BASE, UDim2.new(1, 40, 1, 40), UDim2.new(0, -20, 0, -20))
    U.glow(win, Theme.CORNER, K.Z_BASE)

    -- Top bar
    local topBar = U.new("Frame", {
        Name             = "TopBar",
        Size             = UDim2.new(1, 0, 0, 48),
        BackgroundColor3 = Theme.TOPBAR,
        BackgroundTransparency = 0.25,
        ZIndex           = K.Z_BASE + 1,
    }, win)
    U.corner(14, topBar)
    U.new("Frame", {
        Size                   = UDim2.new(1, 0, 0, 14),
        Position               = UDim2.new(0, 0, 1, -14),
        BackgroundColor3       = Theme.TOPBAR,
        BackgroundTransparency = 0.25,
        BorderSizePixel        = 0,
        ZIndex                 = K.Z_BASE + 1,
    }, topBar)

    -- Window icon
    local iconImg = U.new("ImageLabel", {
        Size               = UDim2.new(0, 30, 0, 30),
        Position           = UDim2.new(0, 10, 0.5, 0),
        AnchorPoint        = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Image              = icon,
        ScaleType          = Enum.ScaleType.Fit,
        ZIndex             = K.Z_BASE + 2,
    }, topBar)
    U.corner(7, iconImg)

    local titleLbl = U.label(topBar, title, 15, Theme.TEXT, K.FONT_BOLD, Enum.TextXAlignment.Left, K.Z_BASE+2)
    titleLbl.Size     = UDim2.new(1, -130, 0, 22)
    titleLbl.Position = UDim2.new(0, 48, 0, 6)

    if subtitle ~= "" then
        local subLbl = U.label(topBar, subtitle, 11, Theme.TEXT_MUTED, K.FONT_REG, Enum.TextXAlignment.Left, K.Z_BASE+2)
        subLbl.Size     = UDim2.new(1, -130, 0, 14)
        subLbl.Position = UDim2.new(0, 48, 0, 28)
    end

    -- Close button
    local closeBtn = U.new("TextButton", {
        Size                   = UDim2.new(0, 24, 0, 24),
        Position               = UDim2.new(1, -34, 0.5, 0),
        AnchorPoint            = Vector2.new(0, 0.5),
        BackgroundColor3       = Theme.DANGER,
        BackgroundTransparency = 0.4,
        Text                   = "✕",
        TextColor3             = Color3.fromRGB(255, 200, 200),
        TextSize               = 12,
        Font                   = K.FONT_BOLD,
        ZIndex                 = K.Z_BASE + 3,
    }, topBar)
    U.corner(12, closeBtn)
    closeBtn.MouseButton1Click:Connect(function()
        U.tween(win, { BackgroundTransparency = 1 }, 0.25)
        U.tween(overlay, { BackgroundTransparency = 1 }, 0.25)
        task.delay(0.3, function() gui:Destroy() end)
    end)

    -- Content area (below topbar)
    local contentArea = U.new("Frame", {
        Name                   = "ContentArea",
        Size                   = UDim2.new(1, 0, 1, -48),
        Position               = UDim2.new(0, 0, 0, 48),
        BackgroundTransparency = 1,
        ZIndex                 = K.Z_BASE + 1,
    }, win)

    -- Tab bar (left sidebar)
    local tabBar = U.new("Frame", {
        Name             = "TabBar",
        Size             = UDim2.new(0, 120, 1, 0),
        BackgroundColor3 = Theme.SIDEBAR,
        BackgroundTransparency = 0.25,
        ZIndex           = K.Z_BASE + 2,
    }, contentArea)
    U.new("Frame", {
        Size                   = UDim2.new(0, 14, 1, 0),
        Position               = UDim2.new(1, -14, 0, 0),
        BackgroundColor3       = Theme.SIDEBAR,
        BackgroundTransparency = 0.25,
        BorderSizePixel        = 0,
        ZIndex                 = K.Z_BASE + 2,
    }, tabBar)
    U.corner(14, tabBar)

    local tabList = U.new("ScrollingFrame", {
        Size                    = UDim2.new(1, 0, 1, -8),
        Position                = UDim2.new(0, 0, 0, 4),
        BackgroundTransparency  = 1,
        BorderSizePixel         = 0,
        ScrollBarThickness      = 0,
        AutomaticCanvasSize     = Enum.AutomaticSize.Y,
        CanvasSize              = UDim2.new(0, 0, 0, 0),
        ZIndex                  = K.Z_BASE + 3,
    }, tabBar)
    U.list(Enum.FillDirection.Vertical, 4, nil, tabList)
    U.pad(6, 6, 6, 6, tabList)

    -- Page area (right of sidebar)
    local pageArea = U.new("Frame", {
        Name                   = "PageArea",
        Size                   = UDim2.new(1, -120, 1, 0),
        Position               = UDim2.new(0, 120, 0, 0),
        BackgroundTransparency = 1,
        ZIndex                 = K.Z_BASE + 2,
        ClipsDescendants       = true,
    }, contentArea)

    -- Drag logic
    local dragStart, startPos, dragging2
    topBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging2 = true
            dragStart = inp.Position
            startPos  = win.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then dragging2 = false end
            end)
        end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if dragging2 and inp.UserInputType == Enum.UserInputType.MouseMovement then
            local d = inp.Position - dragStart
            win.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+d.X, startPos.Y.Scale, startPos.Y.Offset+d.Y)
        end
    end)

    -- Entry animation
    win.BackgroundTransparency = 1
    overlay.BackgroundTransparency = 1
    U.tween(overlay, { BackgroundTransparency = 0.55 }, 0.3)
    task.delay(0.05, function()
        U.tween(win, { BackgroundTransparency = 0.04 }, 0.35, K.EASE_BACK)
    end)

    local tabs       = {}
    local activeTab  = nil
    local tabOrder   = 0

    local wObj = { _gui = gui, _win = win }

    function wObj:CreateTab(cfg)
        cfg = cfg or {}
        local tname = cfg.Name or "Tab"
        local ticon = cfg.Icon or ""
        tabOrder = tabOrder + 1

        -- Tab button in sidebar
        local tabBtn = U.new("TextButton", {
            Size                   = UDim2.new(1, 0, 0, 32),
            BackgroundColor3       = Theme.ACCENT,
            BackgroundTransparency = 1,
            Text                   = "",
            ZIndex                 = K.Z_BASE + 4,
            LayoutOrder            = tabOrder,
        }, tabList)
        U.corner(7, tabBtn)

        local tabLbl = U.label(tabBtn, (ticon ~= "" and ticon.."  " or "")..tname, 12, Theme.TEXT_MUTED, K.FONT_MED, Enum.TextXAlignment.Left, K.Z_BASE+5)
        tabLbl.Size     = UDim2.new(1, -12, 1, 0)
        tabLbl.Position = UDim2.new(0, 8, 0, 0)

        local activeBar = U.new("Frame", {
            Size             = UDim2.new(0, 3, 0.6, 0),
            Position         = UDim2.new(0, 0, 0.2, 0),
            BackgroundColor3 = Theme.ACCENT,
            BackgroundTransparency = 1,
            ZIndex           = K.Z_BASE + 5,
        }, tabBtn)
        U.corner(2, activeBar)

        -- Page scroll area
        local page = U.new("ScrollingFrame", {
            Name                    = "Page_"..tname,
            Size                    = UDim2.fromScale(1, 1),
            BackgroundTransparency  = 1,
            BorderSizePixel         = 0,
            ScrollBarThickness      = 3,
            ScrollBarImageColor3    = Theme.ACCENT,
            ScrollBarImageTransparency = 0.4,
            AutomaticCanvasSize     = Enum.AutomaticSize.Y,
            CanvasSize              = UDim2.new(0, 0, 0, 0),
            ZIndex                  = K.Z_BASE + 3,
            Visible                 = false,
        }, pageArea)
        U.list(Enum.FillDirection.Vertical, 8, nil, page)
        U.pad(12, 12, 12, 12, page)

        local frameOrder2 = 0
        local tObj = { _page = page }

        function tObj:_next() frameOrder2 = frameOrder2 + 1 return frameOrder2 end
        function tObj:CreateFrame(cfg2) return createFrame(cfg2, self._page, self:_next()) end
        function tObj:CreateButton(cfg2) return createButton(cfg2, self._page, self:_next()) end
        function tObj:CreateExecuteButton(cfg2) return createExecuteButton(cfg2, self._page, self:_next()) end
        function tObj:CreateToggle(cfg2) return createToggle(cfg2, self._page, self:_next()) end
        function tObj:CreateSlider(cfg2) return createSlider(cfg2, self._page, self:_next()) end
        function tObj:CreateDropdown(cfg2) return createDropdown(cfg2, self._page, self:_next()) end
        function tObj:CreateInput(cfg2) return createInput(cfg2, self._page, self:_next()) end
        function tObj:CreateTextArea(cfg2) return createTextArea(cfg2, self._page, self:_next()) end
        function tObj:CreateKeybind(cfg2) return createKeybind(cfg2, self._page, self:_next()) end
        function tObj:CreateColorPicker(cfg2) return createColorPicker(cfg2, self._page, self:_next()) end
        function tObj:CreateProgressBar(cfg2) return createProgressBar(cfg2, self._page, self:_next()) end
        function tObj:CreateSeparator(cfg2) return createSeparator(cfg2, self._page, self:_next()) end
        function tObj:CreateLabel(cfg2) return createLabel(cfg2, self._page, self:_next()) end
        function tObj:CreateBadge(cfg2) return createBadge(cfg2, self._page, self:_next()) end
        function tObj:CreateStatCard(cfg2) return createStatCard(cfg2, self._page, self:_next()) end

        local function activateTab()
            -- Deactivate all
            for _, t in ipairs(tabs) do
                t.page.Visible = false
                U.tween(t.btn,    { BackgroundTransparency = 1 }, 0.15)
                U.tween(t.lbl,    { TextColor3 = Theme.TEXT_MUTED }, 0.15)
                U.tween(t.bar,    { BackgroundTransparency = 1 }, 0.15)
            end
            -- Activate this tab
            page.Visible = true
            U.tween(tabBtn,    { BackgroundTransparency = 0.82 }, 0.15)
            U.tween(tabLbl,    { TextColor3 = Theme.TEXT }, 0.15)
            U.tween(activeBar, { BackgroundTransparency = 0 }, 0.15)
            activeTab = tObj
        end

        table.insert(tabs, { btn = tabBtn, lbl = tabLbl, bar = activeBar, page = page, obj = tObj })

        -- Auto-activate first tab
        if #tabs == 1 then activateTab() end

        tabBtn.MouseButton1Click:Connect(activateTab)
        tabBtn.MouseEnter:Connect(function()
            if activeTab ~= tObj then
                U.tween(tabBtn, { BackgroundTransparency = 0.92 }, 0.1)
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if activeTab ~= tObj then
                U.tween(tabBtn, { BackgroundTransparency = 1 }, 0.1)
            end
        end)

        return tObj
    end

    function wObj:Notify(cfg)
        return Notify(gui, cfg)
    end

    return wObj
end

-- ============================================================
-- -------EXTEND WINDOW WITH DIALOG-------
-- ============================================================
-- BUG FIX: previously _origCreateWindow = createWindow was called when
-- createWindow was nil. Now createWindow is defined above and the patch works.
local _origCreateWindow = createWindow
createWindow = function(config)
    local w = _origCreateWindow(config)

    function w:Dialog(cfg)
        return createDialog(self._gui, cfg)
    end
    function w:Alert(cfg)
        cfg = cfg or {}
        cfg.Type = "alert"
        return createDialog(self._gui, cfg)
    end
    function w:Confirm(cfg)
        cfg = cfg or {}
        cfg.Type = "confirm"
        return createDialog(self._gui, cfg)
    end

    return w
end

-- ============================================================
-- -------EXTEND PUBLIC API-------
-- ============================================================
function OceanUI:CreateWindow(config)
    return createWindow(config)
end

function OceanUI:CreateDialog(screenGui, config)
    return createDialog(screenGui, config)
end

function OceanUI:Notify(screenGui, config)
    return Notify(screenGui, config)
end

function OceanUI:ContextMenu(screenGui, config)
    return ContextMenu(screenGui, config)
end

-- ============================================================
-- -------GLOBAL SHORTHAND (optional)-------
-- ============================================================
-- Accessible as _G.OceanUI from any script in the same executor
_G.OceanUI = OceanUI


return OceanUI