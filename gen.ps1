$targetDir = "C:\Users\xenof\OneDrive\Documents\oceanhub\MainUI\UI\Library\Components"

1..25 | ForEach-Object {
    $idx = $_
    $file = Join-Path $targetDir ("Pack" + $idx + ".lua")
    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add("--[[ OceanHub UI Components Pack $idx -- Midnight Ocean Theme ]]")
    $lines.Add('local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/OceanUltimate/OceanHub/main/MainUI/UI/Library/Components/Theme.lua"))() or {}')
    $lines.Add('local Pack = {}')
    $lines.Add("Pack.ID = $idx")
    $lines.Add('Pack.ThemeName = "Midnight Ocean"')
    $lines.Add('Pack.GlowColors = {Theme.Colors.GlowCyan, Theme.Colors.GlowPurple, Theme.Colors.GlowGreen, Theme.Colors.GlowYellow}')
    
    1..25 | ForEach-Object {
        $j = $_
        $lines.Add("function Pack.CreateElement_${j}_P${idx}(parent, options)")
        $lines.Add('    options = options or {}')
        $lines.Add('    local frame = Instance.new("Frame")')
        $lines.Add("    frame.Name = `"Elem_${j}_P${idx}`"")
        $lines.Add('    frame.Size = UDim2.new(1, -10, 0, 36)')
        $lines.Add('    frame.BackgroundColor3 = Theme.Colors.ComponentBg')
        $lines.Add('    frame.BorderSizePixel = 0')
        $lines.Add('    frame.Parent = parent')
        $lines.Add('    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)')
        $lines.Add('    local stroke = Instance.new("UIStroke", frame)')
        $lines.Add('    stroke.Color = Theme.Colors.ComponentBorder')
        $lines.Add('    local icon = Instance.new("ImageLabel", frame)')
        $lines.Add('    icon.Size = UDim2.new(0, 18, 0, 18)')
        $lines.Add('    icon.Position = UDim2.new(0, 8, 0.5, -9)')
        $lines.Add('    icon.BackgroundTransparency = 1')
        $lines.Add('    icon.Image = Theme.Icons.Button')
        $lines.Add('    icon.ImageColor3 = Theme.Colors.SubTitleColor')
        $lines.Add('    local lbl = Instance.new("TextLabel", frame)')
        $lines.Add('    lbl.Size = UDim2.new(1, -35, 1, 0)')
        $lines.Add('    lbl.Position = UDim2.new(0, 30, 0, 0)')
        $lines.Add('    lbl.BackgroundTransparency = 1')
        $lines.Add("    lbl.Text = (options.Name or `"Element $j`") .. `" [Pack $idx]`"")
        $lines.Add('    lbl.TextColor3 = Theme.Colors.TextColor')
        $lines.Add('    lbl.TextSize = 12')
        $lines.Add('    lbl.Font = Enum.Font.GothamMedium')
        $lines.Add('    lbl.TextXAlignment = Enum.TextXAlignment.Left')
        $lines.Add('    return frame')
        $lines.Add('end')
    }
    
    1..20 | ForEach-Object {
        $k = $_
        $lines.Add("function Pack.Utility_${k}_P${idx}(input)")
        $lines.Add('    local res = {}')
        $lines.Add('    res.Input = input')
        $lines.Add("    res.Pack = $idx")
        $lines.Add("    res.UtilityIndex = $k")
        $lines.Add('    res.Color = Theme.Colors.BgColor')
        $lines.Add('    return res')
        $lines.Add('end')
    }
    
    $lines.Add('return Pack')
    [System.IO.File]::WriteAllLines($file, $lines)
}
