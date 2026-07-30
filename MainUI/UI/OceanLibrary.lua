--[[
    OceanHub UI Library (OceanLibrary) - SELF CONTAINED
    Theme: Midnight Ocean (Premium Design)
    Features: Window, Tabs, Button, Toggle, Slider, Dropdown, Textbox, Notify, Minimize
]]

local OceanLibrary = {}
OceanLibrary.__index = OceanLibrary

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- ═══════════════════════════════════════════════════════════
-- THEME CONFIG
-- ═══════════════════════════════════════════════════════════

local C = {
    IconId = "rbxassetid://84718341622420",
    GlowAsset = "rbxassetid://5028857484",

    -- Base
    BgPrimary = Color3.fromRGB(8, 14, 32),
    BgSecondary = Color3.fromRGB(6, 12, 28),
    BgCard = Color3.fromRGB(10, 20, 45),
    BgElevated = Color3.fromRGB(14, 28, 58),

    -- Borders
    BorderPrimary = Color3.fromRGB(30, 80, 160),
    BorderSubtle = Color3.fromRGB(20, 50, 100),
    BorderGlow = Color3.fromRGB(56, 189, 248),

    -- Text
    TextPrimary = Color3.fromRGB(240, 248, 255),
    TextSecondary = Color3.fromRGB(148, 190, 235),
    TextMuted = Color3.fromRGB(90, 130, 180),
    TextAccent = Color3.fromRGB(125, 211, 252),

    -- Tabs
    TabIdle = Color3.fromRGB(12, 28, 60),
    TabIdleBorder = Color3.fromRGB(25, 60, 115),
    TabIdleText = Color3.fromRGB(130, 175, 225),

    TabActive = Color3.fromRGB(20, 75, 145),
    TabActiveBorder = Color3.fromRGB(56, 189, 248),
    TabActiveText = Color3.fromRGB(255, 255, 255),

    -- Components
    CompBg = Color3.fromRGB(12, 28, 60),
    CompBgHover = Color3.fromRGB(18, 45, 90),
    CompBorder = Color3.fromRGB(25, 60, 120),
    CompBorderHover = Color3.fromRGB(40, 110, 190),

    -- Toggle
    ToggleOff = Color3.fromRGB(18, 30, 55),
    ToggleOn = Color3.fromRGB(20, 90, 170),
    ToggleOnBorder = Color3.fromRGB(56, 189, 248),

    -- Slider
    SliderTrack = Color3.fromRGB(18, 30, 55),
    SliderFill = Color3.fromRGB(56, 189, 248),
    SliderKnob = Color3.fromRGB(220, 240, 255),

    -- Glow colors
    GlowCyan = Color3.fromRGB(56, 189, 248),
    GlowPurple = Color3.fromRGB(129, 140, 248),
    GlowGreen = Color3.fromRGB(52, 211, 153),
    GlowYellow = Color3.fromRGB(251, 191, 36),

    -- Close / Minimize
    BtnControlBg = Color3.fromRGB(15, 35, 70),
    BtnCloseHover = Color3.fromRGB(220, 50, 50),
    BtnMinHover = Color3.fromRGB(30, 100, 180),
}

-- ═══════════════════════════════════════════════════════════
-- TWEEN HELPERS
-- ═══════════════════════════════════════════════════════════

local tweenFast = TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenMed = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local tweenSlow = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function tween(obj, props, info)
    TweenService:Create(obj, info or tweenFast, props):Play()
end

-- ═══════════════════════════════════════════════════════════
-- CORNER GLOW LIGHTS
-- ═══════════════════════════════════════════════════════════

local function addCornerLights(parent, size, transparency)
    size = size or UDim2.new(0, 220, 0, 220)
    transparency = transparency or 0.03
    local data = {
        {UDim2.new(0, -60, 0, -60), C.GlowCyan},
        {UDim2.new(1, -160, 0, -60), C.GlowPurple},
        {UDim2.new(0, -60, 1, -160), C.GlowGreen},
        {UDim2.new(1, -160, 1, -160), C.GlowYellow},
    }
    for _, d in ipairs(data) do
        local g = Instance.new("ImageLabel")
        g.Name = "CornerGlow"
        g.Size = size
        g.Position = d[1]
        g.BackgroundTransparency = 1
        g.Image = C.GlowAsset
        g.ImageColor3 = d[2]
        g.ImageTransparency = transparency
        g.ZIndex = 1
        g.Parent = parent
    end
end

-- ═══════════════════════════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════

