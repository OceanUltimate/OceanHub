--[[
================================================================
   ██████╗  ██████╗███████╗ █████╗ ███╗   ██╗██╗   ██╗██╗
  ██╔═══██╗██╔════╝██╔════╝██╔══██╗████╗  ██║██║   ██║██║
  ██║   ██║██║     █████╗  ███████║██╔██╗ ██║██║   ██║██║
  ██║   ██║██║     ██╔══╝  ██╔══██║██║╚██╗██║██║   ██║██║
  ╚██████╔╝╚██████╗███████╗██║  ██║██║ ╚████║╚██████╔╝██║
   ╚═════╝  ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝
  
  OceanHub UI Library — LoaderUI/Main.lua
  
  Entry point loader. Fetches OceanUI from GitHub
  and returns the library to the calling MainScript.
  
  Usage:
    local OceanUI = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/LoaderUI/Main.lua"
    ))()

    local Window = OceanUI:CreateWindow({
        Title    = "OceanHub",
        Subtitle = "Blox Fruits v1.0",
        Icon     = "rbxassetid://84718341622420",
    })
================================================================
]]

-- ============================================================
-- CONFIG
-- ============================================================
local REPO_RAW  = "https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/"
-- BUG FIX: was pointing to "MainUI/UI/Components/OceanUI.lua" which does not exist.
-- Correct path is "MainUI/UI/Main.lua"
local UI_PATH   = "MainUI/UI/Main.lua"
local VERSION   = "1.0.0"
local CACHE_KEY = "_OceanUI_v"..VERSION

-- ============================================================
-- SERVICES
-- ============================================================
local TweenService = game:GetService("TweenService")
local Players      = game:GetService("Players")

-- ============================================================
-- CACHE — avoid reloading if already in _G
-- ============================================================
if _G[CACHE_KEY] then
    _G[CACHE_KEY] = nil
end

-- ============================================================
-- LOADING SPLASH (shown while fetching)
-- ============================================================
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Remove old splash
if PlayerGui:FindFirstChild("OceanSplash") then
    PlayerGui:FindFirstChild("OceanSplash"):Destroy()
end

local Splash = Instance.new("ScreenGui")
Splash.Name           = "OceanSplash"
Splash.ResetOnSpawn   = false
Splash.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Splash.Parent         = PlayerGui

local SplashBg = Instance.new("Frame")
SplashBg.Size                   = UDim2.fromScale(1,1)
SplashBg.BackgroundColor3       = Color3.fromRGB(4, 11, 22)
SplashBg.BackgroundTransparency = 0.05
SplashBg.ZIndex                 = 1
SplashBg.Parent                 = Splash

-- Animated glow orbs
local function makeOrb(x, y, size, color)
    local orb = Instance.new("ImageLabel")
    orb.Size               = UDim2.new(0,size,0,size)
    orb.Position           = UDim2.fromScale(x,y)
    orb.AnchorPoint        = Vector2.new(0.5,0.5)
    orb.BackgroundTransparency = 1
    orb.Image              = "rbxassetid://5028857084"
    orb.ImageColor3        = color
    orb.ImageTransparency  = 0.55
    orb.ZIndex             = 2
    orb.Parent             = SplashBg
    return orb
end

makeOrb(0.15, 0.2,  300, Color3.fromRGB(0, 100, 180))
makeOrb(0.85, 0.8,  280, Color3.fromRGB(0, 60,  140))
makeOrb(0.5,  0.5,  200, Color3.fromRGB(0, 160, 230))

-- Logo frame
local LogoFrame = Instance.new("Frame")
LogoFrame.Size             = UDim2.new(0, 280, 0, 180)
LogoFrame.Position         = UDim2.fromScale(0.5, 0.45)
LogoFrame.AnchorPoint      = Vector2.new(0.5, 0.5)
LogoFrame.BackgroundTransparency = 1
LogoFrame.ZIndex           = 3
LogoFrame.Parent           = SplashBg

-- Icon
local LogoIcon = Instance.new("ImageLabel")
LogoIcon.Size               = UDim2.new(0, 70, 0, 70)
LogoIcon.Position           = UDim2.fromScale(0.5, 0)
LogoIcon.AnchorPoint        = Vector2.new(0.5, 0)
LogoIcon.BackgroundTransparency = 1
LogoIcon.Image              = "rbxassetid://84718341622420"
LogoIcon.ScaleType          = Enum.ScaleType.Fit
LogoIcon.ZIndex             = 4
LogoIcon.Parent             = LogoFrame

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 16)
iconCorner.Parent       = LogoIcon

-- Title
local LogoTitle = Instance.new("TextLabel")
LogoTitle.Size                   = UDim2.new(1, 0, 0, 36)
LogoTitle.Position               = UDim2.new(0, 0, 0, 78)
LogoTitle.BackgroundTransparency = 1
LogoTitle.Text                   = "OceanHub"
LogoTitle.TextColor3             = Color3.fromRGB(200, 230, 255)
LogoTitle.TextSize               = 28
LogoTitle.Font                   = Enum.Font.GothamBold
LogoTitle.TextXAlignment         = Enum.TextXAlignment.Center
LogoTitle.ZIndex                 = 4
LogoTitle.Parent                 = LogoFrame

-- Subtitle
local LogoSub = Instance.new("TextLabel")
LogoSub.Size                   = UDim2.new(1, 0, 0, 18)
LogoSub.Position               = UDim2.new(0, 0, 0, 116)
LogoSub.BackgroundTransparency = 1
LogoSub.Text                   = "UI Library v"..VERSION
LogoSub.TextColor3             = Color3.fromRGB(80, 130, 180)
LogoSub.TextSize               = 13
LogoSub.Font                   = Enum.Font.Gotham
LogoSub.TextXAlignment         = Enum.TextXAlignment.Center
LogoSub.ZIndex                 = 4
LogoSub.Parent                 = LogoFrame

