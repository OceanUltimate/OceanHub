--[[
    OceanHub UI Library v3 - PREMIUM EDITION
    Self-contained. No external dependencies.
    Designed to look 100x better than basic UI libraries.
]]

local OceanLib = {}
OceanLib.__index = OceanLib

local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local Players = game:GetService("Players")

-- ═══════════════════════════════════════════════════
-- COLOR PALETTE - Ocean Blue Theme (Matching Loader)
-- ═══════════════════════════════════════════════════
local P = {
    -- Backgrounds (Ocean Blue depth layers)
    Bg1 = Color3.fromRGB(4, 12, 36),       -- deepest ocean
    Bg2 = Color3.fromRGB(6, 18, 48),       -- main window (matches Loader)
    Bg3 = Color3.fromRGB(8, 28, 65),       -- cards/surface
    Bg4 = Color3.fromRGB(12, 40, 85),      -- hover/elevated
    Bg5 = Color3.fromRGB(16, 52, 100),     -- active

    -- Accent
    Purple = Color3.fromRGB(139, 92, 246),
    PurpleDark = Color3.fromRGB(109, 63, 214),
    PurpleLight = Color3.fromRGB(167, 139, 250),
    Cyan = Color3.fromRGB(56, 189, 248),
    CyanDark = Color3.fromRGB(14, 116, 178),
    CyanBright = Color3.fromRGB(125, 220, 255),
    Blue = Color3.fromRGB(38, 140, 215),       -- matches Loader border
    Green = Color3.fromRGB(52, 211, 153),
    GreenDark = Color3.fromRGB(16, 120, 60),
    Red = Color3.fromRGB(239, 68, 68),
    Yellow = Color3.fromRGB(250, 204, 21),
    Orange = Color3.fromRGB(249, 115, 22),

    -- Text
    White = Color3.fromRGB(248, 250, 252),
    TextPri = Color3.fromRGB(226, 236, 248),
    TextSec = Color3.fromRGB(150, 200, 255),
    TextMut = Color3.fromRGB(90, 140, 200),
    TextDim = Color3.fromRGB(50, 90, 140),

    -- Borders
    Border1 = Color3.fromRGB(18, 50, 100),
    Border2 = Color3.fromRGB(25, 65, 125),
    Border3 = Color3.fromRGB(38, 140, 215),
    BorderGlow = Color3.fromRGB(56, 189, 248),

    -- Glow
    GlowCyan = Color3.fromRGB(56, 189, 248),
    GlowPurple = Color3.fromRGB(129, 92, 248),
    GlowGreen = Color3.fromRGB(52, 211, 153),
    GlowAmber = Color3.fromRGB(251, 191, 36),

    -- Assets
    GlowImg = "rbxassetid://5028857484",
    IconId = "rbxassetid://84718341622420",
}