function OceanLibrary:Notify(options)
    options = options or {}
    local title = options.Title or "OceanHub"
    local content = options.Content or "Notification"
    local duration = options.Duration or 5

    local sg = CoreGui:FindFirstChild("OceanNotif")
    if not sg then
        sg = Instance.new("ScreenGui")
        sg.Name = "OceanNotif"
        sg.ResetOnSpawn = false
        if gethui then sg.Parent = gethui()
        elseif syn and syn.protect_gui then syn.protect_gui(sg); sg.Parent = CoreGui
        else sg.Parent = CoreGui end
    end

    local holder = sg:FindFirstChild("Holder")
    if not holder then
        holder = Instance.new("Frame")
        holder.Name = "Holder"
        holder.Size = UDim2.new(0, 300, 1, -20)
        holder.Position = UDim2.new(1, -310, 0, 10)
        holder.BackgroundTransparency = 1
        holder.Parent = sg
        local ll = Instance.new("UIListLayout", holder)
        ll.SortOrder = Enum.SortOrder.LayoutOrder
        ll.VerticalAlignment = Enum.VerticalAlignment.Bottom
        ll.Padding = UDim.new(0, 8)
    end

    local nf = Instance.new("Frame")
    nf.Size = UDim2.new(1, 0, 0, 0)
    nf.BackgroundColor3 = C.BgElevated
    nf.BorderSizePixel = 0
    nf.ClipsDescendants = true
    nf.BackgroundTransparency = 0.05
    nf.Parent = holder
    Instance.new("UICorner", nf).CornerRadius = UDim.new(0, 10)
    local ns = Instance.new("UIStroke", nf)
    ns.Color = C.BorderGlow
    ns.Thickness = 1
    ns.Transparency = 0.4

    addCornerLights(nf, UDim2.new(0, 90, 0, 90), 0.06)

    -- Accent bar left
    local accent = Instance.new("Frame", nf)
    accent.Size = UDim2.new(0, 3, 1, -12)
    accent.Position = UDim2.new(0, 8, 0, 6)
    accent.BackgroundColor3 = C.GlowCyan
    accent.ZIndex = 5
    Instance.new("UICorner", accent).CornerRadius = UDim.new(0, 2)

    local tl = Instance.new("TextLabel", nf)
    tl.Size = UDim2.new(1, -30, 0, 18)
    tl.Position = UDim2.new(0, 18, 0, 10)
    tl.BackgroundTransparency = 1
    tl.Text = title
    tl.TextColor3 = C.TextPrimary
    tl.TextSize = 13
    tl.Font = Enum.Font.GothamBold
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.ZIndex = 5

    local cl = Instance.new("TextLabel", nf)
    cl.Size = UDim2.new(1, -30, 0, 30)
    cl.Position = UDim2.new(0, 18, 0, 28)
    cl.BackgroundTransparency = 1
    cl.Text = content
    cl.TextColor3 = C.TextSecondary
    cl.TextSize = 11
    cl.Font = Enum.Font.Gotham
    cl.TextXAlignment = Enum.TextXAlignment.Left
    cl.TextWrapped = true
    cl.ZIndex = 5

    -- Animate in
    tween(nf, {Size = UDim2.new(1, 0, 0, 68)}, tweenMed)

    task.delay(duration, function()
        if nf and nf.Parent then
            tween(nf, {Size = UDim2.new(1, 0, 0, 0), BackgroundTransparency = 1}, tweenMed)
            task.wait(0.4)
            if nf and nf.Parent then nf:Destroy() end
        end
    end)
end

-- ═══════════════════════════════════════════════════════════
-- UI COMPONENTS
-- ═══════════════════════════════════════════════════════════

local function makeBase(parent, h, name)
    local f = Instance.new("Frame")
    f.Name = name or "Comp"
    f.Size = UDim2.new(1, -6, 0, h or 38)
    f.BackgroundColor3 = C.CompBg
    f.BorderSizePixel = 0
    f.ZIndex = 5
    f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
    local s = Instance.new("UIStroke", f)
    s.Color = C.CompBorder
    s.Thickness = 1
    s.Transparency = 0.3
    return f, s
end

local function hoverEffect(btn, frame, stroke)
    btn.MouseEnter:Connect(function()
        tween(frame, {BackgroundColor3 = C.CompBgHover})
        tween(stroke, {Color = C.CompBorderHover, Transparency = 0})
    end)
    btn.MouseLeave:Connect(function()
        tween(frame, {BackgroundColor3 = C.CompBg})
        tween(stroke, {Color = C.CompBorder, Transparency = 0.3})
    end)
end

