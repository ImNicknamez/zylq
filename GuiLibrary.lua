--//credits monia//configsystem,function and whitelist//7granddad//vapentity//i will protect it soons in next update
    local GuiLibrary = {
        Settings = {}
    }
    function writeassets(text)
        local textlabel = Instance.new("TextLabel")
        textlabel.Size = UDim2.new(1, 0, 0, 36)
        textlabel.Text = "Downloading "..text
        textlabel.BackgroundTransparency = 1
        textlabel.TextStrokeTransparency = 0
        textlabel.TextSize = 30
        textlabel.Font = Enum.Font.SourceSans
        textlabel.TextColor3 = Color3.new(1, 1, 1)
        textlabel.Position = UDim2.new(0, 0, 0, -36)
        textlabel.Parent = game.CoreGui.RobloxGui
    end
    local ZylqAssetsTable = {
        ["Zylq/assets/Logo.png"] = "rbxassetid://14049259616"
    }
    if not isfolder("Zylq") then
        makefolder("Zylq")
        writeassets("Zylq/")
    end
    local ScreenGui
    local configsystem = true
    local lplr = game.Players.LocalPlayer

    function warningNotification(name, text, time)
		local notification = Instance.new("ScreenGui")
		local NotifyFrame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local LabelFrame = Instance.new("Frame")
		local UICorner_2 = Instance.new("UICorner")
		local Label = Instance.new("TextLabel")
		local ColorEnable = Instance.new("Frame")
		local EnableLabel = Instance.new("TextLabel")
		
		--Properties:
		
		notification.Name = "notification"
		notification.Parent = game.CoreGui
		notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		
		NotifyFrame.Name = "Notify Frame"
		NotifyFrame.Parent = notification
		NotifyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		NotifyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NotifyFrame.BorderSizePixel = 0
		NotifyFrame.Position = UDim2.new(0.841645896, 0, 0.411764711, 0)
		NotifyFrame.Size = UDim2.new(0, 239, 0, 150)
		
		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = NotifyFrame
		
		LabelFrame.Name = "LabelFrame"
		LabelFrame.Parent = NotifyFrame
		LabelFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		LabelFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		LabelFrame.BorderSizePixel = 0
		LabelFrame.Position = UDim2.new(0, 0, -0.00156860356, 0)
		LabelFrame.Size = UDim2.new(0, 238, 0, 39)
		
		UICorner_2.CornerRadius = UDim.new(0, 3)
		UICorner_2.Parent = LabelFrame
		
		Label.Name = "Label"
		Label.Parent = LabelFrame
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Label.BorderSizePixel = 0
		Label.Position = UDim2.new(0, 0, 0.128205135, 0)
		Label.Size = UDim2.new(0, 238, 0, 28)
		Label.Font = Enum.Font.Unknown
		Label.Text = name
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 20.000
		
		ColorEnable.Name = "ColorEnable"
		ColorEnable.Parent = NotifyFrame
		ColorEnable.BackgroundColor3 = Color3.fromRGB(50,205,50)
		ColorEnable.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ColorEnable.BorderSizePixel = 0
		ColorEnable.Position = UDim2.new(0, 0, 0.933333337, 0)
		ColorEnable.Size = UDim2.new(0, 239, 0, 10)
		
		EnableLabel.Name = "EnableLabel"
		EnableLabel.Parent = NotifyFrame
		EnableLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		EnableLabel.BackgroundTransparency = 1.000
		EnableLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		EnableLabel.BorderSizePixel = 0
		EnableLabel.Position = UDim2.new(0, 0, 0.333333343, 0)
		EnableLabel.Size = UDim2.new(0, 238, 0, 50)
		EnableLabel.Font = Enum.Font.Arial
		EnableLabel.Text = text
		EnableLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		EnableLabel.TextSize = 26.000
        wait(time)
        notification:Destroy()
    end

	ScreenGui = Instance.new("ScreenGui")
	local Highlights = Instance.new("Frame")
	local tab = Instance.new("Frame")
	local forlabel = Instance.new("Frame")
	local MainText = Instance.new("TextLabel")
	local MainImage = Instance.new("ImageLabel")
	local combat = Instance.new("ScrollingFrame")
	local Highlights_2 = Instance.new("Frame")
	local tab_2 = Instance.new("Frame")
	local forlabel_2 = Instance.new("Frame")
	local MainText_2 = Instance.new("TextLabel")
	local MainImage_2 = Instance.new("ImageLabel")
	local blatant = Instance.new("ScrollingFrame")
	local Highlights_3 = Instance.new("Frame")
	local tab_3 = Instance.new("Frame")
	local forlabel_3 = Instance.new("Frame")
	local MainText_3 = Instance.new("TextLabel")
	local MainImage_3 = Instance.new("ImageLabel")
	local visual = Instance.new("ScrollingFrame")
	local Highlights_4 = Instance.new("Frame")
	local tab_4 = Instance.new("Frame")
	local forlabel_4 = Instance.new("Frame")
	local MainText_4 = Instance.new("TextLabel")
	local MainImage_4 = Instance.new("ImageLabel")
	local world = Instance.new("ScrollingFrame")
	local Highlights_5 = Instance.new("Frame")
	local tab_5 = Instance.new("Frame")
	local forlabel_5 = Instance.new("Frame")
	local MainText_5 = Instance.new("TextLabel")
	local MainImage_5 = Instance.new("ImageLabel")
	local misc = Instance.new("ScrollingFrame")
	local lsu1 = Instance.new("UIListLayout")
	local lsu2 = Instance.new("UIListLayout")
	local lsu3 = Instance.new("UIListLayout")
	local lsu4 = Instance.new("UIListLayout")
	local lsu5 = Instance.new("UIListLayout")
	local dim = Instance.new("Frame")

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true

    dim.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    dim.Parent = ScreenGui
    dim.BackgroundTransparency = 0.5
    dim.Size = UDim2.new(1, 0, 1, 0)

    Highlights.Name = "Highlights"
    Highlights.Parent = ScreenGui
    Highlights.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
    Highlights.BackgroundTransparency = 0.400
    Highlights.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Highlights.BorderSizePixel = 0
    Highlights.Position = UDim2.new(0.179414198, 0, 0.204627052, 0)
    Highlights.Size = UDim2.new(0, 214, 0, 481)
    Highlights.Active = true
    Highlights.Draggable = true

    tab.Name = "tab"
    tab.Parent = Highlights
    tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tab.BorderSizePixel = 0
    tab.Position = UDim2.new(0.0174689721, 0, 0.00953766517, 0)
    tab.Size = UDim2.new(0, 206, 0, 472)

    forlabel.Name = "forlabel"
    forlabel.Parent = tab
    forlabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    forlabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    forlabel.BorderSizePixel = 0
    forlabel.Size = UDim2.new(0, 206, 0, 36)

    MainText.Name = "MainText"
    MainText.Parent = forlabel
    MainText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainText.BackgroundTransparency = 1.000
    MainText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainText.BorderSizePixel = 0
    MainText.Position = UDim2.new(0.0582524277, 0, 0, 0)
    MainText.Size = UDim2.new(0, 194, 0, 36)
    MainText.Font = Enum.Font.SourceSans
    MainText.Text = "Combat"
    MainText.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainText.TextSize = 30.000
    MainText.TextXAlignment = Enum.TextXAlignment.Left

    MainImage.Name = "MainImage"
    MainImage.Parent = forlabel
    MainImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainImage.BackgroundTransparency = 1.000
    MainImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainImage.BorderSizePixel = 0
    MainImage.Position = UDim2.new(0.810679615, 0, 0.0833333358, 0)
    MainImage.Size = UDim2.new(0, 30, 0, 30)
    MainImage.Image = "rbxassetid://13799913671"

    combat.Name = "combat"
    combat.Parent = tab
    combat.Active = true
    combat.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    combat.BorderColor3 = Color3.fromRGB(0, 0, 0)
    combat.BorderSizePixel = 0
    combat.Position = UDim2.new(0, 0, 0.0764332116, 0)
    combat.Size = UDim2.new(0, 206, 0, 434)
    combat.ScrollBarThickness = 0

    lsu1.Parent = combat
    lsu1.HorizontalAlignment = Enum.HorizontalAlignment.Center
    lsu1.SortOrder = Enum.SortOrder.LayoutOrder

    Highlights_2.Name = "Highlights"
    Highlights_2.Parent = ScreenGui
    Highlights_2.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
    Highlights_2.BackgroundTransparency = 0.400
    Highlights_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Highlights_2.BorderSizePixel = 0
    Highlights_2.Position = UDim2.new(0.310740381, 0, 0.204212338, 0)
    Highlights_2.Size = UDim2.new(0, 214, 0, 481)
    Highlights_2.Active = true
    Highlights_2.Draggable = true

    tab_2.Name = "tab"
    tab_2.Parent = Highlights_2
    tab_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tab_2.BorderSizePixel = 0
    tab_2.Position = UDim2.new(0.0170000009, 0, 0.00999999978, 0)
    tab_2.Size = UDim2.new(0, 206, 0, 472)

    forlabel_2.Name = "forlabel"
    forlabel_2.Parent = tab_2
    forlabel_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    forlabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    forlabel_2.BorderSizePixel = 0
    forlabel_2.Size = UDim2.new(0, 206, 0, 36)

    MainText_2.Name = "MainText"
    MainText_2.Parent = forlabel_2
    MainText_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainText_2.BackgroundTransparency = 1.000
    MainText_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainText_2.BorderSizePixel = 0
    MainText_2.Position = UDim2.new(0.0582524277, 0, 0, 0)
    MainText_2.Size = UDim2.new(0, 194, 0, 36)
    MainText_2.Font = Enum.Font.SourceSans
    MainText_2.Text = "blatant"
    MainText_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainText_2.TextSize = 30.000
    MainText_2.TextXAlignment = Enum.TextXAlignment.Left

    MainImage_2.Name = "MainImage"
    MainImage_2.Parent = forlabel_2
    MainImage_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainImage_2.BackgroundTransparency = 1.000
    MainImage_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainImage_2.BorderSizePixel = 0
    MainImage_2.Position = UDim2.new(0.810679615, 0, 0.0833333358, 0)
    MainImage_2.Size = UDim2.new(0, 30, 0, 30)
    MainImage_2.Image = "rbxassetid://13800390062"

    blatant.Name = "blatant"
    blatant.Parent = tab_2
    blatant.Active = true
    blatant.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    blatant.BorderColor3 = Color3.fromRGB(0, 0, 0)
    blatant.BorderSizePixel = 0
    blatant.Position = UDim2.new(0, 0, 0.0764331892, 0)
    blatant.Size = UDim2.new(0, 206, 0, 434)
    blatant.ScrollBarThickness = 0

    lsu2.Parent = blatant
    lsu2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    lsu2.SortOrder = Enum.SortOrder.LayoutOrder

    Highlights_3.Name = "Highlights"
    Highlights_3.Parent = ScreenGui
    Highlights_3.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
    Highlights_3.BackgroundTransparency = 0.400
    Highlights_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Highlights_3.BorderSizePixel = 0
    Highlights_3.Position = UDim2.new(0.443691373, 0, 0.204350576, 0)
    Highlights_3.Size = UDim2.new(0, 214, 0, 481)
    Highlights_3.Active = true
    Highlights_3.Draggable = true

    tab_3.Name = "tab"
    tab_3.Parent = Highlights_3
    tab_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tab_3.BorderSizePixel = 0
    tab_3.Position = UDim2.new(0.0170000009, 0, 0.00999999978, 0)
    tab_3.Size = UDim2.new(0, 206, 0, 472)

    forlabel_3.Name = "forlabel"
    forlabel_3.Parent = tab_3
    forlabel_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    forlabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    forlabel_3.BorderSizePixel = 0
    forlabel_3.Size = UDim2.new(0, 206, 0, 36)

    MainText_3.Name = "MainText"
    MainText_3.Parent = forlabel_3
    MainText_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainText_3.BackgroundTransparency = 1.000
    MainText_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainText_3.BorderSizePixel = 0
    MainText_3.Position = UDim2.new(0.0582524277, 0, 0, 0)
    MainText_3.Size = UDim2.new(0, 194, 0, 36)
    MainText_3.Font = Enum.Font.SourceSans
    MainText_3.Text = "Visual"
    MainText_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainText_3.TextSize = 30.000
    MainText_3.TextXAlignment = Enum.TextXAlignment.Left

    MainImage_3.Name = "MainImage"
    MainImage_3.Parent = forlabel_3
    MainImage_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainImage_3.BackgroundTransparency = 1.000
    MainImage_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainImage_3.BorderSizePixel = 0
    MainImage_3.Position = UDim2.new(0.810679615, 0, 0.0833333358, 0)
    MainImage_3.Size = UDim2.new(0, 30, 0, 30)
    MainImage_3.Image = "rbxassetid://13800409501"

    visual.Name = "visual"
    visual.Parent = tab_3
    visual.Active = true
    visual.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    visual.BorderColor3 = Color3.fromRGB(0, 0, 0)
    visual.BorderSizePixel = 0
    visual.Position = UDim2.new(0, 0, 0.0764331892, 0)
    visual.Size = UDim2.new(0, 206, 0, 433)
    visual.ScrollBarThickness = 0

    lsu3.Parent = visual
    lsu3.HorizontalAlignment = Enum.HorizontalAlignment.Center
    lsu3.SortOrder = Enum.SortOrder.LayoutOrder

    Highlights_4.Name = "Highlights"
    Highlights_4.Parent = ScreenGui
    Highlights_4.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
    Highlights_4.BackgroundTransparency = 0.400
    Highlights_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Highlights_4.BorderSizePixel = 0
    Highlights_4.Position = UDim2.new(0.576642394, 0, 0.204350576, 0)
    Highlights_4.Size = UDim2.new(0, 214, 0, 481)
    Highlights_4.Active = true
    Highlights_4.Draggable = true

    tab_4.Name = "tab"
    tab_4.Parent = Highlights_4
    tab_4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tab_4.BorderSizePixel = 0
    tab_4.Position = UDim2.new(0.0170000009, 0, 0.00999999978, 0)
    tab_4.Size = UDim2.new(0, 206, 0, 472)

    forlabel_4.Name = "forlabel"
    forlabel_4.Parent = tab_4
    forlabel_4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    forlabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    forlabel_4.BorderSizePixel = 0
    forlabel_4.Size = UDim2.new(0, 206, 0, 36)

    MainText_4.Name = "MainText"
    MainText_4.Parent = forlabel_4
    MainText_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainText_4.BackgroundTransparency = 1.000
    MainText_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainText_4.BorderSizePixel = 0
    MainText_4.Position = UDim2.new(0.0582524277, 0, 0, 0)
    MainText_4.Size = UDim2.new(0, 194, 0, 36)
    MainText_4.Font = Enum.Font.SourceSans
    MainText_4.Text = "World"
    MainText_4.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainText_4.TextSize = 30.000
    MainText_4.TextXAlignment = Enum.TextXAlignment.Left

    MainImage_4.Name = "MainImage"
    MainImage_4.Parent = forlabel_4
    MainImage_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainImage_4.BackgroundTransparency = 1.000
    MainImage_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainImage_4.BorderSizePixel = 0
    MainImage_4.Position = UDim2.new(0.810679615, 0, 0.0833333358, 0)
    MainImage_4.Size = UDim2.new(0, 30, 0, 30)
    MainImage_4.Image = "rbxassetid://13988608911"

    world.Name = "world"
    world.Parent = tab_4
    world.Active = true
    world.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    world.BorderColor3 = Color3.fromRGB(0, 0, 0)
    world.BorderSizePixel = 0
    world.Position = UDim2.new(0, 0, 0.0764332116, 0)
    world.Size = UDim2.new(0, 206, 0, 436)
    world.ScrollBarThickness = 0

    lsu4.Parent = world
    lsu4.HorizontalAlignment = Enum.HorizontalAlignment.Center
    lsu4.SortOrder = Enum.SortOrder.LayoutOrder

    Highlights_5.Name = "Highlights"
    Highlights_5.Parent = ScreenGui
    Highlights_5.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
    Highlights_5.BackgroundTransparency = 0.400
    Highlights_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Highlights_5.BorderSizePixel = 0
    Highlights_5.Position = UDim2.new(0.706986487, 0, 0.204350516, 0)
    Highlights_5.Size = UDim2.new(0, 214, 0, 481)
    Highlights_5.Active = true
    Highlights_5.Draggable = true

    tab_5.Name = "tab"
    tab_5.Parent = Highlights_5
    tab_5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    tab_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tab_5.BorderSizePixel = 0
    tab_5.Position = UDim2.new(0.0170000009, 0, 0.00999999978, 0)
    tab_5.Size = UDim2.new(0, 206, 0, 472)

    forlabel_5.Name = "forlabel"
    forlabel_5.Parent = tab_5
    forlabel_5.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    forlabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    forlabel_5.BorderSizePixel = 0
    forlabel_5.Size = UDim2.new(0, 206, 0, 36)

    MainText_5.Name = "MainText"
    MainText_5.Parent = forlabel_5
    MainText_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainText_5.BackgroundTransparency = 1.000
    MainText_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainText_5.BorderSizePixel = 0
    MainText_5.Position = UDim2.new(0.0582524277, 0, 0, 0)
    MainText_5.Size = UDim2.new(0, 194, 0, 36)
    MainText_5.Font = Enum.Font.SourceSans
    MainText_5.Text = "Misc"
    MainText_5.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainText_5.TextSize = 30.000
    MainText_5.TextXAlignment = Enum.TextXAlignment.Left

    MainImage_5.Name = "MainImage"
    MainImage_5.Parent = forlabel_5
    MainImage_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainImage_5.BackgroundTransparency = 1.000
    MainImage_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    MainImage_5.BorderSizePixel = 0
    MainImage_5.Position = UDim2.new(0.810679615, 0, 0.0833333358, 0)
    MainImage_5.Size = UDim2.new(0, 30, 0, 30)
    MainImage_5.Image = "rbxassetid://13800287778"

    misc.Name = "misc"
    misc.Parent = tab_5
    misc.Active = true
    misc.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    misc.BorderColor3 = Color3.fromRGB(0, 0, 0)
    misc.BorderSizePixel = 0
    misc.Position = UDim2.new(0, 0, 0.0764331743, 0)
    misc.Size = UDim2.new(0, 206, 0, 435)
    misc.ScrollBarThickness = 0

    lsu5.Parent = misc
    lsu5.HorizontalAlignment = Enum.HorizontalAlignment.Center
    lsu5.SortOrder = Enum.SortOrder.LayoutOrder
    
    -- arraylist
    local array = Instance.new("ScreenGui")
    local arrayframe = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    array.Name = "array"
    array.Parent = game.CoreGui
    array.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    array.ResetOnSpawn = false

    arrayframe.Name = "arrayframe"
    arrayframe.Parent = array
    arrayframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    arrayframe.BackgroundTransparency = 1.000
    arrayframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
    arrayframe.BorderSizePixel = 0
    arrayframe.Position = UDim2.new(0.83291769, 0, 0, 0)
    arrayframe.Size = UDim2.new(0.167082295, 0, 0.939999998, 0)

    UIListLayout.Parent = arrayframe
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local Watermark = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")
    
    Watermark.Name = "Watermark"
    Watermark.Parent = game.CoreGui.RobloxGui
    Watermark.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    ImageButton.Parent = Watermark
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.BackgroundTransparency = 1.000
    ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton.BorderSizePixel = 0
    ImageButton.Size = UDim2.new(0, 280, 0, 159)
    ImageButton.Image = "http://www.roblox.com/asset/?id=14049259595"
    ImageButton.MouseButton1Down:Connect(function()
        if ScreenGui.Enabled == false then
            ScreenGui.Enabled = true
        else
            ScreenGui.Enabled = false
        end
    end)

    local buttonbind = true

    local function OXZPCGS_fake_script() -- HorionGui.GuiBind 
        local script = Instance.new('LocalScript', ScreenGui)
    
        
        local UserInputService = game:GetService("UserInputService")
        local ScreenGui = script.Parent
        
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Insert then
                if ScreenGui.Enabled == false then
                    ScreenGui.Enabled = true
                else
                    ScreenGui.Enabled = false
                end
            end
        end)
        
    end
    coroutine.wrap(OXZPCGS_fake_script)()
    function GuiLibrary:SelfDestruct()
        ScreenGui:Destroy()
        array:Destroy()
        Watermark:Destroy()
        buttonbind = false
        configsystem = false
        warningNotification("Zylq", "Gui SelfDestruct!", 4)
    end


    function GuiLibrary.add(text)
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Parent = arrayframe
        TextLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        TextLabel.BackgroundTransparency = 0.100
        TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabel.BorderSizePixel = 1
        TextLabel.Font = Enum.Font.SourceSans
        TextLabel.Text = text
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 20.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Right

        local textSize = TextLabel.TextBounds
        TextLabel.Size = UDim2.new(0, textSize.X, 0, 23)

        TextLabel.LayoutOrder = -textSize.X
    end

    function GuiLibrary.remove(text)
        local labels = arrayframe:GetChildren()
        for _, label in ipairs(labels) do
            if label:IsA("TextLabel") and label.Text == text then
                label:Destroy()
                break
            end
        end
    end
    function GuiLibrary.CreateOptionsButton(argstable) --> you can add only combat, blatant, visual, misc, world <--
        local TogFunction = {} 
        local toggled = false
        local color = false
        local notification = Instance.new("ScreenGui")

        
        --Properties
        
        notification.Name = "notification"
        notification.Parent = game.CoreGui
        notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local NotifyFrame
        local DefaultT = argstable["Default"] or false
        
        local function saveConfig()
            local configJson = game:GetService("HttpService"):JSONEncode(Settings)
            writefile("ZylqConfig.json", configJson)
        end
        
        local function loadConfig()
            if isfile(configFilePath) then
                local configFileContents = readfile(configFilePath)
                Settings = game:GetService("HttpService"):JSONDecode(configFileContents)
            end
        end
        
        spawn(function()
            repeat
                wait(0.5)
                saveConfig()
            until not configsystem
        end)
        
        local suc, res = pcall(loadConfig)
        if not suc then
            Settings = {}
        end

        local button = Instance.new("TextButton")
        button.Name = "button"
        button.Parent = argstable["Tab"]
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        button.BorderSizePixel = 0
        button.Size = UDim2.new(0, 200, 0, 33)
        button.Text = argstable["Name"] or "button"
        button.Font = Enum.Font.SourceSans
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 21.000
        button.MouseButton1Click:Connect(function()
            toggled = not toggled
            pcall(argstable.Function, toggled)
            if color == false then
                GuiLibrary.add(argstable["Name"])
                button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                color = true
                warningNotification("Module Toggled", argstable["Name"].." Enabled", 2)
            else
                GuiLibrary.remove(argstable["Name"])
                color = false
                button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                warningNotification("Module Toggled", argstable["Name"].." Disabled", 2)
            end
        end)
        
        local TextButton = Instance.new("TextButton")
        TextButton.Parent = button
        TextButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextButton.BorderSizePixel = 0
        TextButton.Position = UDim2.new(0.819999993, 0, 0.120999999, 0)
        TextButton.Size = UDim2.new(0, 28, 0, 24)
        TextButton.Font = Enum.Font.SourceSans
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextScaled = true
        TextButton.Text = "Click to Bind"
        TextButton.TextSize = 14.000
        TextButton.TextWrapped = true
        
        -- Scripts:
        
        local function YJZYDB_fake_script() -- TextButton.LocalScript 
            local script = Instance.new('LocalScript', TextButton)
        
            local UserInputService = game:GetService("UserInputService")
            local TextLabel = script.Parent
            local changeEnabled = false
            local selectedKey = nil
            
            TextLabel.MouseButton1Click:Connect(function()
                changeEnabled = true
            end)
            
            UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    if buttonbind == true then
                    local keyPressed = input.KeyCode.Name
                    if changeEnabled then
                        TextLabel.Text = keyPressed
                        selectedKey = keyPressed
                        changeEnabled = false
                    elseif keyPressed == selectedKey then
                    if toggled == false then
                    	toggled = true
                        color = true    
                        pcall(argstable.Function, toggled)
                        button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                        GuiLibrary.add(argstable["Name"])
                        warningNotification("Module Toggled", argstable["Name"].." Enabled", 3)
                    else
                    	toggled = false
                        color = false
                    	pcall(argstable.Function, toggled)
                        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        GuiLibrary.remove(argstable["Name"])
                        warningNotification("Module Toggled", argstable["Name"].." Disabled", 3)
                    	end
                    end
                end
                end
            end)
            
        end
        coroutine.wrap(YJZYDB_fake_script)()
        

        function TogFunction.ToggleButton(TogOn)
            TogOn = TogOn or toggled
            if TogOn then
                toggled = true
                color = true
                GuiLibrary.add(argstable["Name"])
                pcall(argstable.Function, toggled)
                button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                warningNotification("Module Toggled", argstable["Name"].." Enabled", 3)
            else
                toggled = false
                color = false
                GuiLibrary.remove(argstable["Name"])
                pcall(argstable.Function, toggled)
                button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                warningNotification("Module Toggled", argstable["Name"].." Disabled", 3)
            end
        end
        task.spawn(function()
            if DefaultT then
                TogFunction.ToggleButton(DefaultT)
            end
        end)
        return TogFunction
    end

    local SelfDestruct = GuiLibrary.CreateOptionsButton({
        Name = "SelfDestruct",
        Tab = misc,
        Default = false,
        Function = function(callback)
            if callback then
                GuiLibrary:SelfDestruct()
                SelfDestruct.ToggleButton(false)
            end
        end,
    })
    return GuiLibrary
