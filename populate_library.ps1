$baseDir = "C:\Users\xenof\OneDrive\Documents\oceanhub\MainUI\UI\Library"

# Remove temporary script generator if present
if (Test-Path "C:\Users\xenof\OneDrive\Documents\oceanhub\gen.ps1") { Remove-Item "C:\Users\xenof\OneDrive\Documents\oceanhub\gen.ps1" -Force }
if (Test-Path "C:\Users\xenof\OneDrive\Documents\oceanhub\gen_lib.ps1") { Remove-Item "C:\Users\xenof\OneDrive\Documents\oceanhub\gen_lib.ps1" -Force }

# Remove old pack files in Components
Get-ChildItem -Path (Join-Path $baseDir "Components") -Filter "Pack*.lua" -ErrorAction SilentlyContinue | Remove-Item -Force

# Define folders inside Library/
$folders = @("Components", "Notifications", "Themes", "Utilities", "Animations", "Elements", "Widgets", "Styles", "Handlers", "Config")

foreach ($f in $folders) {
    $dir = Join-Path $baseDir $f
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force
    }
}

# Create rich modular Lua files inside each subfolder of Library/
foreach ($f in $folders) {
    $dir = Join-Path $baseDir $f
    1..5 | ForEach-Object {
        $idx = $_
        $fileName = "${f}_Module_${idx}.lua"
        $filePath = Join-Path $dir $fileName
        
        $lines = New-Object System.Collections.Generic.List[string]
        $lines.Add("--[[")
        $lines.Add("    OceanHub UI Library - Module: $f / $fileName")
        $lines.Add("    Theme: Midnight Ocean (Matching LoaderMenu.lua with glowing corner lights and icons)")
        $lines.Add("]]")
        $lines.Add("")
        $lines.Add("local Module = {}")
        $lines.Add("Module.Name = `"${f}_Module_${idx}`"")
        $lines.Add("Module.Folder = `"$f`"")
        $lines.Add("")
        $lines.Add("Module.Theme = {")
        $lines.Add("    BgColor = Color3.fromRGB(6, 18, 48),")
        $lines.Add("    MainCardBg = Color3.fromRGB(4, 14, 38),")
        $lines.Add("    OuterBorderColor = Color3.fromRGB(38, 140, 215),")
        $lines.Add("    HeaderDividerColor = Color3.fromRGB(25, 60, 110),")
        $lines.Add("    TitleColor = Color3.fromRGB(255, 255, 255),")
        $lines.Add("    VersionColor = Color3.fromRGB(125, 211, 252),")
        $lines.Add("    TabInactiveBg = Color3.fromRGB(8, 28, 65),")
        $lines.Add("    TabInactiveBorder = Color3.fromRGB(25, 75, 130),")
        $lines.Add("    TabInactiveText = Color3.fromRGB(150, 200, 255),")
        $lines.Add("    ActiveBg = Color3.fromRGB(12, 80, 150),")
        $lines.Add("    ActiveBorder = Color3.fromRGB(56, 189, 248),")
        $lines.Add("    ActiveText = Color3.fromRGB(255, 255, 255),")
        $lines.Add("    ComponentBg = Color3.fromRGB(10, 35, 75),")
        $lines.Add("    ComponentBorder = Color3.fromRGB(30, 85, 145),")
        $lines.Add("    GlowCyan = Color3.fromRGB(56, 189, 248),")
        $lines.Add("    GlowPurple = Color3.fromRGB(129, 140, 248),")
        $lines.Add("    GlowGreen = Color3.fromRGB(52, 211, 153),")
        $lines.Add("    GlowYellow = Color3.fromRGB(251, 191, 36)")
        $lines.Add("}")
        $lines.Add("")
        $lines.Add("function Module.AddCornerGlow(instance, color, size, zIndex, transparency)")
        $lines.Add("    local Glow = Instance.new(`"ImageLabel`")")
        $lines.Add("    Glow.Name = `"CornerGlow`"")
        $lines.Add("    Glow.Size = size or UDim2.new(0, 240, 0, 240)")
        $lines.Add("    Glow.BackgroundTransparency = 1")
        $lines.Add("    Glow.Image = `"rbxassetid://5028857484`"")
        $lines.Add("    Glow.ImageColor3 = color or Module.Theme.GlowCyan")
        $lines.Add("    Glow.ImageTransparency = transparency or 0.02")
        $lines.Add("    Glow.ZIndex = zIndex or 1")
        $lines.Add("    Glow.Parent = instance")
        $lines.Add("    return Glow")
        $lines.Add("end")
        $lines.Add("")

        1..35 | ForEach-Object {
            $mIdx = $_
            $lines.Add("function Module.ExecuteFeature_${mIdx}_${idx}(parent, options)")
            $lines.Add("    options = options or {}")
            $lines.Add("    local frame = Instance.new(`"Frame`")")
            $lines.Add("    frame.Name = `"Elem_${mIdx}_${idx}`"")
            $lines.Add("    frame.Size = UDim2.new(1, -10, 0, 38)")
            $lines.Add("    frame.BackgroundColor3 = Module.Theme.ComponentBg")
            $lines.Add("    frame.BorderSizePixel = 0")
            $lines.Add("    frame.Parent = parent")
            $lines.Add("    Instance.new(`"UICorner`", frame).CornerRadius = UDim.new(0, 8)")
            $lines.Add("    local stroke = Instance.new(`"UIStroke`", frame)")
            $lines.Add("    stroke.Color = Module.Theme.ComponentBorder")
            $lines.Add("    local icon = Instance.new(`"ImageLabel`", frame)")
            $lines.Add("    icon.Size = UDim2.new(0, 20, 0, 20)")
            $lines.Add("    icon.Position = UDim2.new(0, 10, 0.5, -10)")
            $lines.Add("    icon.BackgroundTransparency = 1")
            $lines.Add("    icon.Image = `"rbxassetid://84718341622420`"")
            $lines.Add("    icon.ImageColor3 = Module.Theme.VersionColor")
            $lines.Add("    local label = Instance.new(`"TextLabel`", frame)")
            $lines.Add("    label.Size = UDim2.new(1, -40, 1, 0)")
            $lines.Add("    label.Position = UDim2.new(0, 36, 0, 0)")
            $lines.Add("    label.BackgroundTransparency = 1")
            $lines.Add("    label.Text = (options.Name or `"Feature $mIdx`") .. `" [$f Module $idx]`"")
            $lines.Add("    label.TextColor3 = Module.Theme.TitleColor")
            $lines.Add("    label.Font = Enum.Font.GothamMedium")
            $lines.Add("    label.TextSize = 13")
            $lines.Add("    label.TextXAlignment = Enum.TextXAlignment.Left")
            $lines.Add("    return frame")
            $lines.Add("end")
            $lines.Add("")
        }

        $lines.Add("return Module")
        [System.IO.File]::WriteAllLines($filePath, $lines)
    }
}
