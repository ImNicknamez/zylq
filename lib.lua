local Library = {}
function Library.CreateLib()
	local MainScript = Instance.new("ScreenGui")
	local MainGui = Instance.new("Frame")
	local Tabs = Instance.new("Folder")
	local CTab = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local ignore = Instance.new("Frame")
	local ignore_2 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local todrop = Instance.new("Frame")
	local combat = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UICorner_3 = Instance.new("UICorner")
	local BTab = Instance.new("TextButton")
	local UICorner_4 = Instance.new("UICorner")
	local ignore_3 = Instance.new("Frame")
	local ignore_4 = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local TextLabel_3 = Instance.new("TextLabel")
	local todrop_2 = Instance.new("Frame")
	local Blatant = Instance.new("ScrollingFrame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local UICorner_6 = Instance.new("UICorner")
	local VTab = Instance.new("TextButton")
	local UICorner_7 = Instance.new("UICorner")
	local ignore_5 = Instance.new("Frame")
	local ignore_6 = Instance.new("Frame")
	local UICorner_8 = Instance.new("UICorner")
	local TextLabel_4 = Instance.new("TextLabel")
	local todrop_3 = Instance.new("Frame")
	local Visual = Instance.new("ScrollingFrame")
	local UIListLayout_3 = Instance.new("UIListLayout")
	local UICorner_9 = Instance.new("UICorner")
	local WTab = Instance.new("TextButton")
	local UICorner_10 = Instance.new("UICorner")
	local ignore_7 = Instance.new("Frame")
	local ignore_8 = Instance.new("Frame")
	local UICorner_11 = Instance.new("UICorner")
	local TextLabel_5 = Instance.new("TextLabel")
	local todrop_4 = Instance.new("Frame")
	local World = Instance.new("ScrollingFrame")
	local UIListLayout_4 = Instance.new("UIListLayout")
	local UICorner_12 = Instance.new("UICorner")
	local MTab = Instance.new("TextButton")
	local UICorner_13 = Instance.new("UICorner")
	local ignore_9 = Instance.new("Frame")
	local ignore_10 = Instance.new("Frame")
	local UICorner_14 = Instance.new("UICorner")
	local TextLabel_6 = Instance.new("TextLabel")
	local todrop_5 = Instance.new("Frame")
	local Misc = Instance.new("ScrollingFrame")
	local UIListLayout_5 = Instance.new("UIListLayout")
	local UICorner_15 = Instance.new("UICorner")
	local MainGuiYK = Instance.new("Folder")
	local Main = Instance.new("Frame")
	local UICorner_16 = Instance.new("UICorner")
	local Main_2 = Instance.new("Frame")
	local UICorner_17 = Instance.new("UICorner")
	local ForLabel = Instance.new("Frame")
	local TextLabel_7 = Instance.new("TextLabel")
	local UICorner_18 = Instance.new("UICorner")
	local ImageButton = Instance.new("ImageButton")
	local buttonsyk = Instance.new("Frame")
	local here = Instance.new("Frame")
	local TextButton = Instance.new("TextButton")
	local UIListLayout_6 = Instance.new("UIListLayout")
	local TextButton_2 = Instance.new("TextButton")
	local TextButton_3 = Instance.new("TextButton")
	local TextButton_4 = Instance.new("TextButton")
	local TextButton_5 = Instance.new("TextButton")
	local takiecos = Instance.new("Frame")
	local TextLabel_8 = Instance.new("TextLabel")
	local Watermarkset = Instance.new("TextButton")
	local arraylist = Instance.new("TextButton")
	local Notification = Instance.new("TextButton")
	local Settings = Instance.new("Frame")
	local UICorner_19 = Instance.new("UICorner")
	local LabelFrame = Instance.new("Frame")
	local TextLabel_9 = Instance.new("TextLabel")
	local UICorner_20 = Instance.new("UICorner")
	local Icon = Instance.new("ImageButton")
	local Uninject = Instance.new("TextButton")
	local UICorner_21 = Instance.new("UICorner")
	local txt = Instance.new("TextButton")
	local UICorner_22 = Instance.new("UICorner")
	local watermark = Instance.new("Frame")
	local FPSCHECK = Instance.new("TextLabel")
	local PingCheck = Instance.new("TextLabel")
	local UIGradient = Instance.new("UIGradient")
	local UICorner_23 = Instance.new("UICorner")
	local arrayframe_2 = Instance.new("Frame")
	local UIGradient_2 = Instance.new("UIGradient")
	local UICorner_24 = Instance.new("UICorner")
	
	
	MainScript.Name = "MainScript"
	MainScript.Parent = game.CoreGui
	MainScript.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	local button = Instance.new("TextButton")
	button.Position = UDim2.new(1, -30, 0, 0)
	button.Text = "Zylq"
	button.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Size = UDim2.new(0, 30, 0, 20)
	button.BorderSizePixel = 0
	button.BackgroundTransparency = 0.5
	button.Parent = game.CoreGui
	button.MouseButton1Click:Connect(function()
		if MainScript.Enabled == false then
			MainScript = true
		else
			MainScript = false
		end
	end)
	
	MainGui.Name = "MainGui"
	MainGui.Parent = MainScript
	MainGui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainGui.BackgroundTransparency = 1.000
	MainGui.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainGui.BorderSizePixel = 0
	MainGui.Size = UDim2.new(1, 0, 1, 0)
	
	Tabs.Name = "Tabs"
	Tabs.Parent = MainGui
	
	CTab.Name = "CTab"
	CTab.Parent = Tabs
	CTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	CTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CTab.BorderSizePixel = 0
	CTab.Position = UDim2.new(0.185088634, 0, 0.144417465, 0)
	CTab.Selectable = false
	CTab.Size = UDim2.new(0, 209, 0, 42)
	CTab.Font = Enum.Font.SourceSans
	CTab.Text = ""
	CTab.TextColor3 = Color3.fromRGB(0, 0, 0)
	CTab.TextSize = 14.000
	
	UICorner.Parent = CTab
	
	ignore.Name = "ignore"
	ignore.Parent = CTab
	ignore.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore.BorderSizePixel = 0
	ignore.Position = UDim2.new(0, 0, 0.238095239, 0)
	ignore.Size = UDim2.new(0, 209, 0, 33)
	
	ignore_2.Name = "ignore"
	ignore_2.Parent = CTab
	ignore_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_2.BorderSizePixel = 0
	ignore_2.Size = UDim2.new(0, 209, 0, 17)
	
	UICorner_2.Parent = ignore_2
	
	TextLabel.Parent = CTab
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(0, 200, 0, 38)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = "   Combat"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 25.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	
	todrop.Name = "todrop"
	todrop.Parent = CTab
	todrop.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	todrop.BorderColor3 = Color3.fromRGB(0, 0, 0)
	todrop.BorderSizePixel = 0
	todrop.Position = UDim2.new(0, 0, 0.90476191, 0)
	todrop.Size = UDim2.new(0, 209, 0, 357)
	todrop.ZIndex = 0
	
	combat.Name = "combat"
	combat.Parent = todrop
	combat.Active = true
	combat.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	combat.BorderColor3 = Color3.fromRGB(0, 0, 0)
	combat.BorderSizePixel = 0
	combat.Position = UDim2.new(0, 0, 0.0112045109, 0)
	combat.Size = UDim2.new(0, 208, 0, 348)
	combat.ScrollBarThickness = 0
	
	UIListLayout.Parent = combat
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	
	
	UICorner_3.Parent = todrop
	
	BTab.Name = "BTab"
	BTab.Parent = Tabs
	BTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	BTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	BTab.BorderSizePixel = 0
	BTab.Position = UDim2.new(0.300000012, 0, 0.143999994, 0)
	BTab.Selectable = false
	BTab.Size = UDim2.new(0, 209, 0, 42)
	BTab.Font = Enum.Font.SourceSans
	BTab.Text = ""
	BTab.TextColor3 = Color3.fromRGB(0, 0, 0)
	BTab.TextSize = 14.000
	
	UICorner_4.Parent = BTab
	
	ignore_3.Name = "ignore"
	ignore_3.Parent = BTab
	ignore_3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_3.BorderSizePixel = 0
	ignore_3.Position = UDim2.new(0, 0, 0.238095239, 0)
	ignore_3.Size = UDim2.new(0, 209, 0, 33)
	
	ignore_4.Name = "ignore"
	ignore_4.Parent = BTab
	ignore_4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_4.BorderSizePixel = 0
	ignore_4.Size = UDim2.new(0, 209, 0, 17)
	
	UICorner_5.Parent = ignore_4
	
	TextLabel_3.Parent = BTab
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_3.BorderSizePixel = 0
	TextLabel_3.Size = UDim2.new(0, 200, 0, 38)
	TextLabel_3.Font = Enum.Font.SourceSans
	TextLabel_3.Text = "   Blatant"
	TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.TextSize = 25.000
	TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
	
	todrop_2.Name = "todrop"
	todrop_2.Parent = BTab
	todrop_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	todrop_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	todrop_2.BorderSizePixel = 0
	todrop_2.Position = UDim2.new(0, 0, 0.90476191, 0)
	todrop_2.Size = UDim2.new(0, 209, 0, 357)
	todrop_2.ZIndex = 0
	
	Blatant.Name = "Blatant"
	Blatant.Parent = todrop_2
	Blatant.Active = true
	Blatant.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Blatant.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Blatant.BorderSizePixel = 0
	Blatant.Position = UDim2.new(0, 0, 0.0112045109, 0)
	Blatant.Size = UDim2.new(0, 208, 0, 348)
	Blatant.ScrollBarThickness = 0
	
	UIListLayout_2.Parent = Blatant
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	
	UICorner_6.Parent = todrop_2
	
	VTab.Name = "VTab"
	VTab.Parent = Tabs
	VTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	VTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	VTab.BorderSizePixel = 0
	VTab.Position = UDim2.new(0.526000023, 0, 0.143999994, 0)
	VTab.Selectable = false
	VTab.Size = UDim2.new(0, 209, 0, 42)
	VTab.Font = Enum.Font.SourceSans
	VTab.Text = ""
	VTab.TextColor3 = Color3.fromRGB(0, 0, 0)
	VTab.TextSize = 14.000
	
	UICorner_7.Parent = VTab
	
	ignore_5.Name = "ignore"
	ignore_5.Parent = VTab
	ignore_5.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_5.BorderSizePixel = 0
	ignore_5.Position = UDim2.new(0, 0, 0.238095239, 0)
	ignore_5.Size = UDim2.new(0, 209, 0, 33)
	
	ignore_6.Name = "ignore"
	ignore_6.Parent = VTab
	ignore_6.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_6.BorderSizePixel = 0
	ignore_6.Size = UDim2.new(0, 209, 0, 17)
	
	UICorner_8.Parent = ignore_6
	
	TextLabel_4.Parent = VTab
	TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_4.BackgroundTransparency = 1.000
	TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_4.BorderSizePixel = 0
	TextLabel_4.Size = UDim2.new(0, 200, 0, 38)
	TextLabel_4.Font = Enum.Font.SourceSans
	TextLabel_4.Text = "   Visual"
	TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_4.TextSize = 25.000
	TextLabel_4.TextXAlignment = Enum.TextXAlignment.Left
	
	todrop_3.Name = "todrop"
	todrop_3.Parent = VTab
	todrop_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	todrop_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	todrop_3.BorderSizePixel = 0
	todrop_3.Position = UDim2.new(0, 0, 0.90476191, 0)
	todrop_3.Size = UDim2.new(0, 209, 0, 357)
	todrop_3.ZIndex = 0
	
	Visual.Name = "Visual"
	Visual.Parent = todrop_3
	Visual.Active = true
	Visual.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Visual.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Visual.BorderSizePixel = 0
	Visual.Position = UDim2.new(0, 0, 0.0112045109, 0)
	Visual.Size = UDim2.new(0, 208, 0, 348)
	Visual.ScrollBarThickness = 0
	
	UIListLayout_3.Parent = Visual
	UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
	
	UICorner_9.Parent = todrop_3
	
	WTab.Name = "WTab"
	WTab.Parent = Tabs
	WTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	WTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	WTab.BorderSizePixel = 0
	WTab.Position = UDim2.new(0.412999988, 0, 0.143999994, 0)
	WTab.Selectable = false
	WTab.Size = UDim2.new(0, 209, 0, 42)
	WTab.Font = Enum.Font.SourceSans
	WTab.Text = ""
	WTab.TextColor3 = Color3.fromRGB(0, 0, 0)
	WTab.TextSize = 14.000
	
	UICorner_10.Parent = WTab
	
	ignore_7.Name = "ignore"
	ignore_7.Parent = WTab
	ignore_7.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_7.BorderSizePixel = 0
	ignore_7.Position = UDim2.new(0, 0, 0.238095239, 0)
	ignore_7.Size = UDim2.new(0, 209, 0, 33)
	
	ignore_8.Name = "ignore"
	ignore_8.Parent = WTab
	ignore_8.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_8.BorderSizePixel = 0
	ignore_8.Size = UDim2.new(0, 209, 0, 17)
	
	UICorner_11.Parent = ignore_8
	
	TextLabel_5.Parent = WTab
	TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_5.BackgroundTransparency = 1.000
	TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_5.BorderSizePixel = 0
	TextLabel_5.Size = UDim2.new(0, 200, 0, 38)
	TextLabel_5.Font = Enum.Font.SourceSans
	TextLabel_5.Text = "   World"
	TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_5.TextSize = 25.000
	TextLabel_5.TextXAlignment = Enum.TextXAlignment.Left
	
	todrop_4.Name = "todrop"
	todrop_4.Parent = WTab
	todrop_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	todrop_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	todrop_4.BorderSizePixel = 0
	todrop_4.Position = UDim2.new(0, 0, 0.90476191, 0)
	todrop_4.Size = UDim2.new(0, 209, 0, 357)
	todrop_4.ZIndex = 0
	
	World.Name = "World"
	World.Parent = todrop_4
	World.Active = true
	World.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	World.BorderColor3 = Color3.fromRGB(0, 0, 0)
	World.BorderSizePixel = 0
	World.Position = UDim2.new(0, 0, 0.0112045109, 0)
	World.Size = UDim2.new(0, 208, 0, 348)
	World.ScrollBarThickness = 0
	
	UIListLayout_4.Parent = World
	UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
	
	UICorner_12.Parent = todrop_4
	
	MTab.Name = "MTab"
	MTab.Parent = Tabs
	MTab.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MTab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MTab.BorderSizePixel = 0
	MTab.Position = UDim2.new(0.638000011, 0, 0.143999994, 0)
	MTab.Selectable = false
	MTab.Size = UDim2.new(0, 209, 0, 42)
	MTab.Font = Enum.Font.SourceSans
	MTab.Text = ""
	MTab.TextColor3 = Color3.fromRGB(0, 0, 0)
	MTab.TextSize = 14.000
	
	UICorner_13.Parent = MTab
	
	ignore_9.Name = "ignore"
	ignore_9.Parent = MTab
	ignore_9.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_9.BorderSizePixel = 0
	ignore_9.Position = UDim2.new(0, 0, 0.238095239, 0)
	ignore_9.Size = UDim2.new(0, 209, 0, 33)
	
	ignore_10.Name = "ignore"
	ignore_10.Parent = MTab
	ignore_10.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ignore_10.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ignore_10.BorderSizePixel = 0
	ignore_10.Size = UDim2.new(0, 209, 0, 17)
	
	UICorner_14.Parent = ignore_10
	
	TextLabel_6.Parent = MTab
	TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_6.BackgroundTransparency = 1.000
	TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_6.BorderSizePixel = 0
	TextLabel_6.Position = UDim2.new(0.0191387534, 0, 0.0476190448, 0)
	TextLabel_6.Size = UDim2.new(0, 200, 0, 38)
	TextLabel_6.Font = Enum.Font.SourceSans
	TextLabel_6.Text = "   Misc"
	TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_6.TextSize = 25.000
	TextLabel_6.TextXAlignment = Enum.TextXAlignment.Left
	
	todrop_5.Name = "todrop"
	todrop_5.Parent = MTab
	todrop_5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	todrop_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	todrop_5.BorderSizePixel = 0
	todrop_5.Position = UDim2.new(0, 0, 0.90476191, 0)
	todrop_5.Size = UDim2.new(0, 209, 0, 357)
	todrop_5.ZIndex = 0
	
	Misc.Name = "Misc"
	Misc.Parent = todrop_5
	Misc.Active = true
	Misc.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Misc.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Misc.BorderSizePixel = 0
	Misc.Position = UDim2.new(0, 0, 0.0112045109, 0)
	Misc.Size = UDim2.new(0, 208, 0, 348)
	Misc.ScrollBarThickness = 0
	
	UIListLayout_5.Parent = Misc
	UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
	
	UICorner_15.Parent = todrop_5
	
	MainGuiYK.Name = "MainGuiYK"
	MainGuiYK.Parent = MainGui
	
	Main.Name = "Main"
	Main.Parent = MainGuiYK
	Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Main.BackgroundTransparency = 1.000
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.0526590198, 0, 0.141906872, 0)
	Main.Size = UDim2.new(0, 234, 0, 399)
	
	UICorner_16.CornerRadius = UDim.new(0, 10)
	UICorner_16.Parent = Main
	
	Main_2.Name = "Main"
	Main_2.Parent = Main
	Main_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main_2.BorderSizePixel = 0
	Main_2.Position = UDim2.new(-0.224570647, 0, 0.0021527512, 0)
	Main_2.Size = UDim2.new(0, 234, 0, 399)
	
	UICorner_17.CornerRadius = UDim.new(0, 10)
	UICorner_17.Parent = Main_2
	
	ForLabel.Name = "ForLabel"
	ForLabel.Parent = Main_2
	ForLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ForLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ForLabel.BorderSizePixel = 0
	ForLabel.Size = UDim2.new(0, 233, 0, 42)
	
	TextLabel_7.Parent = ForLabel
	TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_7.BackgroundTransparency = 1.000
	TextLabel_7.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_7.BorderSizePixel = 0
	TextLabel_7.Position = UDim2.new(0.0901287571, 0, 0, 0)
	TextLabel_7.Size = UDim2.new(0, 162, 0, 42)
	TextLabel_7.Font = Enum.Font.SourceSans
	TextLabel_7.Text = "Zylq"
	TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_7.TextSize = 25.000
	TextLabel_7.TextXAlignment = Enum.TextXAlignment.Left
	
	UICorner_18.CornerRadius = UDim.new(0, 10)
	UICorner_18.Parent = ForLabel
	
	ImageButton.Parent = ForLabel
	ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageButton.BackgroundTransparency = 1.000
	ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageButton.BorderSizePixel = 0
	ImageButton.Position = UDim2.new(0.791000009, 0, 0.0710000023, 0)
	ImageButton.Size = UDim2.new(0, 35, 0, 35)
	ImageButton.Image = "rbxassetid://14106409517"
	
	buttonsyk.Name = "buttonsyk"
	buttonsyk.Parent = Main_2
	buttonsyk.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	buttonsyk.BorderColor3 = Color3.fromRGB(0, 0, 0)
	buttonsyk.BorderSizePixel = 0
	buttonsyk.Position = UDim2.new(0.00427350448, 0, 0.106583074, 0)
	buttonsyk.Size = UDim2.new(0, 233, 0, 0)
	
	here.Name = "here"
	here.Parent = buttonsyk
	here.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	here.BorderColor3 = Color3.fromRGB(0, 0, 0)
	here.BorderSizePixel = 0
	here.Position = UDim2.new(0, 0, 0.040253412, 0)
	here.Size = UDim2.new(0, 233, 0, 192)
	
	TextButton.Parent = here
	TextButton.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.BorderSizePixel = 0
	TextButton.Size = UDim2.new(0, 233, 0, 37)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = "     Combat"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextSize = 25.000
	TextButton.TextXAlignment = Enum.TextXAlignment.Left
	
	UIListLayout_6.Parent = here
	UIListLayout_6.SortOrder = Enum.SortOrder.LayoutOrder
	
	TextButton_2.Parent = here
	TextButton_2.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	TextButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_2.BorderSizePixel = 0
	TextButton_2.Size = UDim2.new(0, 233, 0, 37)
	TextButton_2.Font = Enum.Font.SourceSans
	TextButton_2.Text = "     Blatant"
	TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_2.TextSize = 25.000
	TextButton_2.TextXAlignment = Enum.TextXAlignment.Left
	
	TextButton_3.Parent = here
	TextButton_3.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	TextButton_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_3.BorderSizePixel = 0
	TextButton_3.Size = UDim2.new(0, 233, 0, 37)
	TextButton_3.Font = Enum.Font.SourceSans
	TextButton_3.Text = "     Visual"
	TextButton_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_3.TextSize = 25.000
	TextButton_3.TextXAlignment = Enum.TextXAlignment.Left
	
	TextButton_4.Parent = here
	TextButton_4.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	TextButton_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_4.BorderSizePixel = 0
	TextButton_4.Size = UDim2.new(0, 233, 0, 37)
	TextButton_4.Font = Enum.Font.SourceSans
	TextButton_4.Text = "     Misc"
	TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_4.TextSize = 25.000
	TextButton_4.TextXAlignment = Enum.TextXAlignment.Left
	
	local arraylist_2 = Instance.new("Frame")
	arraylist_2.Name = "arraylist"
	arraylist_2.Parent = MainScript
	arraylist_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	arraylist_2.BackgroundTransparency = 1.000
	arraylist_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	arraylist_2.BorderSizePixel = 0
	arraylist_2.Position = UDim2.new(0.568, 0,0, 0)
	arraylist_2.Size = UDim2.new(0.431, 0,0.921, 0)
	
	local UIListLayout_7 = Instance.new("UIListLayout")
	UIListLayout_7.Parent = arraylist_2
	UIListLayout_7.HorizontalAlignment = Enum.HorizontalAlignment.Left
	UIListLayout_7.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_7.Padding = UDim.new(0, 0)
	
	TextButton_5.Parent = here
	TextButton_5.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	TextButton_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextButton_5.BorderSizePixel = 0
	TextButton_5.Position = UDim2.new(-0.00429184549, 0, 0.895833313, 0)
	TextButton_5.Size = UDim2.new(0, 233, 0, 37)
	TextButton_5.Font = Enum.Font.SourceSans
	TextButton_5.Text = "     World"
	TextButton_5.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton_5.TextSize = 25.000
	TextButton_5.TextXAlignment = Enum.TextXAlignment.Left
	
	takiecos.Name = "takiecos"
	takiecos.Parent = Main_2
	takiecos.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	takiecos.BorderColor3 = Color3.fromRGB(0, 0, 0)
	takiecos.BorderSizePixel = 0
	takiecos.Position = UDim2.new(0, 0, 0.568922281, 0)
	takiecos.Size = UDim2.new(0, 233, 0, 25)
	
	TextLabel_8.Parent = takiecos
	TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_8.BackgroundTransparency = 1.000
	TextLabel_8.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_8.BorderSizePixel = 0
	TextLabel_8.Size = UDim2.new(0, 150, 0, 25)
	TextLabel_8.Font = Enum.Font.SourceSans
	TextLabel_8.Text = "   other"
	TextLabel_8.TextColor3 = Color3.fromRGB(140, 140, 140)
	TextLabel_8.TextSize = 24.000
	TextLabel_8.TextXAlignment = Enum.TextXAlignment.Left
	
	Watermarkset.Name = "Watermarkset"
	Watermarkset.Parent = Main_2
	Watermarkset.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	Watermarkset.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Watermarkset.BorderSizePixel = 0
	Watermarkset.Position = UDim2.new(0, 0, 0.649122775, 0)
	Watermarkset.Size = UDim2.new(0, 233, 0, 37)
	Watermarkset.Font = Enum.Font.SourceSans
	Watermarkset.Text = "   Watermark"
	Watermarkset.TextColor3 = Color3.fromRGB(255, 255, 255)
	Watermarkset.TextSize = 25.000
	Watermarkset.TextXAlignment = Enum.TextXAlignment.Left
	
	arraylist.Name = "arraylist"
	arraylist.Parent = Main_2
	arraylist.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	arraylist.BorderColor3 = Color3.fromRGB(0, 0, 0)
	arraylist.BorderSizePixel = 0
	arraylist.Position = UDim2.new(0, 0, 0.75939852, 0)
	arraylist.Size = UDim2.new(0, 233, 0, 37)
	arraylist.Font = Enum.Font.SourceSans
	arraylist.Text = "     arraylist"
	arraylist.TextColor3 = Color3.fromRGB(255, 255, 255)
	arraylist.TextSize = 25.000
	arraylist.TextXAlignment = Enum.TextXAlignment.Left
	local Notification2 = Instance.new("ScreenGui")
	Notification2.Name = "Notification"
	Notification2.Enabled = false
	Notification2.Parent = game.CoreGui
	Notification2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	local Frame = Instance.new("Frame")
	Frame.Parent = Notification2
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.83291769, 0, 0.0447058827, 0)
	Frame.Size = UDim2.new(0.170822948, 0, 0.912941158, 0)
	
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = Frame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(0, 2)
	
	Notification.Name = "Notification"
	Notification.Parent = Main_2
	Notification.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
	Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(0.00427350448, 0, 0.852130353, 0)
	Notification.Size = UDim2.new(0, 233, 0, 37)
	Notification.Font = Enum.Font.SourceSans
	Notification.Text = " Notification"
	Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
	Notification.TextSize = 25.000
	Notification.TextXAlignment = Enum.TextXAlignment.Left
	Notification.MouseButton1Click:Connect(function()
		if Notification2.Enabled == false then
			Notification2.Enabled = true
			Notification.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
		else
			Notification2.Enabled = false
			Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		end
	end)
	
	Settings.Name = "Settings"
	Settings.Parent = Main
	Settings.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(4.98483086, 0, 0.00465901708, 0)
	Settings.Size = UDim2.new(0, 234, 0, 398)
	
	UICorner_19.CornerRadius = UDim.new(0, 10)
	UICorner_19.Parent = Settings
	
	LabelFrame.Name = "LabelFrame"
	LabelFrame.Parent = Settings
	LabelFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	LabelFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LabelFrame.BorderSizePixel = 0
	LabelFrame.Size = UDim2.new(0, 233, 0, 42)
	
	TextLabel_9.Parent = LabelFrame
	TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_9.BackgroundTransparency = 1.000
	TextLabel_9.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_9.BorderSizePixel = 0
	TextLabel_9.Position = UDim2.new(0.0901287571, 0, 0, 0)
	TextLabel_9.Size = UDim2.new(0, 162, 0, 42)
	TextLabel_9.Font = Enum.Font.SourceSans
	TextLabel_9.Text = "GUI Settings"
	TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_9.TextSize = 25.000
	TextLabel_9.TextXAlignment = Enum.TextXAlignment.Left
	
	UICorner_20.CornerRadius = UDim.new(0, 10)
	UICorner_20.Parent = LabelFrame
	
	Icon.Name = "Icon"
	Icon.Parent = LabelFrame
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.791000009, 0, 0.0710000023, 0)
	Icon.Size = UDim2.new(0, 35, 0, 35)
	Icon.Image = "rbxassetid://14106409517"
	
	Uninject.Name = "Uninject"
	Uninject.Parent = Settings
	Uninject.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Uninject.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Uninject.BorderSizePixel = 0
	Uninject.Position = UDim2.new(0.051282052, 0, 0.211055279, 0)
	Uninject.Size = UDim2.new(0, 207, 0, 31)
	Uninject.Font = Enum.Font.SourceSans
	Uninject.Text = "UnInject"
	Uninject.TextColor3 = Color3.fromRGB(255, 255, 255)
	Uninject.TextSize = 25.000
	
	UICorner_21.Parent = Uninject
	
	txt.Name = "txt"
	txt.Parent = Settings
	txt.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	txt.BorderColor3 = Color3.fromRGB(0, 0, 0)
	txt.BorderSizePixel = 0
	txt.Position = UDim2.new(0.051282052, 0, 0.110552765, 0)
	txt.Size = UDim2.new(0, 207, 0, 31)
	txt.Font = Enum.Font.SourceSans
	txt.Text = "TexturePack"
	txt.TextColor3 = Color3.fromRGB(255, 255, 255)
	txt.TextSize = 25.000
	txt.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNicknamez/texturepacks/main/16x16.lua", true))()
	end)
	
	UICorner_22.Parent = txt
	
	watermark.Name = "watermark"
	watermark.Parent = MainScript
	watermark.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	watermark.BackgroundTransparency = 1.000
	watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
	watermark.BorderSizePixel = 0
	watermark.Size = UDim2.new(0, 295, 0, 38)
	
	
	
	FPSCHECK.Name = "FPSCHECK"
	FPSCHECK.Parent = watermark
	FPSCHECK.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FPSCHECK.BackgroundTransparency = 1.000
	FPSCHECK.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FPSCHECK.BorderSizePixel = 0
	FPSCHECK.Position = UDim2.new(0.340874672, 0, 0, 0)
	FPSCHECK.Size = UDim2.new(0, 97, 0, 38)
	FPSCHECK.Font = Enum.Font.SourceSans
	FPSCHECK.Text = "FPS: 420"
	FPSCHECK.TextColor3 = Color3.fromRGB(255, 255, 255)
	FPSCHECK.TextSize = 25.000
	
	PingCheck.Name = "PingCheck"
	PingCheck.Parent = watermark
	PingCheck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PingCheck.BackgroundTransparency = 1.000
	PingCheck.BorderColor3 = Color3.fromRGB(0, 0, 0)
	PingCheck.BorderSizePixel = 0
	PingCheck.Position = UDim2.new(0.672486544, 0, 0, 0)
	PingCheck.Size = UDim2.new(0, 97, 0, 38)
	PingCheck.Font = Enum.Font.SourceSans
	PingCheck.Text = "Ping: 69"
	PingCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
	PingCheck.TextSize = 25.000
	
	
	
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 106, 0)), ColorSequenceKeypoint.new(0.31, Color3.fromRGB(255, 109, 0)), ColorSequenceKeypoint.new(0.69, Color3.fromRGB(255, 220, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 234, 0))}
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.20), NumberSequenceKeypoint.new(1.00, 0.20)}
	UIGradient.Parent = TextLabel_10
	
	UICorner_23.Parent = arrayframe
	-- Scripts:
	local GuiIsOn = true
	local NewBlur = Instance.new('BlurEffect', game.Lighting)
	NewBlur.Enabled = false
	local function IBGHD_fake_script() -- MainScript.LocalScript 
		local script = Instance.new('LocalScript', MainScript)
	
		local UserInputService = game:GetService("UserInputService")
		local tabfolder = script.Parent.MainGui.Tabs
		local screenguiMain = script.Parent.Parent.MainScript
		local ScreenGui = script.Parent.MainGui
		local settingsgui = ScreenGui.MainGuiYK.Main.Settings
		local maingui = ScreenGui.MainGuiYK.Main.Main
		local unj = ScreenGui.MainGuiYK.Main.Settings.Uninject
		local NewBlur = Instance.new('BlurEffect', game.Lighting)
		NewBlur.Size = 25
		ScreenGui.Visible = false
		NewBlur.Enabled = false
		
		settingsgui.Visible = false
		maingui.Visible = true
		
		tabfolder.CTab.Visible = false
		tabfolder.BTab.Visible = false
		tabfolder.VTab.Visible = false
		tabfolder.WTab.Visible = false
		tabfolder.MTab.Visible = false
		
		tabfolder.CTab.Position = UDim2.new(0.185, 0, 0.144, 0)
		tabfolder.BTab.Position = UDim2.new(0.185, 0, 0.144, 0)
		tabfolder.VTab.Position = UDim2.new(0.185, 0, 0.144, 0)
		tabfolder.WTab.Position = UDim2.new(0.185, 0, 0.144, 0)
		tabfolder.MTab.Position = UDim2.new(0.185, 0, 0.144, 0)
		
		
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.Insert then
				if ScreenGui.Visible == false then
					ScreenGui.Visible = true
					NewBlur.Enabled = true
				else
					ScreenGui.Visible = false
					NewBlur.Enabled = false
				end
			end
		end)
		
	end
	coroutine.wrap(IBGHD_fake_script)()
	Uninject.MouseButton1Click:Connect(function()
		MainScript:Destroy()
		Notification:Destroy()
		NewBlur.Enabled = false
		GuiIsOn = false
		buttonbind = false
		NewBlur:Destroy()
	end)
	local function VQGCR_fake_script() -- CTab.LocalScript 
		local script = Instance.new('LocalScript', CTab)
	
		local TweenService = game:GetService("TweenService")
		local todrop = script.Parent.todrop
		local scrolldropyk = todrop.combat
		
		todrop.Size = UDim2.new(0, 209, 0, 0)
		scrolldropyk.Size = UDim2.new(0, 208, 0, 0)
		
		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out, -- EasingDirection
			0,
			false,
			0
		)
		
		local openDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 357)})
		local openDrop2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 348)})
		local CloseDro2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 0)})
		local CloseDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 0)})
		
		local enable = false
		
		script.Parent.MouseButton2Click:Connect(function()
			if not enable then
				openDrop:Play()
				openDrop2:Play()
				enable = true
				todrop.Visible = true
				scrolldropyk.Visible = true
			else
				CloseDrop:Play()
				CloseDro2:Play()
				enable = false
				task.wait(0.3)
				todrop.Visible = false
				scrolldropyk.Visible = false
			end
		end)
	end
	coroutine.wrap(VQGCR_fake_script)()
	
	local function DCWC_fake_script() -- CTab.DragScript 
		local script = Instance.new('LocalScript', CTab)
	
		--from toolbox
		
		local UIS = game:GetService('UserInputService')
		local button = script.Parent
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(button, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		
		button.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = button.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
		
	end
	coroutine.wrap(DCWC_fake_script)()
	local function XSKV_fake_script() -- BTab.LocalScript 
		local script = Instance.new('LocalScript', BTab)
	
		local TweenService = game:GetService("TweenService")
		local todrop = script.Parent.todrop
		local scrolldropyk = todrop.Blatant
		
		todrop.Size = UDim2.new(0, 209, 0, 0)
		scrolldropyk.Size = UDim2.new(0, 208, 0, 0)
		
		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out, -- EasingDirection
			0,
			false,
			0
		)
		
		local openDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 357)})
		local openDrop2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 348)})
		local CloseDro2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 0)})
		local CloseDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 0)})
		
		local enable = false
		
		script.Parent.MouseButton2Click:Connect(function()
			if not enable then
				openDrop:Play()
				openDrop2:Play()
				enable = true
				todrop.Visible = true
				scrolldropyk.Visible = true
			else
				CloseDrop:Play()
				CloseDro2:Play()
				enable = false
				task.wait(0.3)
				todrop.Visible = false
				scrolldropyk.Visible = false
			end
		end)
	end
	coroutine.wrap(XSKV_fake_script)()
	local function QJPLNL_fake_script() -- BTab.DragScript 
		local script = Instance.new('LocalScript', BTab)
	
		--from toolbox
		
		local UIS = game:GetService('UserInputService')
		local button = script.Parent
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(button, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		
		button.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = button.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
		
	end
	coroutine.wrap(QJPLNL_fake_script)()
	local function RQTQCSX_fake_script() -- VTab.LocalScript 
		local script = Instance.new('LocalScript', VTab)
	
		local TweenService = game:GetService("TweenService")
		local todrop = script.Parent.todrop
		local scrolldropyk = todrop.Visual
		
		todrop.Size = UDim2.new(0, 209, 0, 0)
		scrolldropyk.Size = UDim2.new(0, 208, 0, 0)
		
		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out, -- EasingDirection
			0,
			false,
			0
		)
		
		local openDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 357)})
		local openDrop2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 348)})
		local CloseDro2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 0)})
		local CloseDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 0)})
		
		local enable = false
		
		script.Parent.MouseButton2Click:Connect(function()
			if not enable then
				openDrop:Play()
				openDrop2:Play()
				enable = true
				todrop.Visible = true
				scrolldropyk.Visible = true
			else
				CloseDrop:Play()
				CloseDro2:Play()
				enable = false
				task.wait(0.3)
				todrop.Visible = false
				scrolldropyk.Visible = false
			end
		end)
	end
	coroutine.wrap(RQTQCSX_fake_script)()
	function SpeedBoosting(val)
		local hrp = lplr.Character:FindFirstChild("HumanoidRootPart")
		local hum = lplr.Character:FindFirstChild("Humanoid")
		if isnetworkowner(hrp) and hum.MoveDirection.Magnitude > 0 then
			lplr.Character:TranslateBy(hum.MoveDirection * val)
		end 
	end
	local function UWKBX_fake_script() -- VTab.DragScript 
		local script = Instance.new('LocalScript', VTab)
	
		--from toolbox
		
		local UIS = game:GetService('UserInputService')
		local button = script.Parent
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(button, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		
		button.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = button.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
		
	end
	coroutine.wrap(UWKBX_fake_script)()
	local function KLOEGND_fake_script() -- WTab.LocalScript 
		local script = Instance.new('LocalScript', WTab)
	
		local TweenService = game:GetService("TweenService")
		local todrop = script.Parent.todrop
		local scrolldropyk = todrop.World
		
		todrop.Size = UDim2.new(0, 209, 0, 0)
		scrolldropyk.Size = UDim2.new(0, 208, 0, 0)
		
		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out, -- EasingDirection
			0,
			false,
			0
		)
		
		local openDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 357)})
		local openDrop2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 348)})
		local CloseDro2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 0)})
		local CloseDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 0)})
		
		local enable = false
		
		script.Parent.MouseButton2Click:Connect(function()
			if not enable then
				openDrop:Play()
				openDrop2:Play()
				enable = true
				todrop.Visible = true
				scrolldropyk.Visible = true
			else
				CloseDrop:Play()
				CloseDro2:Play()
				enable = false
				task.wait(0.3)
				todrop.Visible = false
				scrolldropyk.Visible = false
			end
		end)
	end
	coroutine.wrap(KLOEGND_fake_script)()
	local function LEGHCZ_fake_script() -- WTab.DragScript 
		local script = Instance.new('LocalScript', WTab)
	
		--from toolbox
		
		local UIS = game:GetService('UserInputService')
		local button = script.Parent
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(button, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		
		button.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = button.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
		
	end
	coroutine.wrap(LEGHCZ_fake_script)()
	local function QFJGWX_fake_script() -- MTab.LocalScript 
		local script = Instance.new('LocalScript', MTab)
	
		local TweenService = game:GetService("TweenService")
		local todrop = script.Parent.todrop
		local scrolldropyk = todrop.Misc
		
		todrop.Size = UDim2.new(0, 209, 0, 0)
		scrolldropyk.Size = UDim2.new(0, 208, 0, 0)
		
		local tweenInfo = TweenInfo.new(
			0.5,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out, -- EasingDirection
			0,
			false,
			0
		)
		
		local openDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 357)})
		local openDrop2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 348)})
		local CloseDro2 = TweenService:Create(scrolldropyk, tweenInfo, {Size = UDim2.new(0, 208, 0, 0)})
		local CloseDrop = TweenService:Create(todrop, tweenInfo, {Size = UDim2.new(0, 209, 0, 0)})
		
		local enable = false
		
		script.Parent.MouseButton2Click:Connect(function()
			if not enable then
				openDrop:Play()
				openDrop2:Play()
				enable = true
				todrop.Visible = true
				scrolldropyk.Visible = true
			else
				CloseDrop:Play()
				CloseDro2:Play()
				enable = false
				task.wait(0.3)
				todrop.Visible = false
				scrolldropyk.Visible = false
			end
		end)
	end
	coroutine.wrap(QFJGWX_fake_script)()
	local function FQTT_fake_script() -- MTab.DragScript 
		local script = Instance.new('LocalScript', MTab)
	
		--from toolbox
		
		local UIS = game:GetService('UserInputService')
		local button = script.Parent
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(button, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		
		button.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = button.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
		
	end
	coroutine.wrap(FQTT_fake_script)()
	local function LVRVQ_fake_script() -- ImageButton.LocalScript 
		local script = Instance.new('LocalScript', ImageButton)
	
		local main = script.Parent.Parent.Parent.Parent.Main
		local settings = script.Parent.Parent.Parent.Parent.Settings
		local thisbtn = script.Parent
		settings.Position = UDim2.new(-0.225, 0 , 0.002, 0)
		
		thisbtn.MouseButton1Click:Connect(function()
			main.Visible = false
			settings.Visible = true
		end)
	end
	coroutine.wrap(LVRVQ_fake_script)()
	local function PGNIRJ_fake_script() -- TextButton.LocalScript 
		local script = Instance.new('LocalScript', TextButton)
	
		local folder = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Tabs
		local thisbtn = script.Parent
		
		thisbtn.MouseButton1Click:Connect(function()
			if folder.CTab.Visible == false then
				folder.CTab.Visible = true
				thisbtn.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			else
				folder.CTab.Visible = false
				thisbtn.BackgroundColor3 = Color3.fromRGB(23,23,23)
			end
		end)
	end
	coroutine.wrap(PGNIRJ_fake_script)()
	local function JBSNJCZ_fake_script() -- TextButton_2.LocalScript 
		local script = Instance.new('LocalScript', TextButton_2)
	
		local folder = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Tabs
		local thisbtn = script.Parent
		
		thisbtn.MouseButton1Click:Connect(function()
			if folder.BTab.Visible == false then
				folder.BTab.Visible = true
				thisbtn.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			else
				folder.BTab.Visible = false
				thisbtn.BackgroundColor3 = Color3.fromRGB(23,23,23)
			end
		end)
	end
	coroutine.wrap(JBSNJCZ_fake_script)()
	local function JLKHV_fake_script() -- TextButton_3.LocalScript 
		local script = Instance.new('LocalScript', TextButton_3)
	
		local folder = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Tabs
		local thisbtn = script.Parent
		
		thisbtn.MouseButton1Click:Connect(function()
			if folder.VTab.Visible == false then
				folder.VTab.Visible = true
				thisbtn.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			else
				folder.VTab.Visible = false
				thisbtn.BackgroundColor3 = Color3.fromRGB(23,23,23)
			end
		end)
	end
	coroutine.wrap(JLKHV_fake_script)()
	local function YXDCQ_fake_script() -- TextButton_4.LocalScript 
		local script = Instance.new('LocalScript', TextButton_4)
	
		local folder = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Tabs
		local thisbtn = script.Parent
		
		thisbtn.MouseButton1Click:Connect(function()
			if folder.MTab.Visible == false then
				folder.MTab.Visible = true
				thisbtn.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			else
				folder.MTab.Visible = false
				thisbtn.BackgroundColor3 = Color3.fromRGB(23,23,23)
			end
		end)
	end
	coroutine.wrap(YXDCQ_fake_script)()
	local function QLHVYA_fake_script() -- TextButton_5.LocalScript 
		local script = Instance.new('LocalScript', TextButton_5)
	
		local folder = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Tabs
		local thisbtn = script.Parent
		
		thisbtn.MouseButton1Click:Connect(function()
			if folder.WTab.Visible == false then
				folder.WTab.Visible = true
				thisbtn.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			else
				folder.WTab.Visible = false
				thisbtn.BackgroundColor3 = Color3.fromRGB(23,23,23)
			end
		end)
	end
	coroutine.wrap(QLHVYA_fake_script)()
	local function VDASW_fake_script() -- Watermarkset.LocalScript 
		local script = Instance.new('LocalScript', Watermarkset)
	
		local folder = script.Parent.Parent.Parent.Parent.Parent.Parent.watermark
		local thisbtn = script.Parent
		folder.Visible = false
		
		thisbtn.MouseButton1Click:Connect(function()
			if folder.Visible == false then
				folder.Visible = true
				thisbtn.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			else
				folder.Visible = false
				thisbtn.BackgroundColor3 = Color3.fromRGB(23,23,23)
			end
		end)
	end
	coroutine.wrap(VDASW_fake_script)()
	local function METTFIO_fake_script() -- arraylist.LocalScript 
		local script = Instance.new('LocalScript', arraylist)
	
		local folder = script.Parent.Parent.Parent.Parent.Parent.Parent.arraylist
		local thisbtn = script.Parent
		folder.Visible = false
		
		thisbtn.MouseButton1Click:Connect(function()
			if folder.Visible == false then
				folder.Visible = true
				thisbtn.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			else
				folder.Visible = false
				thisbtn.BackgroundColor3 = Color3.fromRGB(23,23,23)
			end
		end)
	end
	coroutine.wrap(METTFIO_fake_script)()
	
	local function GQHLEK_fake_script() -- Icon.LocalScript 
		local script = Instance.new('LocalScript', Icon)
	
		local main = script.Parent.Parent.Parent.Parent.Main
		local settings = script.Parent.Parent.Parent.Parent.Settings
		local otherbtn = script.Parent.Parent.Parent.Parent.Main.ForLabel.ImageButton --:skull:
		local thisbtn = script.Parent
		
		thisbtn.MouseButton1Click:Connect(function()
			main.Visible = true
			settings.Visible = false
		end)
	end
	coroutine.wrap(GQHLEK_fake_script)()
	local function HIWEEW_fake_script() -- txt.LocalScript 
		local script = Instance.new('LocalScript', txt)
	
	end
	coroutine.wrap(HIWEEW_fake_script)()
	local function NMDJZPL_fake_script() -- Main.LocalScript 
		local script = Instance.new('LocalScript', Main)
	
		script.Parent.Active = true
		script.Parent.Draggable = true
	end
	coroutine.wrap(NMDJZPL_fake_script)()
	local function ZPVBZ_fake_script() -- watermark.LocalScript 
		local script = Instance.new('LocalScript', watermark)
	
		local RunService = game:GetService("RunService")
		local Players = game:GetService("Players")
		local FpsLabel =  script.Parent.FPSCHECK
		local PingLabel = script.Parent.PingCheck
		
		spawn(function()
			game:GetService("RunService").Heartbeat:Connect(function()
				local ping = tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
				ping = math.floor(ping)
				PingLabel.Text = "Ping: ".. ping
			end)
		end)
		spawn(function()
			local RunService = game:GetService("RunService")
		
			local TimeFunction = RunService:IsRunning() and time or os.clock
		
			local LastIteration, Start
			local FrameUpdateTable = {}
		
			local function loopupdate()
				LastIteration = TimeFunction()
				for Index = #FrameUpdateTable, 1, -1 do
					FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
				end
		
				FrameUpdateTable[1] = LastIteration
				FpsLabel.Text = "[Fps] : " .. tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start))) .. ""
			end
		
			Start = TimeFunction()
			RunService.Heartbeat:Connect(loopupdate)
		end)
		
	end
	coroutine.wrap(ZPVBZ_fake_script)()
	local function PYLDCM_fake_script() -- arraylist_2.DragArray 
		local script = Instance.new('LocalScript', arraylist_2)
	
		local UIS = game:GetService('UserInputService')
		local button = script.Parent
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(button, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		
		button.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = button.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
		
	end
	coroutine.wrap(PYLDCM_fake_script)()
	local Watermark = Instance.new("TextLabel")
	Watermark.Name = "Watermark"
	Watermark.Parent = watermark
	Watermark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Watermark.BackgroundTransparency = 1.000
	Watermark.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Watermark.BorderSizePixel = 0
	Watermark.Position = UDim2.new(0.0808080807, 0, 0, 0)
	Watermark.Size = UDim2.new(0, 76, 0, 38)
	Watermark.Font = Enum.Font.GothamMedium
	Watermark.Text = "Zylq"
	Watermark.TextColor3 = Color3.fromRGB(255, 109, 0)
	Watermark.TextSize = 25.500
	
	local UIGradient = Instance.new("UIGradient")
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 106, 0)), ColorSequenceKeypoint.new(0.31, Color3.fromRGB(255, 109, 0)), ColorSequenceKeypoint.new(0.69, Color3.fromRGB(255, 220, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 234, 0))}
	UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.20), NumberSequenceKeypoint.new(1.00, 0.20)}
	UIGradient.Parent = Watermark
	local warningNotification = function(name, text, time)
		local Frame_2 = Instance.new("Frame")
		Frame_2.Parent = Frame
		Frame_2.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame_2.BorderSizePixel = 0
		Frame_2.Position = UDim2.new(0.835982263, 0, 0.81411767, 0)
		Frame_2.Size = UDim2.new(0, 10, 0, 111)
		
		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = Frame_2
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(-0.00253273291, 0, -0.00416666688, 0)
		TextLabel.Size = UDim2.new(0, 270, 0, 39)
		TextLabel.Font = Enum.Font.SourceSansSemibold
		TextLabel.Text = name
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 25.000
		
		local TextLabel_2 = Instance.new("TextLabel")
		TextLabel_2.Parent = Frame_2
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel_2.BorderSizePixel = 0
		TextLabel_2.Position = UDim2.new(-0.00253273291, 0, 0.464301586, 0)
		TextLabel_2.Size = UDim2.new(0, 270, 0, 39)
		TextLabel_2.Font = Enum.Font.SourceSans
		TextLabel_2.Text = text
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextSize = 25.000
	
		local function EXNGA_fake_script() -- Frame.LocalScript 
			local script = Instance.new('LocalScript', Frame_2)
	
			local TweenService = game:GetService("TweenService")
			
			script.Parent:TweenSize(UDim2.new(0, 270, 0, 111), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.4)
			wait(time)
			script.Parent:TweenSize(UDim2.new(0, 10, 0, 111), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.4)
			wait(0.4)
			Frame_2:Destroy()
		end
		coroutine.wrap(EXNGA_fake_script)()
	end
	function Library.add(name)

		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = arraylist_2
		TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		TextLabel.BackgroundTransparency = 0.200
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0.629090905, 0, 0, 0)
		TextLabel.Size = UDim2.new(0, 102, 0, 21)
		TextLabel.Font = Enum.Font.GothamMedium
		TextLabel.Text = name
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 19.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Right
		
		local UIGradient = Instance.new("UIGradient")
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 106, 0)), ColorSequenceKeypoint.new(0.31, Color3.fromRGB(255, 109, 0)), ColorSequenceKeypoint.new(0.69, Color3.fromRGB(255, 220, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 234, 0))}
		UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.20), NumberSequenceKeypoint.new(1.00, 0.20)}
		UIGradient.Parent = TextLabel
	
		local textSize = TextLabel.TextBounds
		TextLabel.Size = UDim2.new(0, textSize.X, 0, 23)
	
		TextLabel.LayoutOrder = -textSize.X
	end
	function Library.remove(text)
		local labels = arraylist_2:GetChildren()
		for _, label in ipairs(labels) do
			if label:IsA("TextLabel") and label.Text == text then
				label:Destroy()
				break
			end
		end
	end
	local Api = {
		["ObjectsThatCanBeSaved"] = {}
	}
	local SettingsT = {
	
	}
	
	local Name = "zylqConfig.JSON"
	
	pcall(function()
		if not pcall(function() readfile(Name) end) then
			writefile(Name, game:service'HttpService':JSONEncode(SettingsT))
		end
		writefile(Name, game:service'HttpService':JSONEncode(SettingsT))
	
		Settings = game:service'HttpService':JSONEncode(readfile(Name))
	end)
	local buttonbind = true
	
	Api["ObjectsThatCanBeSaved"].CreateOptionsButton = function(argstable) --> you can add only combat, blatant, visual, misc, world <--
		local TogFunction = {} 
		local tname = argstable["Name"]
		local callback = argstable["Function"]
		local DefaultT = argstable["Default"]
		local toggled = DefaultT
		local color = false
		table.insert(SettingsT, Name)
	
		local button = Instance.new("TextButton")
		button.Name = tname
		button.Parent = argstable["Tab"]
		button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		button.BorderSizePixel = 0
		button.Size = UDim2.new(0, 208, 0, 30)
		button.Font = Enum.Font.SourceSans
		button.Text = tname
		button.TextColor3 = Color3.fromRGB(255, 255, 255)
		button.TextSize = 20.000
		button.MouseButton1Click:Connect(function()
			toggled = not toggled
			pcall(callback, toggled)
			if color == false then
				Library.add(tname)
				button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				color = true
				warningNotification("Module Toggled", argstable["Name"].." Enabled", 2)
			else
				Library.remove(tname)
				color = false
				button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				warningNotification("Module Toggled", argstable["Name"].." Disabled", 2)
			end
		end)
		
	
		local Keybind = Instance.new("TextButton")
		Keybind.Name = "Keybind"
		Keybind.Parent = button
		Keybind.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Keybind.BorderSizePixel = 0
		Keybind.Position = UDim2.new(0.687499881, 0, 0.177228794, 0)
		Keybind.Size = UDim2.new(0, 20, 0, 20)
		Keybind.Font = Enum.Font.SourceSans
		Keybind.Text = "BIND HERE"
		Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
		Keybind.TextScaled = true
		Keybind.TextSize = 20.000
		Keybind.TextWrapped = true
	
		local UICorner = Instance.new("UICorner")
		UICorner.Parent = Keybind
		
		-- Scripts:
		
		local function YJZYDB_fake_script() -- TextButton.LocalScript 
			local script = Instance.new('LocalScript', Keybind)
		
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
						Library.add(tname)
						pcall(callback, toggled)
						button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
						warningNotification("Module Toggled", argstable["Name"].." Enabled", 3)
					else
						toggled = false
						color = false
						Library.remove(tname)
						pcall(callback, toggled)
						button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
						warningNotification("Module Toggled", argstable["Name"].." Disabled", 3)
						end
					end
				end
				end
			end)
			
		end
		coroutine.wrap(YJZYDB_fake_script)()
		
	
		TogFunction.ToggleButton = function(TogOn)
			TogOn = TogOn or toggled
			if TogOn then
				toggled = true
				color = true
				Library.add(tname)
				pcall(callback, toggled)
				button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				warningNotification("Module Toggled", argstable["Name"].." Enabled", 3)
			else
				toggled = false
				color = false
				Library.remove(tname)
				pcall(callback, toggled)
				button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				warningNotification("Module Toggled", argstable["Name"].." Disabled", 3)
			end
		end
		if DefaultT then
			TogFunction.ToggleButton(true)
		end
		return TogFunction
	end
	return Api
end
return Library