local function AddButton(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Button"
    local cb = opts.Callback or function() end

    local f, s = makeBase(parent, 36, name)

    -- Icon dot
    local dot = Instance.new("Frame", f)
    dot.Size = UDim2.new(0, 6, 0, 6)
    dot.Position = UDim2.new(0, 12, 0.5, -3)
    dot.BackgroundColor3 = C.GlowCyan
    dot.ZIndex = 6
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -40, 1, 0)
    lbl.Position = UDim2.new(0, 24, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = C.TextPrimary
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6

    -- Arrow
    local arrow = Instance.new("TextLabel", f)
    arrow.Size = UDim2.new(0, 20, 1, 0)
    arrow.Position = UDim2.new(1, -28, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "›"
    arrow.TextColor3 = C.TextMuted
    arrow.TextSize = 18
    arrow.Font = Enum.Font.GothamBold
    arrow.ZIndex = 6

    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.ZIndex = 7

    hoverEffect(btn, f, s)
    btn.MouseButton1Click:Connect(function()
        -- Click flash
        tween(dot, {BackgroundColor3 = Color3.fromRGB(255, 255, 255)})
        task.delay(0.15, function()
            tween(dot, {BackgroundColor3 = C.GlowCyan})
        end)
        pcall(cb)
    end)
    return f
end

local function AddToggle(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Toggle"
    local default = opts.Default or false
    local cb = opts.Callback or function() end

    local state = default
    local f, s = makeBase(parent, 36, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -70, 1, 0)
    lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = C.TextPrimary
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6

    local outer = Instance.new("Frame", f)
    outer.Size = UDim2.new(0, 40, 0, 22)
    outer.Position = UDim2.new(1, -52, 0.5, -11)
    outer.BackgroundColor3 = state and C.ToggleOn or C.ToggleOff
    outer.ZIndex = 6
    Instance.new("UICorner", outer).CornerRadius = UDim.new(0, 11)
    local os2 = Instance.new("UIStroke", outer)
    os2.Color = state and C.ToggleOnBorder or C.CompBorder
    os2.Transparency = 0.3

    local knob = Instance.new("Frame", outer)
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    knob.BackgroundColor3 = state and C.SliderKnob or C.TextMuted
    knob.ZIndex = 7
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    -- Glow on knob when active
    local knobGlow = Instance.new("ImageLabel", knob)
    knobGlow.Size = UDim2.new(3, 0, 3, 0)
    knobGlow.Position = UDim2.new(-1, 0, -1, 0)
    knobGlow.BackgroundTransparency = 1
    knobGlow.Image = C.GlowAsset
    knobGlow.ImageColor3 = C.GlowCyan
    knobGlow.ImageTransparency = state and 0.7 or 1
    knobGlow.ZIndex = 6

    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.ZIndex = 8

    local function updateToggle()
        tween(outer, {BackgroundColor3 = state and C.ToggleOn or C.ToggleOff})
        tween(os2, {Color = state and C.ToggleOnBorder or C.CompBorder})
        tween(knob, {
            Position = state and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8),
            BackgroundColor3 = state and C.SliderKnob or C.TextMuted,
        })
        tween(knobGlow, {ImageTransparency = state and 0.7 or 1})
    end

    btn.MouseButton1Click:Connect(function()
        state = not state
        updateToggle()
        pcall(cb, state)
    end)

    return f
end

local function AddSlider(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Slider"
    local min = opts.Min or 0
    local max = opts.Max or 100
    local default = opts.Default or min
    local cb = opts.Callback or function() end

    local val = math.clamp(default, min, max)
    local f, s = makeBase(parent, 52, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -60, 0, 20)
    lbl.Position = UDim2.new(0, 14, 0, 4)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = C.TextPrimary
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6

    local vlbl = Instance.new("TextLabel", f)
    vlbl.Size = UDim2.new(0, 45, 0, 20)
    vlbl.Position = UDim2.new(1, -55, 0, 4)
    vlbl.BackgroundTransparency = 1
    vlbl.Text = tostring(val)
    vlbl.TextColor3 = C.TextAccent
    vlbl.TextSize = 13
    vlbl.Font = Enum.Font.GothamBold
    vlbl.TextXAlignment = Enum.TextXAlignment.Right
    vlbl.ZIndex = 6

    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(1, -28, 0, 6)
    bar.Position = UDim2.new(0, 14, 0, 34)
    bar.BackgroundColor3 = C.SliderTrack
    bar.ZIndex = 6
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 3)

    local pct = math.clamp((val - min) / (max - min), 0, 1)
    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new(pct, 0, 1, 0)
    fill.BackgroundColor3 = C.SliderFill
    fill.ZIndex = 7
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 3)

    -- Fill glow
    local fillGlow = Instance.new("ImageLabel", fill)
    fillGlow.Size = UDim2.new(0, 30, 0, 30)
    fillGlow.Position = UDim2.new(1, -15, 0.5, -15)
    fillGlow.BackgroundTransparency = 1
    fillGlow.Image = C.GlowAsset
    fillGlow.ImageColor3 = C.GlowCyan
    fillGlow.ImageTransparency = 0.6
    fillGlow.ZIndex = 6

    -- Knob
    local knob = Instance.new("Frame", bar)
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(pct, -7, 0.5, -7)
    knob.BackgroundColor3 = C.SliderKnob
    knob.ZIndex = 8
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
    local ks = Instance.new("UIStroke", knob)
    ks.Color = C.SliderFill
    ks.Thickness = 2

    local sbtn = Instance.new("TextButton", bar)
    sbtn.Size = UDim2.new(1, 10, 1, 16)
    sbtn.Position = UDim2.new(0, -5, 0, -8)
    sbtn.BackgroundTransparency = 1
    sbtn.Text = ""
    sbtn.ZIndex = 9

    local dragging = false
    sbtn.MouseButton1Down:Connect(function() dragging = true end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local bp = bar.AbsolutePosition.X
            local bs = bar.AbsoluteSize.X
            local p = math.clamp((input.Position.X - bp) / bs, 0, 1)
            val = math.floor(min + (max - min) * p)
            fill.Size = UDim2.new(p, 0, 1, 0)
            knob.Position = UDim2.new(p, -7, 0.5, -7)
            vlbl.Text = tostring(val)
            pcall(cb, val)
        end
    end)
    return f
end

local function AddDropdown(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Dropdown"
    local items = opts.Options or {}
    local cb = opts.Callback or function() end
    local selected = opts.Default or (items[1] or "Select...")
    local open = false

    local f, s = makeBase(parent, 36, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(0.5, -10, 1, 0)
    lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = C.TextPrimary
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6

    local selLbl = Instance.new("TextLabel", f)
    selLbl.Size = UDim2.new(0.5, -30, 1, 0)
    selLbl.Position = UDim2.new(0.5, 0, 0, 0)
    selLbl.BackgroundTransparency = 1
    selLbl.Text = tostring(selected)
    selLbl.TextColor3 = C.TextAccent
    selLbl.TextSize = 12
    selLbl.Font = Enum.Font.GothamBold
    selLbl.TextXAlignment = Enum.TextXAlignment.Right
    selLbl.ZIndex = 6

    local arrow = Instance.new("TextLabel", f)
    arrow.Size = UDim2.new(0, 16, 1, 0)
    arrow.Position = UDim2.new(1, -22, 0, 0)
    arrow.BackgroundTransparency = 1
    arrow.Text = "▾"
    arrow.TextColor3 = C.TextMuted
    arrow.TextSize = 14
    arrow.Font = Enum.Font.GothamBold
    arrow.ZIndex = 6

    -- Dropdown list container
    local listFrame = Instance.new("Frame", f)
    listFrame.Size = UDim2.new(1, 0, 0, 0)
    listFrame.Position = UDim2.new(0, 0, 1, 4)
    listFrame.BackgroundColor3 = C.BgElevated
    listFrame.ClipsDescendants = true
    listFrame.ZIndex = 20
    Instance.new("UICorner", listFrame).CornerRadius = UDim.new(0, 8)
    local ls = Instance.new("UIStroke", listFrame)
    ls.Color = C.BorderPrimary
    ls.Transparency = 0.3

    local ll = Instance.new("UIListLayout", listFrame)
    ll.Padding = UDim.new(0, 2)
    local lpad = Instance.new("UIPadding", listFrame)
    lpad.PaddingTop = UDim.new(0, 4)
    lpad.PaddingBottom = UDim.new(0, 4)
    lpad.PaddingLeft = UDim.new(0, 4)
    lpad.PaddingRight = UDim.new(0, 4)

    for _, item in ipairs(items) do
        local ib = Instance.new("TextButton", listFrame)
        ib.Size = UDim2.new(1, 0, 0, 28)
        ib.BackgroundColor3 = C.CompBg
        ib.BackgroundTransparency = 0.5
        ib.Text = "  " .. tostring(item)
        ib.TextColor3 = C.TextSecondary
        ib.TextSize = 12
        ib.Font = Enum.Font.GothamMedium
        ib.TextXAlignment = Enum.TextXAlignment.Left
        ib.ZIndex = 21
        Instance.new("UICorner", ib).CornerRadius = UDim.new(0, 6)

        ib.MouseEnter:Connect(function()
            ib.BackgroundTransparency = 0
            ib.BackgroundColor3 = C.TabActive
            ib.TextColor3 = C.TextPrimary
        end)
        ib.MouseLeave:Connect(function()
            ib.BackgroundTransparency = 0.5
            ib.BackgroundColor3 = C.CompBg
            ib.TextColor3 = C.TextSecondary
        end)
        ib.MouseButton1Click:Connect(function()
            selected = item
            selLbl.Text = tostring(item)
            open = false
            tween(listFrame, {Size = UDim2.new(1, 0, 0, 0)}, tweenFast)
            arrow.Text = "▾"
            pcall(cb, item)
        end)
    end

    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.ZIndex = 7

    btn.MouseButton1Click:Connect(function()
        open = not open
        if open then
            local h = #items * 30 + 8
            tween(listFrame, {Size = UDim2.new(1, 0, 0, h)}, tweenFast)
            arrow.Text = "▴"
        else
            tween(listFrame, {Size = UDim2.new(1, 0, 0, 0)}, tweenFast)
            arrow.Text = "▾"
        end
    end)

    hoverEffect(btn, f, s)
    return f
end

local function AddTextbox(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Textbox"
    local placeholder = opts.Placeholder or "Type here..."
    local cb = opts.Callback or function() end

    local f, s = makeBase(parent, 36, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(0, 90, 1, 0)
    lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = C.TextPrimary
    lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6

    local box = Instance.new("TextBox", f)
    box.Size = UDim2.new(1, -115, 0, 24)
    box.Position = UDim2.new(0, 108, 0.5, -12)
    box.BackgroundColor3 = C.BgSecondary
    box.PlaceholderText = placeholder
    box.PlaceholderColor3 = C.TextMuted
    box.Text = ""
    box.TextColor3 = C.TextPrimary
    box.TextSize = 12
    box.Font = Enum.Font.Gotham
    box.ClearTextOnFocus = false
    box.ZIndex = 7
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)
    local bs = Instance.new("UIStroke", box)
    bs.Color = C.CompBorder
    bs.Transparency = 0.5

    box.Focused:Connect(function()
        tween(bs, {Color = C.BorderGlow, Transparency = 0})
    end)
    box.FocusLost:Connect(function(ep)
        tween(bs, {Color = C.CompBorder, Transparency = 0.5})
        if ep then pcall(cb, box.Text) end
    end)

    return f
end

local function AddLabel(parent, opts)
    opts = opts or {}
    local text = opts.Text or "Label"

    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(1, -6, 0, 22)
    lbl.BackgroundTransparency = 1
    lbl.Text = "  " .. text
    lbl.TextColor3 = C.TextMuted
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 6
    return lbl
end

-- ═══════════════════════════════════════════════════════════
-- MAIN WINDOW
-- ═══════════════════════════════════════════════════════════

function OceanLibrary:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Name or "Ocean Hub"
    local iconId = options.Icon or C.IconId

    if CoreGui:FindFirstChild("OceanHubUI") then
        CoreGui:FindFirstChild("OceanHubUI"):Destroy()
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = "OceanHubUI"
    sg.ResetOnSpawn = false
    if gethui then sg.Parent = gethui()
    elseif syn and syn.protect_gui then syn.protect_gui(sg); sg.Parent = CoreGui
    else sg.Parent = CoreGui end

    -- ═══ Main Window ═══
    local wrapper = Instance.new("Frame")
    wrapper.Name = "Wrapper"
    wrapper.Size = UDim2.new(0, 560, 0, 380)
    wrapper.Position = UDim2.new(0.5, -280, 0.5, -190)
    wrapper.BackgroundColor3 = C.BgPrimary
    wrapper.BorderSizePixel = 0
    wrapper.ClipsDescendants = true
    wrapper.Parent = sg

    Instance.new("UICorner", wrapper).CornerRadius = UDim.new(0, 14)
    local ws = Instance.new("UIStroke", wrapper)
    ws.Color = C.BorderPrimary
    ws.Thickness = 1.5
    ws.Transparency = 0.2

    -- Outer glow border
    local outerGlow = Instance.new("ImageLabel", wrapper)
    outerGlow.Size = UDim2.new(1, 40, 1, 40)
    outerGlow.Position = UDim2.new(0, -20, 0, -20)
    outerGlow.BackgroundTransparency = 1
    outerGlow.Image = C.GlowAsset
    outerGlow.ImageColor3 = C.GlowCyan
    outerGlow.ImageTransparency = 0.85
    outerGlow.ZIndex = 0

    addCornerLights(wrapper, UDim2.new(0, 200, 0, 200), 0.04)

    -- ═══ Mini Icon (shown when minimized) ═══
    local miniIcon = Instance.new("Frame")
    miniIcon.Name = "MiniIcon"
    miniIcon.Size = UDim2.new(0, 48, 0, 48)
    miniIcon.Position = UDim2.new(0, 20, 0.5, -24)
    miniIcon.BackgroundColor3 = C.BgElevated
    miniIcon.BorderSizePixel = 0
    miniIcon.Visible = false
    miniIcon.ZIndex = 10
    miniIcon.Parent = sg

    Instance.new("UICorner", miniIcon).CornerRadius = UDim.new(0, 12)
    local mis = Instance.new("UIStroke", miniIcon)
    mis.Color = C.BorderGlow
    mis.Thickness = 2
    mis.Transparency = 0.3

    addCornerLights(miniIcon, UDim2.new(0, 60, 0, 60), 0.05)

    local miniImg = Instance.new("ImageLabel", miniIcon)
    miniImg.Size = UDim2.new(1, -8, 1, -8)
    miniImg.Position = UDim2.new(0, 4, 0, 4)
    miniImg.BackgroundTransparency = 1
    miniImg.Image = iconId
    miniImg.ScaleType = Enum.ScaleType.Fit
    miniImg.ZIndex = 11
    Instance.new("UICorner", miniImg).CornerRadius = UDim.new(0, 10)

    local miniBtn = Instance.new("TextButton", miniIcon)
    miniBtn.Size = UDim2.new(1, 0, 1, 0)
    miniBtn.BackgroundTransparency = 1
    miniBtn.Text = ""
    miniBtn.ZIndex = 12

    -- Mini icon draggable
    local miniDragging, miniDragInput, miniDragStart, miniStartPos
    miniIcon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            miniDragging = true
            miniDragStart = input.Position
            miniStartPos = miniIcon.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then miniDragging = false end
            end)
        end
    end)
    miniIcon.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            miniDragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == miniDragInput and miniDragging then
            local delta = input.Position - miniDragStart
            miniIcon.Position = UDim2.new(miniStartPos.X.Scale, miniStartPos.X.Offset + delta.X, miniStartPos.Y.Scale, miniStartPos.Y.Offset + delta.Y)
        end
    end)

    -- Mini icon pulse animation
    local pulseUp = true
    local pulseConn
    local function startPulse()
        pulseConn = RunService.Heartbeat:Connect(function()
            -- subtle glow pulse on stroke
        end)
    end

    -- Click mini icon to restore
    miniBtn.MouseButton1Click:Connect(function()
        miniIcon.Visible = false
        wrapper.Visible = true
        tween(wrapper, {Size = UDim2.new(0, 560, 0, 380)}, tweenMed)
    end)

    miniBtn.MouseEnter:Connect(function()
        tween(miniIcon, {Size = UDim2.new(0, 52, 0, 52)}, tweenFast)
        tween(mis, {Transparency = 0})
    end)
    miniBtn.MouseLeave:Connect(function()
        tween(miniIcon, {Size = UDim2.new(0, 48, 0, 48)}, tweenFast)
        tween(mis, {Transparency = 0.3})
    end)

    -- ═══ Inner Card ═══
    local card = Instance.new("Frame", wrapper)
    card.Name = "Card"
    card.Size = UDim2.new(1, -16, 1, -16)
    card.Position = UDim2.new(0, 8, 0, 8)
    card.BackgroundColor3 = C.BgSecondary
    card.BackgroundTransparency = 0.15
    card.BorderSizePixel = 0
    card.ZIndex = 2
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)

    -- Draggable
    local dragging, dragInput, dragStart, startPos
    wrapper.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = wrapper.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    wrapper.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            wrapper.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- ═══ Header ═══
    local header = Instance.new("Frame", card)
    header.Size = UDim2.new(1, -24, 0, 44)
    header.Position = UDim2.new(0, 12, 0, 8)
    header.BackgroundTransparency = 1
    header.ZIndex = 3

    -- Logo
    local logo = Instance.new("Frame", header)
    logo.Size = UDim2.new(0, 38, 0, 38)
    logo.BackgroundColor3 = C.TabActive
    logo.BorderSizePixel = 0
    logo.ZIndex = 3
    Instance.new("UICorner", logo).CornerRadius = UDim.new(0, 10)
    local logoS = Instance.new("UIStroke", logo)
    logoS.Color = C.BorderGlow
    logoS.Transparency = 0.5

    addCornerLights(logo, UDim2.new(0, 45, 0, 45), 0.04)

    local logoImg = Instance.new("ImageLabel", logo)
    logoImg.Size = UDim2.new(1, 0, 1, 0)
    logoImg.BackgroundTransparency = 1
    logoImg.Image = iconId
    logoImg.ScaleType = Enum.ScaleType.Fit
    logoImg.ZIndex = 4
    Instance.new("UICorner", logoImg).CornerRadius = UDim.new(0, 10)

    -- Title
    local title = Instance.new("TextLabel", header)
    title.Size = UDim2.new(1, -130, 0, 24)
    title.Position = UDim2.new(0, 46, 0, 7)
    title.BackgroundTransparency = 1
    title.Text = windowTitle
    title.TextColor3 = C.TextPrimary
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 3

    -- Control buttons container
    local controls = Instance.new("Frame", header)
    controls.Size = UDim2.new(0, 62, 0, 26)
    controls.Position = UDim2.new(1, -62, 0, 6)
    controls.BackgroundTransparency = 1
    controls.ZIndex = 3

    -- Minimize button "-"
    local minBtn = Instance.new("TextButton", controls)
    minBtn.Size = UDim2.new(0, 26, 0, 26)
    minBtn.Position = UDim2.new(0, 0, 0, 0)
    minBtn.BackgroundColor3 = C.BtnControlBg
    minBtn.BackgroundTransparency = 0.4
    minBtn.Text = "−"
    minBtn.TextColor3 = C.TextSecondary
    minBtn.TextSize = 16
    minBtn.Font = Enum.Font.GothamBold
    minBtn.ZIndex = 5
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)
    local minS = Instance.new("UIStroke", minBtn)
    minS.Color = C.CompBorder
    minS.Transparency = 0.5

    minBtn.MouseEnter:Connect(function()
        tween(minBtn, {BackgroundColor3 = C.BtnMinHover, BackgroundTransparency = 0.1})
        tween(minBtn, {TextColor3 = C.TextPrimary})
        tween(minS, {Color = C.BorderGlow, Transparency = 0})
    end)
    minBtn.MouseLeave:Connect(function()
        tween(minBtn, {BackgroundColor3 = C.BtnControlBg, BackgroundTransparency = 0.4})
        tween(minBtn, {TextColor3 = C.TextSecondary})
        tween(minS, {Color = C.CompBorder, Transparency = 0.5})
    end)
    minBtn.MouseButton1Click:Connect(function()
        -- Minimize: hide wrapper, show mini icon
        tween(wrapper, {Size = UDim2.new(0, 0, 0, 0)}, tweenMed)
        task.delay(0.35, function()
            wrapper.Visible = false
            miniIcon.Visible = true
            miniIcon.Size = UDim2.new(0, 0, 0, 0)
            tween(miniIcon, {Size = UDim2.new(0, 48, 0, 48)}, tweenMed)
        end)
    end)

    -- Close button "X"
    local closeBtn = Instance.new("TextButton", controls)
    closeBtn.Size = UDim2.new(0, 26, 0, 26)
    closeBtn.Position = UDim2.new(0, 36, 0, 0)
    closeBtn.BackgroundColor3 = C.BtnControlBg
    closeBtn.BackgroundTransparency = 0.4
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = C.TextSecondary
    closeBtn.TextSize = 12
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.ZIndex = 5
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
    local closeS = Instance.new("UIStroke", closeBtn)
    closeS.Color = C.CompBorder
    closeS.Transparency = 0.5

    closeBtn.MouseEnter:Connect(function()
        tween(closeBtn, {BackgroundColor3 = C.BtnCloseHover, BackgroundTransparency = 0.1})
        tween(closeBtn, {TextColor3 = Color3.fromRGB(255, 255, 255)})
        tween(closeS, {Color = Color3.fromRGB(255, 80, 80), Transparency = 0})
    end)
    closeBtn.MouseLeave:Connect(function()
        tween(closeBtn, {BackgroundColor3 = C.BtnControlBg, BackgroundTransparency = 0.4})
        tween(closeBtn, {TextColor3 = C.TextSecondary})
        tween(closeS, {Color = C.CompBorder, Transparency = 0.5})
    end)
    closeBtn.MouseButton1Click:Connect(function()
        sg:Destroy()
    end)

    -- Divider
    local hr = Instance.new("Frame", card)
    hr.Size = UDim2.new(1, -24, 0, 1)
    hr.Position = UDim2.new(0, 12, 0, 56)
    hr.BackgroundColor3 = C.BorderSubtle
    hr.BackgroundTransparency = 0.3
    hr.BorderSizePixel = 0
    hr.ZIndex = 3

    -- ═══ Tab Side Panel ═══
    local tabPanel = Instance.new("Frame", card)
    tabPanel.Size = UDim2.new(0, 125, 1, -68)
    tabPanel.Position = UDim2.new(0, 12, 0, 62)
    tabPanel.BackgroundTransparency = 1
    tabPanel.ZIndex = 3

    local tabLayout = Instance.new("UIListLayout", tabPanel)
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding = UDim.new(0, 4)

    -- ═══ Content Area ═══
    local contentArea = Instance.new("Frame", card)
    contentArea.Size = UDim2.new(1, -150, 1, -68)
    contentArea.Position = UDim2.new(0, 142, 0, 62)
    contentArea.BackgroundTransparency = 1
    contentArea.ZIndex = 3

    -- Tab separator line
    local tabSep = Instance.new("Frame", card)
    tabSep.Size = UDim2.new(0, 1, 1, -72)
    tabSep.Position = UDim2.new(0, 139, 0, 60)
    tabSep.BackgroundColor3 = C.BorderSubtle
    tabSep.BackgroundTransparency = 0.5
    tabSep.BorderSizePixel = 0
    tabSep.ZIndex = 3

    -- ═══ Window Object ═══
    local WinObj = {}
    WinObj.Tabs = {}

    function WinObj:MakeTab(tabOpts)
        tabOpts = tabOpts or {}
        local tabName = tabOpts.Name or "Tab"

        local tabBtn = Instance.new("TextButton", tabPanel)
        tabBtn.Name = tabName .. "_Tab"
        tabBtn.Size = UDim2.new(1, 0, 0, 30)
        tabBtn.BackgroundColor3 = C.TabIdle
        tabBtn.Text = ""
        tabBtn.ZIndex = 4
        Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 7)
        local ts = Instance.new("UIStroke", tabBtn)
        ts.Color = C.TabIdleBorder
        ts.Transparency = 0.4

        -- Active indicator bar
        local indicator = Instance.new("Frame", tabBtn)
        indicator.Size = UDim2.new(0, 3, 0.6, 0)
        indicator.Position = UDim2.new(0, 5, 0.2, 0)
        indicator.BackgroundColor3 = C.GlowCyan
        indicator.BackgroundTransparency = 1
        indicator.ZIndex = 5
        Instance.new("UICorner", indicator).CornerRadius = UDim.new(0, 2)

        local tabLbl = Instance.new("TextLabel", tabBtn)
        tabLbl.Size = UDim2.new(1, -20, 1, 0)
        tabLbl.Position = UDim2.new(0, 14, 0, 0)
        tabLbl.BackgroundTransparency = 1
        tabLbl.Text = tabName
        tabLbl.TextColor3 = C.TabIdleText
        tabLbl.TextSize = 13
        tabLbl.Font = Enum.Font.GothamBold
        tabLbl.TextXAlignment = Enum.TextXAlignment.Left
        tabLbl.ZIndex = 5

        local page = Instance.new("ScrollingFrame", contentArea)
        page.Name = tabName .. "_Page"
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.Visible = false
        page.ScrollBarThickness = 3
        page.ScrollBarImageColor3 = C.BorderGlow
        page.ScrollBarImageTransparency = 0.4
        page.ZIndex = 4

        local pl = Instance.new("UIListLayout", page)
        pl.SortOrder = Enum.SortOrder.LayoutOrder
        pl.Padding = UDim.new(0, 5)

        local pp = Instance.new("UIPadding", page)
        pp.PaddingRight = UDim.new(0, 6)

        pl:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            page.CanvasSize = UDim2.new(0, 0, 0, pl.AbsoluteContentSize.Y + 15)
        end)

        local TabObj = {}
        TabObj.Button = tabBtn
        TabObj.Page = page
        TabObj.Indicator = indicator
        TabObj.Label = tabLbl
        TabObj.Stroke = ts

        function TabObj:AddButton(opts) return AddButton(page, opts) end
        function TabObj:AddToggle(opts) return AddToggle(page, opts) end
        function TabObj:AddSlider(opts) return AddSlider(page, opts) end
        function TabObj:AddDropdown(opts) return AddDropdown(page, opts) end
        function TabObj:AddTextbox(opts) return AddTextbox(page, opts) end
        function TabObj:AddLabel(opts) return AddLabel(page, opts) end

        local function activate()
            for _, t in pairs(WinObj.Tabs) do
                t.Page.Visible = false
                tween(t.Button, {BackgroundColor3 = C.TabIdle})
                tween(t.Stroke, {Color = C.TabIdleBorder, Transparency = 0.4})
                tween(t.Indicator, {BackgroundTransparency = 1})
                tween(t.Label, {TextColor3 = C.TabIdleText})
            end
            page.Visible = true
            tween(tabBtn, {BackgroundColor3 = C.TabActive})
            tween(ts, {Color = C.TabActiveBorder, Transparency = 0})
            tween(indicator, {BackgroundTransparency = 0})
            tween(tabLbl, {TextColor3 = C.TabActiveText})
        end

        tabBtn.MouseButton1Click:Connect(activate)

        -- Hover
        tabBtn.MouseEnter:Connect(function()
            if not page.Visible then
                tween(tabBtn, {BackgroundColor3 = C.CompBgHover})
                tween(ts, {Transparency = 0.2})
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if not page.Visible then
                tween(tabBtn, {BackgroundColor3 = C.TabIdle})
                tween(ts, {Transparency = 0.4})
            end
        end)

        if #WinObj.Tabs == 0 then
            activate()
        end

        table.insert(WinObj.Tabs, TabObj)
        return TabObj
    end

    return WinObj
end

return OceanLibrary