-- ═══════════════════════════════════════════════════
-- TWEEN SYSTEM
-- ═══════════════════════════════════════════════════
local TI = {
    Snap = TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    Fast = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    Med = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    Slow = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    Bounce = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    Spring = TweenInfo.new(0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
}

local function tw(obj, props, info)
    if obj and obj.Parent then
        TS:Create(obj, info or TI.Fast, props):Play()
    end
end

-- ═══════════════════════════════════════════════════
-- GLOW EFFECTS
-- ═══════════════════════════════════════════════════
local function addGlow(parent, pos, color, size, trans)
    local g = Instance.new("ImageLabel")
    g.Name = "Glow"
    g.Size = size or UDim2.new(0, 200, 0, 200)
    g.Position = pos
    g.BackgroundTransparency = 1
    g.Image = P.GlowImg
    g.ImageColor3 = color
    g.ImageTransparency = trans or 0.04
    g.ZIndex = 1
    g.Parent = parent
    return g
end

-- Corner lights: dibuat 2 layer (besar + kecil) biar sudut lebih "nyala"
-- tapi tetap sesuai tema Ocean (cyan/purple/green/amber).
-- Backward compatible:
--   addCornerGlows(parent, UDim2, transparency)
-- Advanced:
--   addCornerGlows(parent, { size=UDim2, smallSize=UDim2, transparency=0.03, smallTransparency=0.12 })
local function addCornerGlows(parent, sz, tr)
    local cfg = nil
    if type(sz) == "table" then
        cfg = sz
    else
        cfg = { size = sz, transparency = tr }
    end

    local big = cfg.size or UDim2.new(0, 260, 0, 260)
    local bigTr = cfg.transparency or 0.02

    local small = cfg.smallSize or UDim2.new(0, 140, 0, 140)
    local smallTr = cfg.smallTransparency or 0.08

    -- offset supaya glow menyebar indah di 4 sudut
    local offsetBig = math.floor(big.X.Offset * 0.35)
    local offsetSmall = math.floor(small.X.Offset * 0.40)

    -- Folder container for corner glow so toggle can easily reference
    local glowFolder = Instance.new("Folder")
    glowFolder.Name = "SuperThickCornerGlow"
    glowFolder.Parent = parent

    -- BIG layer (spread glow)
    local b1 = addGlow(glowFolder, UDim2.new(0, -offsetBig, 0, -offsetBig), P.GlowCyan, big, bigTr)
    local b2 = addGlow(glowFolder, UDim2.new(1, -big.X.Offset + offsetBig, 0, -offsetBig), P.GlowPurple, big, bigTr)
    local b3 = addGlow(glowFolder, UDim2.new(0, -offsetBig, 1, -big.Y.Offset + offsetBig), P.GlowGreen, big, bigTr)
    local b4 = addGlow(glowFolder, UDim2.new(1, -big.X.Offset + offsetBig, 1, -big.Y.Offset + offsetBig), P.GlowAmber, big, bigTr)

    -- SMALL layer (intense corner light)
    local s1 = addGlow(glowFolder, UDim2.new(0, -offsetSmall, 0, -offsetSmall), P.GlowCyan, small, smallTr)
    local s2 = addGlow(glowFolder, UDim2.new(1, -small.X.Offset + offsetSmall, 0, -offsetSmall), P.GlowPurple, small, smallTr)
    local s3 = addGlow(glowFolder, UDim2.new(0, -offsetSmall, 1, -small.Y.Offset + offsetSmall), P.GlowGreen, small, smallTr)
    local s4 = addGlow(glowFolder, UDim2.new(1, -small.X.Offset + offsetSmall, 1, -small.Y.Offset + offsetSmall), P.GlowAmber, small, smallTr)

    s1.ZIndex = 2; s2.ZIndex = 2; s3.ZIndex = 2; s4.ZIndex = 2
end

local function addTopGlow(parent)
    local g = Instance.new("ImageLabel")
    g.Size = UDim2.new(1, 100, 0, 120)
    g.Position = UDim2.new(0, -50, 0, -40)
    g.BackgroundTransparency = 1
    g.Image = P.GlowImg
    g.ImageColor3 = P.Cyan
    g.ImageTransparency = 0.88
    g.ZIndex = 1
    g.Parent = parent
end

-- ═══════════════════════════════════════════════════
-- UTILITY: MAKE DRAGGABLE
-- ═══════════════════════════════════════════════════
local function makeDraggable(frame)
    local dragging, dragInput, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local d = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

-- ═══════════════════════════════════════════════════
-- NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════
function OceanLib:Notify(opts)
    opts = opts or {}
    local title = opts.Title or "OceanHub"
    local content = opts.Content or ""
    local duration = opts.Duration or 5

    local sg = CoreGui:FindFirstChild("OceanNotif")
    if not sg then
        sg = Instance.new("ScreenGui"); sg.Name = "OceanNotif"; sg.ResetOnSpawn = false
        if gethui then sg.Parent = gethui()
        elseif syn and syn.protect_gui then syn.protect_gui(sg); sg.Parent = CoreGui
        else sg.Parent = CoreGui end
    end

    local holder = sg:FindFirstChild("H")
    if not holder then
        holder = Instance.new("Frame"); holder.Name = "H"
        holder.Size = UDim2.new(0, 310, 1, -20)
        holder.Position = UDim2.new(1, -320, 0, 10)
        holder.BackgroundTransparency = 1; holder.Parent = sg
        local ll = Instance.new("UIListLayout", holder)
        ll.SortOrder = Enum.SortOrder.LayoutOrder
        ll.VerticalAlignment = Enum.VerticalAlignment.Bottom
        ll.Padding = UDim.new(0, 8)
    end

    local nf = Instance.new("Frame")
    nf.Size = UDim2.new(1, 0, 0, 0)
    nf.BackgroundColor3 = P.Bg3; nf.BorderSizePixel = 0
    nf.ClipsDescendants = true; nf.Parent = holder
    Instance.new("UICorner", nf).CornerRadius = UDim.new(0, 12)
    local ns = Instance.new("UIStroke", nf); ns.Color = P.Border2; ns.Transparency = 0.3

    -- Left accent
    local acc = Instance.new("Frame", nf)
    acc.Size = UDim2.new(0, 3, 1, -16); acc.Position = UDim2.new(0, 10, 0, 8)
    acc.BackgroundColor3 = P.Cyan; acc.ZIndex = 6
    Instance.new("UICorner", acc).CornerRadius = UDim.new(0, 2)

    -- Accent glow
    addGlow(nf, UDim2.new(0, -30, 0, -20), P.GlowCyan, UDim2.new(0, 80, 0, 80), 0.5)

    local tl = Instance.new("TextLabel", nf)
    tl.Size = UDim2.new(1, -35, 0, 16); tl.Position = UDim2.new(0, 22, 0, 12)
    tl.BackgroundTransparency = 1; tl.Text = title
    tl.TextColor3 = P.White; tl.TextSize = 13; tl.Font = Enum.Font.GothamBold
    tl.TextXAlignment = Enum.TextXAlignment.Left; tl.ZIndex = 6

    local cl = Instance.new("TextLabel", nf)
    cl.Size = UDim2.new(1, -35, 0, 30); cl.Position = UDim2.new(0, 22, 0, 30)
    cl.BackgroundTransparency = 1; cl.Text = content
    cl.TextColor3 = P.TextSec; cl.TextSize = 11; cl.Font = Enum.Font.Gotham
    cl.TextXAlignment = Enum.TextXAlignment.Left; cl.TextWrapped = true; cl.ZIndex = 6

    tw(nf, {Size = UDim2.new(1, 0, 0, 68)}, TI.Bounce)
    tw(ns, {Color = P.Cyan, Transparency = 0}, TI.Slow)
    task.delay(0.8, function() tw(ns, {Color = P.Border2, Transparency = 0.3}, TI.Slow) end)

    task.delay(duration, function()
        if nf and nf.Parent then
            tw(nf, {Size = UDim2.new(1, 0, 0, 0)}, TI.Med)
            task.wait(0.35); if nf and nf.Parent then nf:Destroy() end
        end
    end)
end

-- ═══════════════════════════════════════════════════
-- COMPONENTS
-- ═══════════════════════════════════════════════════

local function makeComp(parent, h, name)
    local f = Instance.new("Frame")
    f.Name = name or "C"; f.Size = UDim2.new(1, -4, 0, h or 38)
    f.BackgroundColor3 = P.Bg3; f.BorderSizePixel = 0; f.ZIndex = 5
    f.ClipsDescendants = true; f.Parent = parent
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
    local s = Instance.new("UIStroke", f); s.Color = P.Border1; s.Transparency = 0.2

    -- Subtle inner top highlight
    local hl = Instance.new("Frame", f)
    hl.Size = UDim2.new(1, -2, 0, 1); hl.Position = UDim2.new(0, 1, 0, 0)
    hl.BackgroundColor3 = P.Border2; hl.BackgroundTransparency = 0.6
    hl.BorderSizePixel = 0; hl.ZIndex = 6
    return f, s
end

-- ──────── BUTTON ────────
local function AddButton(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Button"
    local cb = opts.Callback or function() end

    local f, s = makeComp(parent, 38, name)

    -- Hover highlight overlay
    local hover = Instance.new("Frame", f)
    hover.Size = UDim2.new(1, 0, 1, 0); hover.BackgroundColor3 = P.Cyan
    hover.BackgroundTransparency = 1; hover.ZIndex = 5
    Instance.new("UICorner", hover).CornerRadius = UDim.new(0, 10)

    -- Click ripple
    local ripple = Instance.new("Frame", f)
    ripple.Size = UDim2.new(0, 0, 0, 0); ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.BackgroundColor3 = P.Cyan; ripple.BackgroundTransparency = 0.7
    ripple.ZIndex = 6
    Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)

    local dot = Instance.new("Frame", f)
    dot.Size = UDim2.new(0, 5, 0, 5); dot.Position = UDim2.new(0, 14, 0.5, -2.5)
    dot.BackgroundColor3 = P.Cyan; dot.ZIndex = 7
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    -- Dot glow
    addGlow(dot, UDim2.new(0.5, -12, 0.5, -12), P.GlowCyan, UDim2.new(0, 24, 0, 24), 0.5)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -50, 1, 0); lbl.Position = UDim2.new(0, 28, 0, 0)
    lbl.BackgroundTransparency = 1; lbl.Text = name
    lbl.TextColor3 = P.TextPri; lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 7

    local arrow = Instance.new("TextLabel", f)
    arrow.Size = UDim2.new(0, 20, 1, 0); arrow.Position = UDim2.new(1, -30, 0, 0)
    arrow.BackgroundTransparency = 1; arrow.Text = "→"
    arrow.TextColor3 = P.TextDim; arrow.TextSize = 14; arrow.Font = Enum.Font.GothamBold; arrow.ZIndex = 7

    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(1, 0, 1, 0); btn.BackgroundTransparency = 1
    btn.Text = ""; btn.ZIndex = 8

    btn.MouseEnter:Connect(function()
        tw(hover, {BackgroundTransparency = 0.88})
        tw(s, {Color = P.Border3})
        tw(arrow, {TextColor3 = P.Cyan})
        tw(lbl, {TextColor3 = P.White})
    end)
    btn.MouseLeave:Connect(function()
        tw(hover, {BackgroundTransparency = 1})
        tw(s, {Color = P.Border1})
        tw(arrow, {TextColor3 = P.TextDim})
        tw(lbl, {TextColor3 = P.TextPri})
    end)
    btn.MouseButton1Click:Connect(function()
        -- Ripple effect
        ripple.Size = UDim2.new(0, 0, 0, 0); ripple.BackgroundTransparency = 0.6
        tw(ripple, {Size = UDim2.new(2, 0, 2, 0), BackgroundTransparency = 1}, TI.Med)
        tw(dot, {BackgroundColor3 = P.White}, TI.Snap)
        task.delay(0.15, function() tw(dot, {BackgroundColor3 = P.Cyan}, TI.Fast) end)
        pcall(cb)
    end)
    return f
end

