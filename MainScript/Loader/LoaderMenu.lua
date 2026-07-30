--[[
    Ocean Script Loader v1 (ULTIMATE PERFECT & NEAT REPLICA)
    This is the MAIN loader UI (Key System & Game Selector)
]]

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local setclipboard = setclipboard or toclipboard or function(text) print("Clipboard:", text) end

if CoreGui:FindFirstChild("OceanScriptLoader") then
    CoreGui:FindFirstChild("OceanScriptLoader"):Destroy()
end

local CONFIG = {
    Title = "Ocean Script",
    Version = "LOADER V1",
    IconId = "rbxassetid://84718341622420",
    DiscordLink = "https://discord.gg/placeholder",
    
    BgColor = Color3.fromRGB(6, 18, 48),
    OuterBorderColor = Color3.fromRGB(38, 140, 215),
    HeaderDividerColor = Color3.fromRGB(25, 60, 110),
    
    TitleColor = Color3.fromRGB(255, 255, 255),
    VersionColor = Color3.fromRGB(125, 211, 252),
    
    TabInactiveBg = Color3.fromRGB(8, 28, 65),
    TabInactiveBorder = Color3.fromRGB(25, 75, 130),
    TabInactiveText = Color3.fromRGB(150, 200, 255),

    FreeActiveBg = Color3.fromRGB(12, 80, 150),
    FreeActiveBorder = Color3.fromRGB(56, 189, 248),
    FreeActiveText = Color3.fromRGB(255, 255, 255),

    FreemiumActiveBg = Color3.fromRGB(10, 55, 65),
    FreemiumActiveBorder = Color3.fromRGB(52, 211, 153),
    FreemiumActiveText = Color3.fromRGB(110, 231, 183),

    PremiumActiveBg = Color3.fromRGB(32, 40, 95),
    PremiumActiveBorder = Color3.fromRGB(129, 140, 248),
    PremiumActiveText = Color3.fromRGB(224, 231, 255),

    InfoActiveBg = Color3.fromRGB(35, 40, 52),
    InfoActiveBorder = Color3.fromRGB(100, 112, 140),
    InfoActiveText = Color3.fromRGB(185, 195, 215),
}

