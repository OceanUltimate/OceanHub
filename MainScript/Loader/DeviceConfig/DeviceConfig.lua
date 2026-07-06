local UIS = game:GetService("UserInputService")

local presets = {
    PC     = { scale=1.0,  cardWidth=420, cardHeight=320, fontSize=15, isMobile=false },
    Laptop = { scale=0.92, cardWidth=400, cardHeight=310, fontSize=14, isMobile=false },
    Mac    = { scale=0.96, cardWidth=410, cardHeight=315, fontSize=14, isMobile=false },
    HP     = { scale=0.82, cardWidth=340, cardHeight=280, fontSize=13, isMobile=true  },
}

local function detect()
    if UIS.TouchEnabled and not UIS.KeyboardEnabled then return "HP" end
    local w = workspace.CurrentCamera.ViewportSize.X
    if w >= 1920 then return "PC"
    elseif w >= 1440 then return "Mac"
    elseif w >= 1280 then return "Laptop"
    else return "HP" end
end

local cfg = presets[detect()]
cfg.type = detect()
return cfg