-- Progress bar
local ProgBg = Instance.new("Frame")
ProgBg.Size             = UDim2.new(0, 240, 0, 4)
ProgBg.Position         = UDim2.fromScale(0.5, 0.72)
ProgBg.AnchorPoint      = Vector2.new(0.5, 0.5)
ProgBg.BackgroundColor3 = Color3.fromRGB(15, 35, 65)
ProgBg.ZIndex           = 3
ProgBg.Parent           = SplashBg

local progCorner = Instance.new("UICorner")
progCorner.CornerRadius = UDim.new(0, 2)
progCorner.Parent       = ProgBg

local ProgFill = Instance.new("Frame")
ProgFill.Size             = UDim2.new(0, 0, 1, 0)
ProgFill.BackgroundColor3 = Color3.fromRGB(0, 160, 230)
ProgFill.ZIndex           = 4
ProgFill.Parent           = ProgBg

local progFillCorner = Instance.new("UICorner")
progFillCorner.CornerRadius = UDim.new(0, 2)
progFillCorner.Parent       = ProgFill

-- Status text
local StatusText = Instance.new("TextLabel")
StatusText.Size                   = UDim2.new(0, 280, 0, 18)
StatusText.Position               = UDim2.fromScale(0.5, 0.78)
StatusText.AnchorPoint            = Vector2.new(0.5, 0.5)
StatusText.BackgroundTransparency = 1
StatusText.Text                   = "Initializing..."
StatusText.TextColor3             = Color3.fromRGB(60, 100, 150)
StatusText.TextSize               = 11
StatusText.Font                   = Enum.Font.Gotham
StatusText.TextXAlignment         = Enum.TextXAlignment.Center
StatusText.ZIndex                 = 3
StatusText.Parent                 = SplashBg

-- Version tag
local VerTag = Instance.new("TextLabel")
VerTag.Size                   = UDim2.new(1, 0, 0, 16)
VerTag.Position               = UDim2.new(0, 0, 1, -20)
VerTag.BackgroundTransparency = 1
VerTag.Text                   = "OceanUltimate  •  github.com/OceanUltimate/OceanHub"
VerTag.TextColor3             = Color3.fromRGB(30, 55, 90)
VerTag.TextSize               = 10
VerTag.Font                   = Enum.Font.Gotham
VerTag.TextXAlignment         = Enum.TextXAlignment.Center
VerTag.ZIndex                 = 3
VerTag.Parent                 = SplashBg

-- ============================================================
-- HELPER: Update splash progress
-- ============================================================
local function setProgress(pct, status)
    TweenService:Create(
        ProgFill,
        TweenInfo.new(0.25, Enum.EasingStyle.Quad),
        { Size = UDim2.new(pct, 0, 1, 0) }
    ):Play()
    if status then StatusText.Text = status end
end

-- ============================================================
-- HELPER: Fade & destroy splash
-- BUG FIX: old version tried to tween BackgroundTransparency on ALL
-- descendants including UICorner/UIStroke which don't have that property,
-- causing silent errors. Now we only tween valid instance types.
-- ============================================================
local function destroySplash()
    TweenService:Create(
        SplashBg,
        TweenInfo.new(0.4, Enum.EasingStyle.Quad),
        { BackgroundTransparency = 1 }
    ):Play()

    for _, obj in ipairs(SplashBg:GetDescendants()) do
        if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
            TweenService:Create(obj, TweenInfo.new(0.4), { BackgroundTransparency = 1 }):Play()
        elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
            TweenService:Create(obj, TweenInfo.new(0.4), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(obj, TweenInfo.new(0.4), { TextTransparency = 1 }):Play()
        elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            TweenService:Create(obj, TweenInfo.new(0.4), { ImageTransparency = 1 }):Play()
        end
        -- UICorner, UIStroke, UIListLayout etc. are intentionally skipped
    end

    task.delay(0.5, function()
        if Splash and Splash.Parent then
            Splash:Destroy()
        end
    end)
end

-- ============================================================
-- LOAD OceanUI FROM GITHUB
-- ============================================================
setProgress(0.1, "Connecting to OceanHub servers...")
task.wait(0.2)

local library

local success, errMsg = pcall(function()
    setProgress(0.3, "Fetching UI library...")
    task.wait(0.1)

    local src = game:HttpGet(REPO_RAW .. UI_PATH)

    -- BUG FIX: guard against empty response before attempting loadstring
    if not src or src == "" then
        error("Received empty response from GitHub — check UI_PATH")
    end

    setProgress(0.6, "Compiling library...")
    task.wait(0.05)

    local fn, compileErr = loadstring(src)
    if not fn then
        error("Compile error: " .. tostring(compileErr))
    end

    setProgress(0.8, "Initializing components...")
    task.wait(0.05)

    library = fn()

    if not library then
        error("OceanUI returned nil — check MainUI/UI/Main.lua return statement")
    end

    setProgress(1.0, "Ready!")
    task.wait(0.35)
end)

if not success then
    -- Show error on splash
    StatusText.Text       = "Error: " .. tostring(errMsg)
    StatusText.TextColor3 = Color3.fromRGB(220, 60, 60)
    ProgFill.BackgroundColor3 = Color3.fromRGB(200, 50, 60)
    task.delay(4, destroySplash)
    error("[OceanHub Loader] Failed to load OceanUI:\n" .. tostring(errMsg))
    return
end

-- Cache in _G
_G[CACHE_KEY] = library

destroySplash()

print("[OceanHub Loader] OceanUI v"..VERSION.." loaded successfully!")

return library