-- Point Arsenal & Rivals to our new script folders!
local SCRIPTS = {
    free = {
        ["Arsenal"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/OCEANHUB/main/MainScript/Script/Arsenal/LoaderArsenal.lua"))()',
        ["Rivals"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/OCEANHUB/main/MainScript/Script/Rivals/LoaderRivals.lua"))()',
        ["Blox Fruits"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanScript/bloxfruits-free/main/loader.lua"))()',
        ["Pet Simulator X"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanScript/petsimx-free/main/loader.lua"))()',
    },
    freemium = {
        ["Arsenal"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/OCEANHUB/main/MainScript/Script/Arsenal/LoaderArsenal.lua"))()',
        ["Rivals"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/OCEANHUB/main/MainScript/Script/Rivals/LoaderRivals.lua"))()',
        ["Blox Fruits"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanScript/bloxfruits-freemium/main/loader.lua"))()',
        ["Da Hood"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanScript/dahood-freemium/main/loader.lua"))()',
    },
    premium = {
        ["Arsenal"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/OCEANHUB/main/MainScript/Script/Arsenal/LoaderArsenal.lua"))()',
        ["Rivals"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_USERNAME/OCEANHUB/main/MainScript/Script/Rivals/LoaderRivals.lua"))()',
        ["Blox Fruits"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanScript/bloxfruits-premium/main/loader.lua"))()',
        ["Doors"] = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanScript/doors-premium/main/loader.lua"))()',
    }
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OceanScriptLoader"
ScreenGui.ResetOnSpawn = false

if gethui then
    ScreenGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
else
    ScreenGui.Parent = CoreGui
end

local Wrapper = Instance.new("Frame")
Wrapper.Name = "Wrapper"
Wrapper.Size = UDim2.new(0, 450, 0, 420)
Wrapper.Position = UDim2.new(0.5, -225, 0.5, -210)
Wrapper.BackgroundColor3 = CONFIG.BgColor
Wrapper.BorderSizePixel = 0
Wrapper.ClipsDescendants = true
Wrapper.Parent = ScreenGui

Instance.new("UICorner", Wrapper).CornerRadius = UDim.new(0, 16)
local WrapperStroke = Instance.new("UIStroke", Wrapper)
WrapperStroke.Color = CONFIG.OuterBorderColor
WrapperStroke.Thickness = 2.5

local function createSuperThickCornerLight(parent, position, color, size, zIndex, transparency)
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "SuperThickCornerGlow"
    Glow.Size = size or UDim2.new(0, 200, 0, 200)
    Glow.Position = position
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://5028857484"
    Glow.ImageColor3 = color
    Glow.ImageTransparency = transparency or 0.02
    Glow.ZIndex = zIndex or 1
    Glow.Parent = parent
    return Glow
end

createSuperThickCornerLight(Wrapper, UDim2.new(0, -70, 0, -70), Color3.fromRGB(56, 189, 248), UDim2.new(0, 240, 0, 240), 1, 0.02)
createSuperThickCornerLight(Wrapper, UDim2.new(1, -170, 0, -70), Color3.fromRGB(129, 140, 248), UDim2.new(0, 240, 0, 240), 1, 0.02)
createSuperThickCornerLight(Wrapper, UDim2.new(0, -70, 1, -170), Color3.fromRGB(52, 211, 153), UDim2.new(0, 240, 0, 240), 1, 0.02)
createSuperThickCornerLight(Wrapper, UDim2.new(1, -170, 1, -170), Color3.fromRGB(251, 191, 36), UDim2.new(0, 240, 0, 240), 1, 0.02)

local MainCard = Instance.new("Frame", Wrapper)
MainCard.Name = "MainCard"
MainCard.Size = UDim2.new(1, -20, 1, -20)
MainCard.Position = UDim2.new(0, 10, 0, 10)
MainCard.BackgroundColor3 = Color3.fromRGB(4, 14, 38)
MainCard.BackgroundTransparency = 0.25
MainCard.BorderSizePixel = 0
MainCard.ZIndex = 2
Instance.new("UICorner", MainCard).CornerRadius = UDim.new(0, 12)

local dragging, dragInput, dragStart, startPos
Wrapper.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true dragStart = input.Position startPos = Wrapper.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
Wrapper.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Wrapper.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local Header = Instance.new("Frame", MainCard)
Header.Size = UDim2.new(1, -30, 0, 48)
Header.Position = UDim2.new(0, 15, 0, 14)
Header.BackgroundTransparency = 1
Header.ZIndex = 3

local LogoBox = Instance.new("Frame", Header)
LogoBox.Size = UDim2.new(0, 46, 0, 46)
LogoBox.BackgroundColor3 = Color3.fromRGB(12, 90, 158)
LogoBox.BorderSizePixel = 0
LogoBox.ClipsDescendants = false
LogoBox.ZIndex = 3
Instance.new("UICorner", LogoBox).CornerRadius = UDim.new(0, 12)

local LogoStroke = Instance.new("UIStroke", LogoBox)
LogoStroke.Color = CONFIG.OuterBorderColor
LogoStroke.Transparency = 0.4

createSuperThickCornerLight(Wrapper, UDim2.new(0,  0, 0, -1), Color3.fromRGB(56, 189, 248),  UDim2.new(0, 50, 0, 50), 1, 0.03)
createSuperThickCornerLight(Wrapper, UDim2.new(0, 46, 0, -1), Color3.fromRGB(129, 140, 248), UDim2.new(0, 50, 0, 50), 1, 0.03)
createSuperThickCornerLight(Wrapper, UDim2.new(0,  0, 0, 45), Color3.fromRGB(52, 211, 153),  UDim2.new(0, 50, 0, 50), 1, 0.03)
createSuperThickCornerLight(Wrapper, UDim2.new(0, 46, 0, 45), Color3.fromRGB(251, 191, 36),  UDim2.new(0, 50, 0, 50), 1, 0.03)

local LogoImg = Instance.new("ImageLabel", LogoBox)
LogoImg.Size = UDim2.new(1, 0, 1, 0)
LogoImg.Position = UDim2.new(0, 0, 0, 0)
LogoImg.BackgroundTransparency = 1
LogoImg.Image = CONFIG.IconId
LogoImg.ScaleType = Enum.ScaleType.Fit
LogoImg.ZIndex = 4
Instance.new("UICorner", LogoImg).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -120, 0, 22)
Title.Position = UDim2.new(0, 56, 0, 3)
Title.BackgroundTransparency = 1
Title.Text = CONFIG.Title
Title.TextColor3 = CONFIG.TitleColor
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 3

local Version = Instance.new("TextLabel", Header)
Version.Size = UDim2.new(1, -120, 0, 16)
Version.Position = UDim2.new(0, 56, 0, 25)
Version.BackgroundTransparency = 1
Version.Text = CONFIG.Version
Version.TextColor3 = CONFIG.VersionColor
Version.TextSize = 11
Version.Font = Enum.Font.GothamBold
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.ZIndex = 3

local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -28, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 90)
CloseBtn.BackgroundTransparency = 0.5
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(160, 210, 255)
CloseBtn.TextSize = 13
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.ZIndex = 4
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
local CloseStroke = Instance.new("UIStroke", CloseBtn)
CloseStroke.Color = Color3.fromRGB(56, 189, 248)
CloseStroke.Transparency = 0.5

CloseBtn.MouseEnter:Connect(function()
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 40, 40)
    CloseBtn.BackgroundTransparency = 0.1
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)
CloseBtn.MouseLeave:Connect(function()
    CloseBtn.BackgroundColor3 = Color3.fromRGB(15, 45, 90)
    CloseBtn.BackgroundTransparency = 0.5
    CloseBtn.TextColor3 = Color3.fromRGB(160, 210, 255)
end)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local HR = Instance.new("Frame", MainCard)
HR.Size = UDim2.new(1, -30, 0, 1)
HR.Position = UDim2.new(0, 15, 0, 68)
HR.BackgroundColor3 = CONFIG.HeaderDividerColor
HR.BorderSizePixel = 0
HR.ZIndex = 3

local TabGrid = Instance.new("Frame", MainCard)
TabGrid.Size = UDim2.new(1, -30, 0, 68)
TabGrid.Position = UDim2.new(0, 15, 0, 80)
TabGrid.BackgroundTransparency = 1
TabGrid.ZIndex = 3

local UIGridLayout = Instance.new("UIGridLayout", TabGrid)
UIGridLayout.CellSize = UDim2.new(0.5, -5, 0, 30)
UIGridLayout.CellPadding = UDim2.new(0, 10, 0, 8)

local ContentFrame = Instance.new("Frame", MainCard)
ContentFrame.Size = UDim2.new(1, -30, 1, -168)
ContentFrame.Position = UDim2.new(0, 15, 0, 158)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ZIndex = 3

local tabButtons, panels = {}, {}
local tabDefs = {
    { id = "free", label = "Free", bg = CONFIG.FreeActiveBg, border = CONFIG.FreeActiveBorder, text = CONFIG.FreeActiveText },
    { id = "freemium", label = "Freemium", bg = CONFIG.FreemiumActiveBg, border = CONFIG.FreemiumActiveBorder, text = CONFIG.FreemiumActiveText },
    { id = "premium", label = "👑 Premium", bg = CONFIG.PremiumActiveBg, border = CONFIG.PremiumActiveBorder, text = Color3.fromRGB(253, 224, 71) },
    { id = "info", label = "Info", bg = CONFIG.InfoActiveBg, border = CONFIG.InfoActiveBorder, text = CONFIG.InfoActiveText },
}

local function createGameList(parentPanel, tier, games, backCallback)
    parentPanel:ClearAllChildren()
    
    local TopBar = Instance.new("Frame", parentPanel)
    TopBar.Size = UDim2.new(1, 0, 0, 24)
    TopBar.Position = UDim2.new(0, 0, 0, 0)
    TopBar.BackgroundTransparency = 1
    TopBar.ZIndex = 4

    local fBack = Instance.new("TextButton", TopBar)
    fBack.Size = UDim2.new(0, 72, 0, 22)
    fBack.BackgroundColor3 = Color3.fromRGB(2, 70, 150)
    fBack.BackgroundTransparency = 0.78
    fBack.Text = "← Back"
    fBack.TextColor3 = Color3.fromRGB(147, 197, 253)
    fBack.TextSize = 12
    fBack.Font = Enum.Font.GothamMedium
    fBack.ZIndex = 5

    Instance.new("UICorner", fBack).CornerRadius = UDim.new(0, 6)
    local BackStroke = Instance.new("UIStroke", fBack)
    BackStroke.Color = Color3.fromRGB(100, 180, 255)
    BackStroke.Transparency = 0.58

    fBack.MouseEnter:Connect(function()
        fBack.BackgroundColor3 = Color3.fromRGB(2, 100, 180)
        fBack.TextColor3 = Color3.fromRGB(186, 230, 253)
    end)
    fBack.MouseLeave:Connect(function()
        fBack.BackgroundColor3 = Color3.fromRGB(2, 70, 150)
        fBack.TextColor3 = Color3.fromRGB(147, 197, 253)
    end)

    fBack.MouseButton1Click:Connect(backCallback)

    local Scroll = Instance.new("ScrollingFrame", parentPanel)
    Scroll.Size = UDim2.new(1, 0, 1, -28)
    Scroll.Position = UDim2.new(0, 0, 0, 28)
    Scroll.BackgroundTransparency = 1
    Scroll.BorderSizePixel = 0
    Scroll.ScrollBarThickness = 4
    Scroll.ScrollBarImageColor3 = Color3.fromRGB(56, 189, 248)
    Scroll.ZIndex = 4

    local UIList = Instance.new("UIListLayout", Scroll)
    UIList.Padding = UDim.new(0, 5)
    UIList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Scroll.CanvasSize = UDim2.new(0, 0, 0, UIList.AbsoluteContentSize.Y + 70)
    end)

    for _, gameName in ipairs(games) do
        local GmBtn = Instance.new("TextButton", Scroll)
        GmBtn.Size = UDim2.new(1, -8, 0, 32)
        GmBtn.BackgroundColor3 = Color3.fromRGB(10, 35, 75)
        GmBtn.Text = "   " .. gameName
        GmBtn.TextColor3 = Color3.fromRGB(224, 242, 254)
        GmBtn.TextSize = 13
        GmBtn.Font = Enum.Font.GothamMedium
        GmBtn.TextXAlignment = Enum.TextXAlignment.Left
        GmBtn.ZIndex = 5

        Instance.new("UICorner", GmBtn).CornerRadius = UDim.new(0, 6)
        local Stroke = Instance.new("UIStroke", GmBtn)
        Stroke.Color = Color3.fromRGB(30, 85, 145)

        GmBtn.MouseButton1Click:Connect(function()
            local scriptUrl = SCRIPTS[tier] and SCRIPTS[tier][gameName]
            if scriptUrl then 
                ScreenGui:Destroy()
                loadstring(scriptUrl)() 
            end
        end)
    end
end

-- 1. Free Panel
local pFree = Instance.new("Frame", ContentFrame)
pFree.Size = UDim2.new(1, 0, 1, 0)
pFree.BackgroundTransparency = 1
pFree.ZIndex = 3
panels["free"] = pFree

local fS1 = Instance.new("Frame", pFree)
fS1.Size = UDim2.new(1, 0, 1, 0)
fS1.BackgroundTransparency = 1
fS1.ZIndex = 3

local fConfirmBtn = Instance.new("TextButton", fS1)
fConfirmBtn.Size = UDim2.new(1, 0, 0, 38)
fConfirmBtn.Position = UDim2.new(0, 0, 0, 20)
fConfirmBtn.BackgroundColor3 = Color3.fromRGB(12, 80, 150)
fConfirmBtn.Text = "Confirm"
fConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
fConfirmBtn.TextSize = 15
fConfirmBtn.Font = Enum.Font.GothamBold
fConfirmBtn.ZIndex = 4
Instance.new("UICorner", fConfirmBtn).CornerRadius = UDim.new(0, 8)
local fConfirmStroke = Instance.new("UIStroke", fConfirmBtn)
fConfirmStroke.Color = Color3.fromRGB(56, 189, 248)

local fS2 = Instance.new("Frame", pFree)
fS2.Size = UDim2.new(1, 0, 1, 0)
fS2.BackgroundTransparency = 1
fS2.Visible = false
fS2.ZIndex = 3

fConfirmBtn.MouseButton1Click:Connect(function()
    fS1.Visible = false
    fS2.Visible = true
    createGameList(fS2, "free", {"Arsenal", "Rivals", "Blox Fruits", "Pet Simulator X"}, function()
        fS2.Visible = false
        fS1.Visible = true
    end)
end)

-- 2. Freemium Panel
local pFrm = Instance.new("Frame", ContentFrame)
pFrm.Size = UDim2.new(1, 0, 1, 0)
pFrm.BackgroundTransparency = 1
pFrm.Visible = false
pFrm.ZIndex = 3
panels["freemium"] = pFrm

local fmS1 = Instance.new("Frame", pFrm)
fmS1.Size = UDim2.new(1, 0, 1, 0)
fmS1.BackgroundTransparency = 1
fmS1.ZIndex = 3

local fmLbl = Instance.new("TextLabel", fmS1)
fmLbl.Size = UDim2.new(1, 0, 0, 14)
fmLbl.BackgroundTransparency = 1
fmLbl.Text = "ENTER YOUR KEY"
fmLbl.TextColor3 = Color3.fromRGB(110, 170, 220)
fmLbl.TextSize = 10
fmLbl.Font = Enum.Font.GothamBold
fmLbl.TextXAlignment = Enum.TextXAlignment.Left
fmLbl.ZIndex = 3

local fmKeyIn = Instance.new("TextBox", fmS1)
fmKeyIn.Size = UDim2.new(1, 0, 0, 32)
fmKeyIn.Position = UDim2.new(0, 0, 0, 18)
fmKeyIn.BackgroundColor3 = Color3.fromRGB(8, 28, 65)
fmKeyIn.PlaceholderText = "ocean-XXXXXXXXXXXXXXXX"
fmKeyIn.PlaceholderColor3 = Color3.fromRGB(90, 140, 190)
fmKeyIn.Text = ""
fmKeyIn.TextColor3 = Color3.fromRGB(255, 255, 255)
fmKeyIn.TextSize = 12.5
fmKeyIn.Font = Enum.Font.Gotham
fmKeyIn.ZIndex = 4
Instance.new("UICorner", fmKeyIn).CornerRadius = UDim.new(0, 6)
local fmInStroke = Instance.new("UIStroke", fmKeyIn)
fmInStroke.Color = Color3.fromRGB(30, 85, 145)

local fmBtn = Instance.new("TextButton", fmS1)
fmBtn.Size = UDim2.new(1, 0, 0, 32)
fmBtn.Position = UDim2.new(0, 0, 0, 56)
fmBtn.BackgroundColor3 = Color3.fromRGB(10, 55, 65)
fmBtn.Text = "Verify key"
fmBtn.TextColor3 = Color3.fromRGB(110, 231, 183)
fmBtn.TextSize = 13
fmBtn.Font = Enum.Font.GothamBold
fmBtn.ZIndex = 4
Instance.new("UICorner", fmBtn).CornerRadius = UDim.new(0, 6)
local fmBtnStroke = Instance.new("UIStroke", fmBtn)
fmBtnStroke.Color = Color3.fromRGB(52, 211, 153)

local fmGetKeyBtn = Instance.new("TextButton", fmS1)
fmGetKeyBtn.Size = UDim2.new(1, 0, 0, 28)
fmGetKeyBtn.Position = UDim2.new(0, 0, 0, 94)
fmGetKeyBtn.BackgroundColor3 = Color3.fromRGB(8, 40, 50)
fmGetKeyBtn.Text = ""
fmGetKeyBtn.ZIndex = 4
Instance.new("UICorner", fmGetKeyBtn).CornerRadius = UDim.new(0, 6)
local fmGetKeyStroke = Instance.new("UIStroke", fmGetKeyBtn)
fmGetKeyStroke.Color = Color3.fromRGB(35, 150, 120)

local fmNeedTxt = Instance.new("TextLabel", fmGetKeyBtn)
fmNeedTxt.Size = UDim2.new(0.5, 0, 1, 0)
fmNeedTxt.Position = UDim2.new(0, 10, 0, 0)
fmNeedTxt.BackgroundTransparency = 1
fmNeedTxt.Text = "Need a key?"
fmNeedTxt.TextColor3 = Color3.fromRGB(110, 231, 183)
fmNeedTxt.TextSize = 12
fmNeedTxt.Font = Enum.Font.GothamMedium
fmNeedTxt.TextXAlignment = Enum.TextXAlignment.Left
fmNeedTxt.ZIndex = 4

local fmGetTxt = Instance.new("TextLabel", fmGetKeyBtn)
fmGetTxt.Size = UDim2.new(0.5, -10, 1, 0)
fmGetTxt.Position = UDim2.new(0.5, 0, 0, 0)
fmGetTxt.BackgroundTransparency = 1
fmGetTxt.Text = "Get key (Copy)"
fmGetTxt.TextColor3 = Color3.fromRGB(52, 211, 153)
fmGetTxt.TextSize = 12
fmGetTxt.Font = Enum.Font.GothamBold
fmGetTxt.TextXAlignment = Enum.TextXAlignment.Right
fmGetTxt.ZIndex = 4

fmGetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(CONFIG.DiscordLink)
    fmGetTxt.Text = "Copied!"
    fmGetTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
    task.wait(1.5)
    fmGetTxt.Text = "Get key (Copy)"
    fmGetTxt.TextColor3 = Color3.fromRGB(52, 211, 153)
end)

local fmS2 = Instance.new("Frame", pFrm)
fmS2.Size = UDim2.new(1, 0, 1, 0)
fmS2.BackgroundTransparency = 1
fmS2.Visible = false
fmS2.ZIndex = 3

fmBtn.MouseButton1Click:Connect(function()
    if fmKeyIn.Text ~= "" and string.sub(string.lower(fmKeyIn.Text), 1, 6) == "ocean-" then
        fmS1.Visible = false
        fmS2.Visible = true
        createGameList(fmS2, "freemium", {"Arsenal", "Rivals", "Blox Fruits", "Da Hood"}, function()
            fmS2.Visible = false
            fmS1.Visible = true
        end)
    end
end)

-- 3. Premium Panel
local pPrem = Instance.new("Frame", ContentFrame)
pPrem.Size = UDim2.new(1, 0, 1, 0)
pPrem.BackgroundTransparency = 1
pPrem.Visible = false
pPrem.ZIndex = 3
panels["premium"] = pPrem

local pS1 = Instance.new("Frame", pPrem)
pS1.Size = UDim2.new(1, 0, 1, 0)
pS1.BackgroundTransparency = 1
pS1.ZIndex = 3

local pLbl = Instance.new("TextLabel", pS1)
pLbl.Size = UDim2.new(1, 0, 0, 14)
pLbl.BackgroundTransparency = 1
pLbl.Text = "ENTER YOUR KEY"
pLbl.TextColor3 = Color3.fromRGB(110, 170, 220)
pLbl.TextSize = 10
pLbl.Font = Enum.Font.GothamBold
pLbl.TextXAlignment = Enum.TextXAlignment.Left
pLbl.ZIndex = 3

local pKeyIn = Instance.new("TextBox", pS1)
pKeyIn.Size = UDim2.new(1, 0, 0, 32)
pKeyIn.Position = UDim2.new(0, 0, 0, 18)
pKeyIn.BackgroundColor3 = Color3.fromRGB(8, 28, 65)
pKeyIn.PlaceholderText = "ocean-XXXXXXXXXXXXXXXX"
pKeyIn.PlaceholderColor3 = Color3.fromRGB(90, 140, 190)
pKeyIn.Text = ""
pKeyIn.TextColor3 = Color3.fromRGB(255, 255, 255)
pKeyIn.TextSize = 12.5
pKeyIn.Font = Enum.Font.Gotham
pKeyIn.ZIndex = 4
Instance.new("UICorner", pKeyIn).CornerRadius = UDim.new(0, 6)
local pInStroke = Instance.new("UIStroke", pKeyIn)
pInStroke.Color = Color3.fromRGB(30, 85, 145)

local pBtn = Instance.new("TextButton", pS1)
pBtn.Size = UDim2.new(1, 0, 0, 32)
pBtn.Position = UDim2.new(0, 0, 0, 56)
pBtn.BackgroundColor3 = Color3.fromRGB(32, 40, 95)
pBtn.Text = "Verify key"
pBtn.TextColor3 = Color3.fromRGB(224, 231, 255)
pBtn.TextSize = 13
pBtn.Font = Enum.Font.GothamBold
pBtn.ZIndex = 4
Instance.new("UICorner", pBtn).CornerRadius = UDim.new(0, 6)
local pBtnStroke = Instance.new("UIStroke", pBtn)
pBtnStroke.Color = Color3.fromRGB(129, 140, 248)

local pS2 = Instance.new("Frame", pPrem)
pS2.Size = UDim2.new(1, 0, 1, 0)
pS2.BackgroundTransparency = 1
pS2.Visible = false
pS2.ZIndex = 3

pBtn.MouseButton1Click:Connect(function()
    if pKeyIn.Text ~= "" and string.sub(string.lower(pKeyIn.Text), 1, 6) == "ocean-" then
        pS1.Visible = false
        pS2.Visible = true
        createGameList(pS2, "premium", {"Arsenal", "Rivals", "Blox Fruits", "Doors"}, function()
            pS2.Visible = false
            pS1.Visible = true
        end)
    end
end)

-- 4. Info Panel
local pInfo = Instance.new("Frame", ContentFrame)
pInfo.Size = UDim2.new(1, 0, 1, 0)
pInfo.BackgroundTransparency = 1
pInfo.Visible = false
pInfo.ZIndex = 3
panels["info"] = pInfo

local infoScroll = Instance.new("ScrollingFrame", pInfo)
infoScroll.Size = UDim2.new(1, 0, 1, 0)
infoScroll.BackgroundTransparency = 1
infoScroll.BorderSizePixel = 0
infoScroll.ScrollBarThickness = 0
infoScroll.ScrollBarImageColor3 = Color3.fromRGB(56, 189, 248)
infoScroll.ZIndex = 3

local infoList = Instance.new("UIListLayout", infoScroll)
infoList.Padding = UDim.new(0, 6)
infoList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    infoScroll.CanvasSize = UDim2.new(0, 0, 0, infoList.AbsoluteContentSize.Y + 70)
end)

local infoPad = Instance.new("UIPadding", infoScroll)
infoPad.PaddingLeft = UDim.new(0, 3)
infoPad.PaddingRight = UDim.new(0, 3)
infoPad.PaddingTop = UDim.new(0, 2)

local infoLbl = Instance.new("TextLabel", infoScroll)
infoLbl.Size = UDim2.new(1, 0, 0, 16)
infoLbl.BackgroundTransparency = 1
infoLbl.Text = "LINKS & INFO"
infoLbl.TextColor3 = Color3.fromRGB(110, 170, 220)
infoLbl.TextSize = 10.5
infoLbl.Font = Enum.Font.GothamBold
infoLbl.TextXAlignment = Enum.TextXAlignment.Left
infoLbl.ZIndex = 3

local infoItems = {
    { title = "Join our Discord", sub = "Get keys, updates & support", border = Color3.fromRGB(30, 85, 145), titleColor = Color3.fromRGB(255, 255, 255) },
    { title = "Safe to use", sub = "Scripts are checked before release", border = Color3.fromRGB(30, 85, 145), titleColor = Color3.fromRGB(255, 255, 255) },
    { title = "Auto-updated", sub = "Scripts update automatically after patches", border = Color3.fromRGB(30, 85, 145), titleColor = Color3.fromRGB(255, 255, 255) },
    { title = "Tier comparison", sub = "Free < Freemium (key) < Premium (key)", border = Color3.fromRGB(251, 191, 36), titleColor = Color3.fromRGB(253, 224, 71) },
}

for _, item in ipairs(infoItems) do
    local Row = Instance.new("Frame", infoScroll)
    Row.Size = UDim2.new(1, -4, 0, 50)
    Row.BackgroundColor3 = Color3.fromRGB(10, 35, 75)
    Row.ZIndex = 3
    Instance.new("UICorner", Row).CornerRadius = UDim.new(0, 7)
    local Stroke = Instance.new("UIStroke", Row)
    Stroke.Color = item.border
    Stroke.Thickness = 1

    local RowTitle = Instance.new("TextLabel", Row)
    RowTitle.Size = UDim2.new(1, -20, 0, 20)
    RowTitle.Position = UDim2.new(0, 10, 0, 6)
    RowTitle.BackgroundTransparency = 1
    RowTitle.Text = item.title
    RowTitle.TextColor3 = item.titleColor
    RowTitle.TextSize = 13
    RowTitle.Font = Enum.Font.GothamBold
    RowTitle.TextXAlignment = Enum.TextXAlignment.Left
    RowTitle.TextWrapped = true
    RowTitle.ZIndex = 4

    local RowSub = Instance.new("TextLabel", Row)
    RowSub.Size = UDim2.new(1, -20, 0, 18)
    RowSub.Position = UDim2.new(0, 10, 0, 27)
    RowSub.BackgroundTransparency = 1
    RowSub.Text = item.sub
    RowSub.TextColor3 = Color3.fromRGB(140, 165, 210)
    RowSub.TextSize = 11
    RowSub.Font = Enum.Font.GothamMedium
    RowSub.TextXAlignment = Enum.TextXAlignment.Left
    RowSub.TextWrapped = true
    RowSub.ZIndex = 4
end

local function switchTab(tabId)
    for id, btn in pairs(tabButtons) do
        local isActive = (id == tabId)
        local def = nil
        for _, d in ipairs(tabDefs) do if d.id == id then def = d break end end

        if isActive then
            btn.BackgroundColor3 = def.bg
            btn.TextColor3 = def.text
            btn:FindFirstChildOfClass("UIStroke").Color = def.border
        else
            btn.BackgroundColor3 = CONFIG.TabInactiveBg
            btn.TextColor3 = CONFIG.TabInactiveText
            btn:FindFirstChildOfClass("UIStroke").Color = CONFIG.TabInactiveBorder
        end
    end
    for id, panel in pairs(panels) do panel.Visible = (id == tabId) end
end

for _, tab in ipairs(tabDefs) do
    local TabBtn = Instance.new("TextButton", TabGrid)
    TabBtn.Name = "Tab_" .. tab.id
    TabBtn.Text = tab.label
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.TextSize = 13.5
    TabBtn.ZIndex = 4
    Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 7)
    local Stroke = Instance.new("UIStroke", TabBtn)
    Stroke.Thickness = 1
    tabButtons[tab.id] = TabBtn
    TabBtn.MouseButton1Click:Connect(function() switchTab(tab.id) end)
end

switchTab("free")