-- ──────── TOGGLE ────────
local function AddToggle(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Toggle"
    local default = opts.Default or false
    local cb = opts.Callback or function() end
    local state = default
    local hasBind = opts.Keybind ~= nil
    local currentBind = type(opts.Keybind) == "string" and opts.Keybind or nil
    local bindCb = opts.BindCallback or function() end

    local f, s = makeComp(parent, 38, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -120, 1, 0); lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1; lbl.Text = name
    lbl.TextColor3 = P.TextPri; lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 7

    -- Status text
    local statusLbl = Instance.new("TextLabel", f)
    statusLbl.Size = UDim2.new(0, 30, 0, 14)
    statusLbl.Position = UDim2.new(1, -100, 0.5, -7)
    statusLbl.BackgroundTransparency = 1
    statusLbl.Text = state and "ON" or "OFF"
    statusLbl.TextColor3 = state and P.Green or P.TextDim
    statusLbl.TextSize = 10; statusLbl.Font = Enum.Font.GothamBold; statusLbl.ZIndex = 7

    -- Toggle track
    local track = Instance.new("Frame", f)
    track.Size = UDim2.new(0, 44, 0, 24)
    track.Position = UDim2.new(1, -58, 0.5, -12)
    track.BackgroundColor3 = state and P.GreenDark or P.Bg1
    track.ZIndex = 6
    Instance.new("UICorner", track).CornerRadius = UDim.new(0, 12)
    local ts2 = Instance.new("UIStroke", track)
    ts2.Color = state and P.Green or P.Border1; ts2.Thickness = 1.5

    -- Track inner glow when ON
    local trackGlow = Instance.new("Frame", track)
    trackGlow.Size = UDim2.new(1, -4, 1, -4); trackGlow.Position = UDim2.new(0, 2, 0, 2)
    trackGlow.BackgroundColor3 = P.Green; trackGlow.BackgroundTransparency = state and 0.6 or 1
    trackGlow.ZIndex = 6
    Instance.new("UICorner", trackGlow).CornerRadius = UDim.new(0, 10)

    -- Knob
    local knob = Instance.new("Frame", track)
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
    knob.BackgroundColor3 = state and P.White or P.TextMut
    knob.ZIndex = 8
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    -- Knob shadow
    local knobShadow = Instance.new("ImageLabel", knob)
    knobShadow.Size = UDim2.new(1, 8, 1, 8); knobShadow.Position = UDim2.new(0, -4, 0, -4)
    knobShadow.BackgroundTransparency = 1; knobShadow.Image = P.GlowImg
    knobShadow.ImageColor3 = state and P.Green or P.Bg1
    knobShadow.ImageTransparency = state and 0.4 or 0.9; knobShadow.ZIndex = 7

    -- Checkmark inside knob
    local check = Instance.new("TextLabel", knob)
    check.Size = UDim2.new(1, 0, 1, 0); check.BackgroundTransparency = 1
    check.Text = state and "✓" or ""
    check.TextColor3 = P.GreenDark; check.TextSize = 11
    check.Font = Enum.Font.GothamBold; check.ZIndex = 9

    -- Keybind Button (Left of Toggle)
    local bindBtn
    local binding = false
    if hasBind then
        local bindFrame = Instance.new("Frame", f)
        bindFrame.Size = UDim2.new(0, 60, 0, 24)
        bindFrame.Position = UDim2.new(1, -125, 0.5, -12)
        bindFrame.BackgroundColor3 = P.Bg1; bindFrame.ZIndex = 7
        Instance.new("UICorner", bindFrame).CornerRadius = UDim.new(0, 6)
        local bfs = Instance.new("UIStroke", bindFrame); bfs.Color = P.Border1

        bindBtn = Instance.new("TextButton", bindFrame)
        bindBtn.Size = UDim2.new(1, 0, 1, 0); bindBtn.BackgroundTransparency = 1
        bindBtn.Text = currentBind and currentBind or "Bind"
        bindBtn.TextColor3 = P.TextMut; bindBtn.TextSize = 10
        bindBtn.Font = Enum.Font.GothamBold; bindBtn.ZIndex = 8

        bindBtn.MouseButton1Click:Connect(function()
            if binding then return end
            binding = true
            bindBtn.Text = "..."
            bindBtn.TextColor3 = P.Cyan
            bfs.Color = P.Cyan
        end)
        
        bindBtn.MouseButton2Click:Connect(function() -- Clear bind on right click
            currentBind = nil
            bindBtn.Text = "Bind"
            bindBtn.TextColor3 = P.TextMut
            bfs.Color = P.Border1
            binding = false
            pcall(bindCb, nil)
        end)

        UIS.InputBegan:Connect(function(input)
            if binding then
                if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode ~= Enum.KeyCode.Unknown then
                    currentBind = input.KeyCode.Name
                elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
                    currentBind = "MB1"
                elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                    currentBind = "MB2"
                elseif input.UserInputType == Enum.UserInputType.MouseButton3 then
                    currentBind = "MB3"
                elseif input.UserInputType == Enum.UserInputType.MouseButton4 then
                    currentBind = "MB4"
                elseif input.UserInputType == Enum.UserInputType.MouseButton5 then
                    currentBind = "MB5"
                else
                    return
                end
                
                binding = false
                bindBtn.Text = currentBind
                bindBtn.TextColor3 = P.TextPri
                bfs.Color = P.Border1
                pcall(bindCb, currentBind)
            else
                if currentBind then
                    local pressed = false
                    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name == currentBind then
                        pressed = true
                    elseif input.UserInputType == Enum.UserInputType.MouseButton1 and currentBind == "MB1" then
                        pressed = true
                    elseif input.UserInputType == Enum.UserInputType.MouseButton2 and currentBind == "MB2" then
                        pressed = true
                    elseif input.UserInputType == Enum.UserInputType.MouseButton3 and currentBind == "MB3" then
                        pressed = true
                    elseif input.UserInputType == Enum.UserInputType.MouseButton4 and currentBind == "MB4" then
                        pressed = true
                    elseif input.UserInputType == Enum.UserInputType.MouseButton5 and currentBind == "MB5" then
                        pressed = true
                    end
                    
                    if pressed then
                        state = not state
                        updateToggle()
                        pcall(cb, state)
                    end
                end
            end
        end)
    end

    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(1, -130, 1, 0); btn.BackgroundTransparency = 1
    btn.Text = ""; btn.ZIndex = 10

    local function updateToggle()
        tw(track, {BackgroundColor3 = state and P.GreenDark or P.Bg1}, TI.Med)
        tw(ts2, {Color = state and P.Green or P.Border1}, TI.Med)
        tw(trackGlow, {BackgroundTransparency = state and 0.6 or 1}, TI.Med)
        tw(knob, {
            Position = state and UDim2.new(1, -21, 0.5, -9) or UDim2.new(0, 3, 0.5, -9),
            BackgroundColor3 = state and P.White or P.TextMut,
        }, TI.Bounce)
        tw(knobShadow, {
            ImageColor3 = state and P.Green or P.Bg1,
            ImageTransparency = state and 0.4 or 0.9,
        }, TI.Med)
        check.Text = state and "✓" or ""
        statusLbl.Text = state and "ON" or "OFF"
        tw(statusLbl, {TextColor3 = state and P.Green or P.TextDim}, TI.Fast)
    end

    btn.MouseEnter:Connect(function()
        tw(s, {Color = P.Border2}); tw(lbl, {TextColor3 = P.White})
    end)
    btn.MouseLeave:Connect(function()
        tw(s, {Color = P.Border1}); tw(lbl, {TextColor3 = P.TextPri})
    end)
    btn.MouseButton1Click:Connect(function()
        state = not state; updateToggle(); pcall(cb, state)
    end)
    
    -- Expose updateToggle so we can trigger it externally if needed, and make it part of the returned object
    -- But currently OceanLibrary returns just `f`, so let's stick to that.
    -- Wait, btn covers the toggle. We need to make sure `btn` doesn't cover the keybind button.
    -- `btn.Size = UDim2.new(1, -130, 1, 0)` is good. Also let's make sure the actual toggle track has a button.
    local trackBtn = Instance.new("TextButton", track)
    trackBtn.Size = UDim2.new(1,0,1,0); trackBtn.BackgroundTransparency = 1; trackBtn.Text = ""; trackBtn.ZIndex = 10
    trackBtn.MouseButton1Click:Connect(function()
        state = not state; updateToggle(); pcall(cb, state)
    end)

    return f
end

-- ──────── SLIDER ────────
local function AddSlider(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Slider"
    local min = opts.Min or 0
    local max = opts.Max or 100
    local default = opts.Default or min
    local cb = opts.Callback or function() end
    local val = math.clamp(default, min, max)

    local f, s = makeComp(parent, 56, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(1, -80, 0, 18); lbl.Position = UDim2.new(0, 14, 0, 6)
    lbl.BackgroundTransparency = 1; lbl.Text = name
    lbl.TextColor3 = P.TextPri; lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 7

    -- Value badge
    local valBadge = Instance.new("Frame", f)
    valBadge.Size = UDim2.new(0, 42, 0, 20)
    valBadge.Position = UDim2.new(1, -54, 0, 5)
    valBadge.BackgroundColor3 = P.Bg1; valBadge.ZIndex = 7
    Instance.new("UICorner", valBadge).CornerRadius = UDim.new(0, 6)
    local vbs = Instance.new("UIStroke", valBadge); vbs.Color = P.Border1; vbs.Transparency = 0.5

    local vlbl = Instance.new("TextLabel", valBadge)
    vlbl.Size = UDim2.new(1, 0, 1, 0); vlbl.BackgroundTransparency = 1
    vlbl.Text = tostring(val); vlbl.TextColor3 = P.CyanBright
    vlbl.TextSize = 12; vlbl.Font = Enum.Font.GothamBold; vlbl.ZIndex = 8

    -- Track
    local bar = Instance.new("Frame", f)
    bar.Size = UDim2.new(1, -28, 0, 8)
    bar.Position = UDim2.new(0, 14, 0, 36)
    bar.BackgroundColor3 = P.Bg1; bar.ZIndex = 6
    Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 4)

    -- Track border
    local barS = Instance.new("UIStroke", bar); barS.Color = P.Border1; barS.Transparency = 0.6

    local pct = math.clamp((val - min) / (max - min), 0, 1)

    -- Fill gradient (cyan)
    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new(pct, 0, 1, 0)
    fill.BackgroundColor3 = P.Cyan; fill.ZIndex = 7
    Instance.new("UICorner", fill).CornerRadius = UDim.new(0, 4)

    -- Fill inner glow
    local fillGlow = Instance.new("Frame", fill)
    fillGlow.Size = UDim2.new(1, 0, 1, 0)
    fillGlow.BackgroundColor3 = P.CyanBright; fillGlow.BackgroundTransparency = 0.7
    fillGlow.ZIndex = 7
    Instance.new("UICorner", fillGlow).CornerRadius = UDim.new(0, 4)

    -- Glow at end of fill
    local endGlow = addGlow(fill, UDim2.new(1, -18, 0.5, -18), P.GlowCyan, UDim2.new(0, 36, 0, 36), 0.4)
    endGlow.ZIndex = 7

    -- Knob
    local knob = Instance.new("Frame", bar)
    knob.Size = UDim2.new(0, 16, 0, 16)
    knob.Position = UDim2.new(pct, -8, 0.5, -8)
    knob.BackgroundColor3 = P.White; knob.ZIndex = 9
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)
    local ks = Instance.new("UIStroke", knob); ks.Color = P.Cyan; ks.Thickness = 2

    -- Knob inner dot
    local knobDot = Instance.new("Frame", knob)
    knobDot.Size = UDim2.new(0, 6, 0, 6)
    knobDot.Position = UDim2.new(0.5, -3, 0.5, -3)
    knobDot.BackgroundColor3 = P.Cyan; knobDot.ZIndex = 10
    Instance.new("UICorner", knobDot).CornerRadius = UDim.new(1, 0)

    local sbtn = Instance.new("TextButton", bar)
    sbtn.Size = UDim2.new(1, 14, 1, 20)
    sbtn.Position = UDim2.new(0, -7, 0, -10)
    sbtn.BackgroundTransparency = 1; sbtn.Text = ""; sbtn.ZIndex = 11

    local dragging = false
    sbtn.MouseButton1Down:Connect(function() dragging = true end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            tw(knob, {Size = UDim2.new(0, 16, 0, 16)}, TI.Bounce)
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local bp = bar.AbsolutePosition.X
            local bs = bar.AbsoluteSize.X
            local p = math.clamp((input.Position.X - bp) / bs, 0, 1)
            val = math.floor(min + (max - min) * p)
            fill.Size = UDim2.new(p, 0, 1, 0)
            knob.Position = UDim2.new(p, -8, 0.5, -8)
            vlbl.Text = tostring(val)
            pcall(cb, val)
        end
    end)

    sbtn.MouseEnter:Connect(function()
        tw(s, {Color = P.Border2})
        tw(knob, {Size = UDim2.new(0, 18, 0, 18)}, TI.Fast)
    end)
    sbtn.MouseLeave:Connect(function()
        if not dragging then
            tw(s, {Color = P.Border1})
            tw(knob, {Size = UDim2.new(0, 16, 0, 16)}, TI.Fast)
        end
    end)
    return f
end

-- ──────── DROPDOWN ────────
local function AddDropdown(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Dropdown"
    local items = opts.Options or {}
    local cb = opts.Callback or function() end
    local selected = opts.Default or (items[1] or "Select...")
    local open = false

    local f, s = makeComp(parent, 38, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(0.5, -10, 1, 0); lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1; lbl.Text = name
    lbl.TextColor3 = P.TextPri; lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 7

    local selLbl = Instance.new("TextLabel", f)
    selLbl.Size = UDim2.new(0.5, -35, 1, 0); selLbl.Position = UDim2.new(0.5, 0, 0, 0)
    selLbl.BackgroundTransparency = 1; selLbl.Text = tostring(selected)
    selLbl.TextColor3 = P.CyanBright; selLbl.TextSize = 12
    selLbl.Font = Enum.Font.GothamBold; selLbl.TextXAlignment = Enum.TextXAlignment.Right; selLbl.ZIndex = 7

    local arrow = Instance.new("TextLabel", f)
    arrow.Size = UDim2.new(0, 16, 1, 0); arrow.Position = UDim2.new(1, -24, 0, 0)
    arrow.BackgroundTransparency = 1; arrow.Text = "▾"
    arrow.TextColor3 = P.TextMut; arrow.TextSize = 14; arrow.Font = Enum.Font.GothamBold; arrow.ZIndex = 7

    local listF = Instance.new("Frame", f)
    listF.Size = UDim2.new(1, 0, 0, 0); listF.Position = UDim2.new(0, 0, 1, 4)
    listF.BackgroundColor3 = P.Bg4; listF.ClipsDescendants = true; listF.ZIndex = 30
    Instance.new("UICorner", listF).CornerRadius = UDim.new(0, 10)
    local ls = Instance.new("UIStroke", listF); ls.Color = P.Border2; ls.Transparency = 0.2
    local ll = Instance.new("UIListLayout", listF); ll.Padding = UDim.new(0, 2)
    local lp = Instance.new("UIPadding", listF)
    lp.PaddingTop = UDim.new(0, 5); lp.PaddingBottom = UDim.new(0, 5)
    lp.PaddingLeft = UDim.new(0, 5); lp.PaddingRight = UDim.new(0, 5)

    for _, item in ipairs(items) do
        local ib = Instance.new("TextButton", listF)
        ib.Size = UDim2.new(1, 0, 0, 30); ib.BackgroundColor3 = P.Bg3
        ib.BackgroundTransparency = 0.3; ib.Text = "  " .. tostring(item)
        ib.TextColor3 = P.TextSec; ib.TextSize = 12
        ib.Font = Enum.Font.GothamMedium; ib.TextXAlignment = Enum.TextXAlignment.Left; ib.ZIndex = 31
        Instance.new("UICorner", ib).CornerRadius = UDim.new(0, 7)
        ib.MouseEnter:Connect(function()
            tw(ib, {BackgroundColor3 = P.CyanDark, BackgroundTransparency = 0, TextColor3 = P.White})
        end)
        ib.MouseLeave:Connect(function()
            tw(ib, {BackgroundColor3 = P.Bg3, BackgroundTransparency = 0.3, TextColor3 = P.TextSec})
        end)
        ib.MouseButton1Click:Connect(function()
            selected = item; selLbl.Text = tostring(item); open = false
            tw(listF, {Size = UDim2.new(1, 0, 0, 0)}, TI.Fast); arrow.Text = "▾"
            pcall(cb, item)
        end)
    end

    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(1, 0, 1, 0); btn.BackgroundTransparency = 1
    btn.Text = ""; btn.ZIndex = 8

    btn.MouseButton1Click:Connect(function()
        open = not open
        if open then
            tw(listF, {Size = UDim2.new(1, 0, 0, #items * 32 + 10)}, TI.Bounce); arrow.Text = "▴"
        else
            tw(listF, {Size = UDim2.new(1, 0, 0, 0)}, TI.Fast); arrow.Text = "▾"
        end
    end)

    btn.MouseEnter:Connect(function() tw(s, {Color = P.Border2}) end)
    btn.MouseLeave:Connect(function() tw(s, {Color = P.Border1}) end)
    return f
end

-- ──────── TEXTBOX ────────
local function AddTextbox(parent, opts)
    opts = opts or {}
    local name = opts.Name or "Textbox"
    local placeholder = opts.Placeholder or "Type here..."
    local cb = opts.Callback or function() end

    local f, s = makeComp(parent, 38, name)

    local lbl = Instance.new("TextLabel", f)
    lbl.Size = UDim2.new(0, 85, 1, 0); lbl.Position = UDim2.new(0, 14, 0, 0)
    lbl.BackgroundTransparency = 1; lbl.Text = name
    lbl.TextColor3 = P.TextPri; lbl.TextSize = 13
    lbl.Font = Enum.Font.GothamMedium; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 7

    local boxWrap = Instance.new("Frame", f)
    boxWrap.Size = UDim2.new(1, -110, 0, 26)
    boxWrap.Position = UDim2.new(0, 102, 0.5, -13)
    boxWrap.BackgroundColor3 = P.Bg1; boxWrap.ZIndex = 7
    Instance.new("UICorner", boxWrap).CornerRadius = UDim.new(0, 7)
    local bws = Instance.new("UIStroke", boxWrap); bws.Color = P.Border1; bws.Transparency = 0.4

    local box = Instance.new("TextBox", boxWrap)
    box.Size = UDim2.new(1, -14, 1, 0); box.Position = UDim2.new(0, 7, 0, 0)
    box.BackgroundTransparency = 1; box.PlaceholderText = placeholder
    box.PlaceholderColor3 = P.TextDim; box.Text = ""
    box.TextColor3 = P.White; box.TextSize = 12
    box.Font = Enum.Font.Gotham; box.ClearTextOnFocus = false; box.ZIndex = 8

    box.Focused:Connect(function()
        tw(bws, {Color = P.Cyan, Transparency = 0}, TI.Fast)
        tw(boxWrap, {BackgroundColor3 = P.Bg4}, TI.Fast)
    end)
    box.FocusLost:Connect(function(ep)
        tw(bws, {Color = P.Border1, Transparency = 0.4}, TI.Fast)
        tw(boxWrap, {BackgroundColor3 = P.Bg1}, TI.Fast)
        if ep then pcall(cb, box.Text) end
    end)
    return f
end

-- ──────── LABEL / PLAIN TEXT ────────
local function AddLabel(parent, opts)
    opts = opts or {}
    local text = opts.Text or "Section"

    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(1, -4, 0, 22)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.TextColor3 = P.TextSec; lbl.TextSize = 12
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.ZIndex = 6
    local pad = Instance.new("UIPadding", lbl)
    pad.PaddingLeft = UDim.new(0, 8)
    return lbl
end

-- ──────── BANNER CARD ────────
local function AddBanner(parent, opts)
    opts = opts or {}
    local text = opts.Text or "Welcome to OceanHub!"
    local iconText = opts.Icon or "✦"

    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1, -4, 0, 48)
    f.BackgroundColor3 = P.Bg3; f.BorderSizePixel = 0; f.ZIndex = 5
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)

    local s = Instance.new("UIStroke", f)
    s.Color = P.Purple; s.Transparency = 0.4; s.Thickness = 1

    -- Inner background gradient accent
    local bgGlow = Instance.new("Frame", f)
    bgGlow.Size = UDim2.new(1, 0, 1, 0); bgGlow.BackgroundColor3 = P.Purple
    bgGlow.BackgroundTransparency = 0.92; bgGlow.ZIndex = 5
    Instance.new("UICorner", bgGlow).CornerRadius = UDim.new(0, 10)

    local iconLbl = Instance.new("TextLabel", f)
    iconLbl.Size = UDim2.new(0, 24, 0, 24); iconLbl.Position = UDim2.new(0, 10, 0.5, -12)
    iconLbl.BackgroundTransparency = 1; iconLbl.Text = iconText
    iconLbl.TextColor3 = P.Purple; iconLbl.TextSize = 16
    iconLbl.Font = Enum.Font.GothamBold; iconLbl.ZIndex = 6

    local txtLbl = Instance.new("TextLabel", f)
    txtLbl.Size = UDim2.new(1, -44, 1, -8); txtLbl.Position = UDim2.new(0, 36, 0, 4)
    txtLbl.BackgroundTransparency = 1; txtLbl.Text = text
    txtLbl.TextColor3 = P.TextPri; txtLbl.TextSize = 11; txtLbl.TextWrapped = true
    txtLbl.Font = Enum.Font.GothamMedium; txtLbl.TextXAlignment = Enum.TextXAlignment.Left; txtLbl.ZIndex = 6

    return f
end

-- ──────── KEY-VALUE ROW ────────
local function AddKeyVal(parent, opts)
    opts = opts or {}
    local key = opts.Key or "Key"
    local val = opts.Value or "Value"
    local valColor = opts.Color or P.Purple

    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1, -4, 0, 28)
    f.BackgroundTransparency = 1; f.ZIndex = 5

    local kLbl = Instance.new("TextLabel", f)
    kLbl.Size = UDim2.new(0.5, -10, 1, 0); kLbl.Position = UDim2.new(0, 8, 0, 0)
    kLbl.BackgroundTransparency = 1; kLbl.Text = key
    kLbl.TextColor3 = P.TextSec; kLbl.TextSize = 12
    kLbl.Font = Enum.Font.Gotham; kLbl.TextXAlignment = Enum.TextXAlignment.Left; kLbl.ZIndex = 6

    local vLbl = Instance.new("TextLabel", f)
    vLbl.Size = UDim2.new(0.5, -10, 1, 0); vLbl.Position = UDim2.new(0.5, 0, 0, 0)
    vLbl.BackgroundTransparency = 1; vLbl.Text = val
    vLbl.TextColor3 = valColor; vLbl.TextSize = 12
    vLbl.Font = Enum.Font.GothamBold; vLbl.TextXAlignment = Enum.TextXAlignment.Right; vLbl.ZIndex = 6

    return f
end

-- ──────── CARD CONTAINER ────────
local function AddCard(parent, opts)
    opts = opts or {}
    local title = opts.Title or "Section"
    local iconText = opts.Icon or "⬡"

    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(1, -4, 0, 40)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = P.Bg3; card.BorderSizePixel = 0; card.ZIndex = 5
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 12)

    local s = Instance.new("UIStroke", card)
    s.Color = P.Border2; s.Transparency = 0.3; s.Thickness = 1.5

    -- Header bar
    local header = Instance.new("Frame", card)
    header.Size = UDim2.new(1, 0, 0, 36)
    header.BackgroundTransparency = 1; header.ZIndex = 6

    local iconLbl = Instance.new("TextLabel", header)
    iconLbl.Size = UDim2.new(0, 20, 1, 0); iconLbl.Position = UDim2.new(0, 12, 0, 0)
    iconLbl.BackgroundTransparency = 1; iconLbl.Text = iconText
    iconLbl.TextColor3 = P.Cyan; iconLbl.TextSize = 13
    iconLbl.Font = Enum.Font.GothamBold; iconLbl.ZIndex = 7

    local titleLbl = Instance.new("TextLabel", header)
    titleLbl.Size = UDim2.new(1, -70, 1, 0); titleLbl.Position = UDim2.new(0, 36, 0, 0)
    titleLbl.BackgroundTransparency = 1; titleLbl.Text = title
    titleLbl.TextColor3 = P.White; titleLbl.TextSize = 13
    titleLbl.Font = Enum.Font.GothamBold; titleLbl.TextXAlignment = Enum.TextXAlignment.Left; titleLbl.ZIndex = 7

    local arrow = Instance.new("TextLabel", header)
    arrow.Size = UDim2.new(0, 24, 1, 0); arrow.Position = UDim2.new(1, -30, 0, 0)
    arrow.BackgroundTransparency = 1; arrow.Text = "▼"
    arrow.TextColor3 = P.TextMut; arrow.TextSize = 10
    arrow.Font = Enum.Font.GothamBold; arrow.ZIndex = 7

    -- Container for card items
    local container = Instance.new("Frame", card)
    container.Size = UDim2.new(1, -16, 0, 0)
    container.Position = UDim2.new(0, 8, 0, 36)
    container.AutomaticSize = Enum.AutomaticSize.Y
    container.BackgroundTransparency = 1; container.ZIndex = 6

    local cl = Instance.new("UIListLayout", container)
    cl.SortOrder = Enum.SortOrder.LayoutOrder; cl.Padding = UDim.new(0, 4)

    local cp = Instance.new("UIPadding", container)
    cp.PaddingBottom = UDim.new(0, 8)

    local CardObj = { Frame = card, Container = container }
    function CardObj:AddButton(o) return AddButton(container, o) end
    function CardObj:AddToggle(o) return AddToggle(container, o) end
    function CardObj:AddSlider(o) return AddSlider(container, o) end
    function CardObj:AddDropdown(o) return AddDropdown(container, o) end
    function CardObj:AddTextbox(o) return AddTextbox(container, o) end
    function CardObj:AddLabel(o) return AddLabel(container, o) end
    function CardObj:AddBanner(o) return AddBanner(container, o) end
    function CardObj:AddKeyVal(o) return AddKeyVal(container, o) end

    return CardObj
end

-- ═══════════════════════════════════════════════════
-- MAIN WINDOW
-- ═══════════════════════════════════════════════════
function OceanLib:CreateWindow(options)
    options = options or {}
    local windowTitle = options.Name or "Ocean Hub"
    local iconId = options.Icon or P.IconId

    if CoreGui:FindFirstChild("OceanHubUI") then CoreGui:FindFirstChild("OceanHubUI"):Destroy() end

    local sg = Instance.new("ScreenGui"); sg.Name = "OceanHubUI"; sg.ResetOnSpawn = false
    if gethui then sg.Parent = gethui()
    elseif syn and syn.protect_gui then syn.protect_gui(sg); sg.Parent = CoreGui
    else sg.Parent = CoreGui end

    -- ══ OUTER WRAPPER (no clip - holds corner glows) ══
    local wrapper = Instance.new("Frame")
    wrapper.Name = "Wrapper"; wrapper.Size = UDim2.new(0, 550, 0, 370)
    wrapper.Position = UDim2.new(0.5, -275, 0.5, -185)
    wrapper.BackgroundTransparency = 1; wrapper.BorderSizePixel = 0
    wrapper.Parent = sg

    makeDraggable(wrapper)

    -- Corner glow lights (on wrapper, NOT clipped)
    addCornerGlows(wrapper, UDim2.new(0, 240, 0, 240), 0.02)

    -- ══ MAIN FRAME (clips content) ══
    local main = Instance.new("Frame")
    main.Name = "Main"; main.Size = UDim2.new(1, 0, 1, 0)
    main.BackgroundColor3 = P.Bg2; main.BorderSizePixel = 0
    main.ClipsDescendants = true; main.Parent = wrapper

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)
    local ms = Instance.new("UIStroke", main); ms.Color = P.Border2; ms.Thickness = 2; ms.Transparency = 0

    addTopGlow(main)

    -- ══ MINI ICON (Minimized State) ══
    local mini = Instance.new("Frame")
    mini.Name = "Mini"; mini.Size = UDim2.new(0, 46, 0, 46)
    mini.Position = UDim2.new(0, 24, 0.5, -23)
    mini.BackgroundColor3 = P.Bg3; mini.Visible = false; mini.ZIndex = 10; mini.Parent = sg
    Instance.new("UICorner", mini).CornerRadius = UDim.new(0, 12)
    local miniS = Instance.new("UIStroke", mini); miniS.Color = P.Cyan; miniS.Thickness = 2; miniS.Transparency = 0.2

    addCornerGlows(mini, UDim2.new(0, 55, 0, 55), 0.06)

    local miniImg = Instance.new("ImageLabel", mini)
    miniImg.Size = UDim2.new(1, -8, 1, -8); miniImg.Position = UDim2.new(0, 4, 0, 4)
    miniImg.BackgroundTransparency = 1; miniImg.Image = iconId
    miniImg.ScaleType = Enum.ScaleType.Fit; miniImg.ZIndex = 11
    Instance.new("UICorner", miniImg).CornerRadius = UDim.new(0, 10)

    local miniBtn = Instance.new("TextButton", mini)
    miniBtn.Size = UDim2.new(1, 0, 1, 0); miniBtn.BackgroundTransparency = 1
    miniBtn.Text = ""; miniBtn.ZIndex = 12

    makeDraggable(mini)

    miniBtn.MouseEnter:Connect(function()
        tw(mini, {Size = UDim2.new(0, 52, 0, 52)}, TI.Bounce)
        tw(miniS, {Transparency = 0, Color = P.CyanBright})
    end)
    miniBtn.MouseLeave:Connect(function()
        tw(mini, {Size = UDim2.new(0, 46, 0, 46)}, TI.Fast)
        tw(miniS, {Transparency = 0.2, Color = P.Cyan})
    end)
    miniBtn.MouseButton1Click:Connect(function()
        mini.Visible = false; wrapper.Visible = true
        wrapper.Size = UDim2.new(0, 0, 0, 0)
        tw(wrapper, {Size = UDim2.new(0, 550, 0, 370)}, TI.Bounce)
    end)

    -- ══ HEADER BAR ══
    local headerBar = Instance.new("Frame", main)
    headerBar.Size = UDim2.new(1, 0, 0, 52)
    headerBar.BackgroundColor3 = P.Bg3; headerBar.BackgroundTransparency = 0.3
    headerBar.BorderSizePixel = 0; headerBar.ZIndex = 3
    Instance.new("UICorner", headerBar).CornerRadius = UDim.new(0, 14)

    -- Header bottom gradient line (full width, connected to edges)
    local headerLine = Instance.new("Frame", main)
    headerLine.Size = UDim2.new(1, 0, 0, 1)
    headerLine.Position = UDim2.new(0, 0, 0, 52)
    headerLine.BackgroundColor3 = P.Border2; headerLine.BackgroundTransparency = 0
    headerLine.BorderSizePixel = 0; headerLine.ZIndex = 4

    -- Glow under header line
    addGlow(main, UDim2.new(0.5, -100, 0, 35), P.GlowCyan, UDim2.new(0, 200, 0, 30), 0.7)

    -- Logo Box
    local logoBox = Instance.new("Frame", headerBar)
    logoBox.Size = UDim2.new(0, 32, 0, 32); logoBox.Position = UDim2.new(0, 12, 0, 10)
    logoBox.BackgroundColor3 = P.CyanDark; logoBox.ZIndex = 4
    Instance.new("UICorner", logoBox).CornerRadius = UDim.new(0, 8)
    local logoBoxS = Instance.new("UIStroke", logoBox); logoBoxS.Color = P.Cyan; logoBoxS.Transparency = 0.4

    local logoImg = Instance.new("ImageLabel", logoBox)
    logoImg.Size = UDim2.new(1, 0, 1, 0); logoImg.BackgroundTransparency = 1
    logoImg.Image = iconId; logoImg.ScaleType = Enum.ScaleType.Fit; logoImg.ZIndex = 5
    Instance.new("UICorner", logoImg).CornerRadius = UDim.new(0, 8)

    -- Title (fixed position, truncate if too long)
    local titleLbl = Instance.new("TextLabel", headerBar)
    titleLbl.Size = UDim2.new(1, -130, 0, 20); titleLbl.Position = UDim2.new(0, 52, 0, 10)
    titleLbl.BackgroundTransparency = 1; titleLbl.Text = windowTitle
    titleLbl.TextColor3 = P.White; titleLbl.TextSize = 14
    titleLbl.Font = Enum.Font.GothamBold; titleLbl.TextXAlignment = Enum.TextXAlignment.Left
    titleLbl.TextTruncate = Enum.TextTruncate.AtEnd; titleLbl.ZIndex = 4

    -- Version tag (below title)
    local verLbl = Instance.new("TextLabel", headerBar)
    verLbl.Size = UDim2.new(0, 60, 0, 14); verLbl.Position = UDim2.new(0, 52, 0, 30)
    verLbl.BackgroundTransparency = 1; verLbl.Text = "LOADER V1"
    verLbl.TextColor3 = P.CyanBright; verLbl.TextSize = 10
    verLbl.Font = Enum.Font.GothamMedium; verLbl.TextXAlignment = Enum.TextXAlignment.Left; verLbl.ZIndex = 4

    -- ══ CONTROL BUTTONS (MacOS Style Colored Dots) ══
    local ctrlFrame = Instance.new("Frame", headerBar)
    ctrlFrame.Size = UDim2.new(0, 48, 0, 28)
    ctrlFrame.Position = UDim2.new(1, -58, 0, 12)
    ctrlFrame.BackgroundTransparency = 1; ctrlFrame.ZIndex = 4

    -- Minimize (Yellow Dot)
    local minBtn = Instance.new("TextButton", ctrlFrame)
    minBtn.Size = UDim2.new(0, 14, 0, 14); minBtn.Position = UDim2.new(0, 4, 0.5, -7)
    minBtn.BackgroundColor3 = P.Yellow; minBtn.BackgroundTransparency = 0
    minBtn.Text = ""; minBtn.ZIndex = 5
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(1, 0)
    local minBtnS = Instance.new("UIStroke", minBtn); minBtnS.Color = Color3.fromRGB(200, 160, 0); minBtnS.Transparency = 0.3

    minBtn.MouseEnter:Connect(function() tw(minBtn, {Size = UDim2.new(0, 16, 0, 16)}) end)
    minBtn.MouseLeave:Connect(function() tw(minBtn, {Size = UDim2.new(0, 14, 0, 14)}) end)
    minBtn.MouseButton1Click:Connect(function()
        tw(wrapper, {Size = UDim2.new(0, 0, 0, 0)}, TI.Med)
        task.delay(0.3, function()
            wrapper.Visible = false; mini.Visible = true
            mini.Size = UDim2.new(0, 0, 0, 0)
            tw(mini, {Size = UDim2.new(0, 46, 0, 46)}, TI.Bounce)
        end)
    end)

    -- Close (Red/Orange Dot)
    local closeBtn = Instance.new("TextButton", ctrlFrame)
    closeBtn.Size = UDim2.new(0, 14, 0, 14); closeBtn.Position = UDim2.new(0, 26, 0.5, -7)
    closeBtn.BackgroundColor3 = P.Orange; closeBtn.BackgroundTransparency = 0
    closeBtn.Text = ""; closeBtn.ZIndex = 5
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(1, 0)
    local closeBtnS = Instance.new("UIStroke", closeBtn); closeBtnS.Color = Color3.fromRGB(200, 80, 0); closeBtnS.Transparency = 0.3

    closeBtn.MouseEnter:Connect(function() tw(closeBtn, {Size = UDim2.new(0, 16, 0, 16)}) end)
    closeBtn.MouseLeave:Connect(function() tw(closeBtn, {Size = UDim2.new(0, 14, 0, 14)}) end)
    closeBtn.MouseButton1Click:Connect(function() sg:Destroy() end)

    -- ══ TAB SIDEBAR ══
    local sidebar = Instance.new("Frame", main)
    sidebar.Size = UDim2.new(0, 134, 1, -62)
    sidebar.Position = UDim2.new(0, 8, 0, 58)
    sidebar.BackgroundColor3 = P.Bg1; sidebar.BackgroundTransparency = 0.5
    sidebar.BorderSizePixel = 0; sidebar.ZIndex = 3
    Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 10)

    -- Player Profile Card in Sidebar
    local pCard = Instance.new("Frame", sidebar)
    pCard.Size = UDim2.new(1, -8, 0, 42)
    pCard.Position = UDim2.new(0, 4, 0, 6)
    pCard.BackgroundColor3 = P.Bg3; pCard.BackgroundTransparency = 0.4; pCard.ZIndex = 4
    Instance.new("UICorner", pCard).CornerRadius = UDim.new(0, 8)
    local pCardS = Instance.new("UIStroke", pCard); pCardS.Color = P.Border1; pCardS.Transparency = 0.5

    -- Roblox Player Avatar Headshot Image
    local pAvatar = Instance.new("ImageLabel", pCard)
    pAvatar.Size = UDim2.new(0, 28, 0, 28); pAvatar.Position = UDim2.new(0, 6, 0.5, -14)
    pAvatar.BackgroundColor3 = P.Bg4; pAvatar.ZIndex = 5
    pAvatar.Image = "rbxthumb://type=AvatarHeadShot&id=" .. (Players.LocalPlayer and Players.LocalPlayer.UserId or 1) .. "&x=150&y=150"
    pAvatar.ScaleType = Enum.ScaleType.Fit
    Instance.new("UICorner", pAvatar).CornerRadius = UDim.new(1, 0)
    local pAvatarS = Instance.new("UIStroke", pAvatar); pAvatarS.Color = P.Cyan; pAvatarS.Transparency = 0.4

    local localPlayerName = (Players.LocalPlayer and Players.LocalPlayer.Name) or "User"

    -- Name
    local pName = Instance.new("TextLabel", pCard)
    pName.Size = UDim2.new(1, -42, 0, 16); pName.Position = UDim2.new(0, 38, 0, 5)
    pName.BackgroundTransparency = 1; pName.Text = localPlayerName
    pName.TextColor3 = P.White; pName.TextSize = 11; pName.TextTruncate = Enum.TextTruncate.AtEnd
    pName.Font = Enum.Font.GothamBold; pName.TextXAlignment = Enum.TextXAlignment.Left; pName.ZIndex = 5

    -- Status dot (Dynamic Free / Premium)
    local isFree = string.find(string.lower(windowTitle), "free") ~= nil
    local pStatus = Instance.new("TextLabel", pCard)
    pStatus.Size = UDim2.new(1, -42, 0, 14); pStatus.Position = UDim2.new(0, 38, 0, 21)
    pStatus.BackgroundTransparency = 1
    pStatus.Text = isFree and "● Free" or "● Premium"
    pStatus.TextColor3 = isFree and P.Cyan or P.Green
    pStatus.TextSize = 9
    pStatus.Font = Enum.Font.GothamMedium; pStatus.TextXAlignment = Enum.TextXAlignment.Left; pStatus.ZIndex = 5

    -- Tab Container Frame inside Sidebar
    local tabContainer = Instance.new("Frame", sidebar)
    tabContainer.Size = UDim2.new(1, -8, 1, -72); tabContainer.Position = UDim2.new(0, 4, 0, 54)
    tabContainer.BackgroundTransparency = 1; tabContainer.ZIndex = 4

    local tabLayout = Instance.new("UIListLayout", tabContainer)
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder; tabLayout.Padding = UDim.new(0, 4)

    -- Sidebar Footer Text
    local sideFooter = Instance.new("TextLabel", sidebar)
    sideFooter.Size = UDim2.new(1, 0, 0, 14); sideFooter.Position = UDim2.new(0, 0, 1, -16)
    sideFooter.BackgroundTransparency = 1; sideFooter.Text = "ocean • v1.0"
    sideFooter.TextColor3 = P.TextMut; sideFooter.TextSize = 9
    sideFooter.Font = Enum.Font.Gotham; sideFooter.ZIndex = 5

    -- Tab/Content separator (matches header line color)
    local sepLine = Instance.new("Frame", main)
    sepLine.Size = UDim2.new(0, 1, 1, -53)
    sepLine.Position = UDim2.new(0, 142, 0, 53)
    sepLine.BackgroundColor3 = P.Border2; sepLine.BackgroundTransparency = 0
    sepLine.BorderSizePixel = 0; sepLine.ZIndex = 3

    -- ══ CONTENT AREA ══
    local contentArea = Instance.new("Frame", main)
    contentArea.Size = UDim2.new(1, -154, 1, -62)
    contentArea.Position = UDim2.new(0, 148, 0, 58)
    contentArea.BackgroundTransparency = 1; contentArea.ZIndex = 3

    -- ══ WINDOW OBJECT ══
    local WinObj = {}; WinObj.Tabs = {}

    function WinObj:MakeTab(tabOpts)
        tabOpts = tabOpts or {}
        local tabName = tabOpts.Name or "Tab"

        -- Tab button
        local tabBtn = Instance.new("TextButton", tabContainer)
        tabBtn.Name = tabName; tabBtn.Size = UDim2.new(1, 0, 0, 32)
        tabBtn.BackgroundColor3 = P.Bg3; tabBtn.BackgroundTransparency = 0.5
        tabBtn.Text = ""; tabBtn.ZIndex = 4
        Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(0, 8)
        local tbS = Instance.new("UIStroke", tabBtn)
        tbS.Color = P.Border1; tbS.Transparency = 0.6

        -- Active indicator
        local indicator = Instance.new("Frame", tabBtn)
        indicator.Size = UDim2.new(0, 3, 0.55, 0)
        indicator.Position = UDim2.new(0, 4, 0.225, 0)
        indicator.BackgroundColor3 = P.Cyan; indicator.BackgroundTransparency = 1; indicator.ZIndex = 5
        Instance.new("UICorner", indicator).CornerRadius = UDim.new(0, 2)

        -- Tab label
        local tabLbl = Instance.new("TextLabel", tabBtn)
        tabLbl.Size = UDim2.new(1, -22, 1, 0); tabLbl.Position = UDim2.new(0, 14, 0, 0)
        tabLbl.BackgroundTransparency = 1; tabLbl.Text = tabName
        tabLbl.TextColor3 = P.TextMut; tabLbl.TextSize = 13
        tabLbl.Font = Enum.Font.GothamBold; tabLbl.TextXAlignment = Enum.TextXAlignment.Left; tabLbl.ZIndex = 5

        -- Tab glow behind (visible when active)
        local tabGlow = addGlow(tabBtn, UDim2.new(0, -15, 0, -10), P.GlowCyan, UDim2.new(0, 50, 0, 50), 1)
        tabGlow.ZIndex = 3

        -- Content page
        local page = Instance.new("ScrollingFrame", contentArea)
        page.Name = tabName; page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1; page.BorderSizePixel = 0
        page.Visible = false; page.ScrollBarThickness = 3
        page.ScrollBarImageColor3 = P.Cyan; page.ScrollBarImageTransparency = 0.3
        page.ZIndex = 4; page.TopImage = ""; page.BottomImage = ""

        local pl = Instance.new("UIListLayout", page)
        pl.SortOrder = Enum.SortOrder.LayoutOrder; pl.Padding = UDim.new(0, 5)
        local pp = Instance.new("UIPadding", page)
        pp.PaddingRight = UDim.new(0, 8); pp.PaddingTop = UDim.new(0, 2)

        pl:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            page.CanvasSize = UDim2.new(0, 0, 0, pl.AbsoluteContentSize.Y + 12)
        end)

        local TabObj = {
            Button = tabBtn, Page = page, Indicator = indicator,
            Label = tabLbl, Stroke = tbS, TabGlow = tabGlow,
        }

        function TabObj:AddButton(o) return AddButton(page, o) end
        function TabObj:AddToggle(o) return AddToggle(page, o) end
        function TabObj:AddSlider(o) return AddSlider(page, o) end
        function TabObj:AddDropdown(o) return AddDropdown(page, o) end
        function TabObj:AddTextbox(o) return AddTextbox(page, o) end
        function TabObj:AddLabel(o) return AddLabel(page, o) end
        function TabObj:AddCard(o) return AddCard(page, o) end
        function TabObj:AddBanner(o) return AddBanner(page, o) end
        function TabObj:AddKeyVal(o) return AddKeyVal(page, o) end

        local function activate()
            for _, t in pairs(WinObj.Tabs) do
                t.Page.Visible = false
                tw(t.Button, {BackgroundColor3 = P.Bg3, BackgroundTransparency = 0.5}, TI.Med)
                tw(t.Stroke, {Color = P.Border1, Transparency = 0.6}, TI.Med)
                tw(t.Indicator, {BackgroundTransparency = 1}, TI.Med)
                tw(t.Label, {TextColor3 = P.TextMut}, TI.Med)
                tw(t.TabGlow, {ImageTransparency = 1}, TI.Med)
            end
            page.Visible = true
            tw(tabBtn, {BackgroundColor3 = P.CyanDark, BackgroundTransparency = 0}, TI.Med)
            tw(tbS, {Color = P.Cyan, Transparency = 0}, TI.Med)
            tw(indicator, {BackgroundTransparency = 0}, TI.Med)
            tw(tabLbl, {TextColor3 = P.White}, TI.Med)
            tw(tabGlow, {ImageTransparency = 0.5}, TI.Slow)
        end

        tabBtn.MouseButton1Click:Connect(activate)
        tabBtn.MouseEnter:Connect(function()
            if not page.Visible then
                tw(tabBtn, {BackgroundTransparency = 0.2}, TI.Fast)
                tw(tabLbl, {TextColor3 = P.TextSec}, TI.Fast)
                tw(tbS, {Transparency = 0.3}, TI.Fast)
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if not page.Visible then
                tw(tabBtn, {BackgroundTransparency = 0.5}, TI.Fast)
                tw(tabLbl, {TextColor3 = P.TextMut}, TI.Fast)
                tw(tbS, {Transparency = 0.6}, TI.Fast)
            end
        end)

        if #WinObj.Tabs == 0 then activate() end
        table.insert(WinObj.Tabs, TabObj)
        return TabObj
    end

    return WinObj
end

return OceanLib
