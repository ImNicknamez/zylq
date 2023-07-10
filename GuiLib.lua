local GuiLibrary = {}

	local ScreenGui = Instance.new("ScreenGui")
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

	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ResetOnSpawn = true
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

function GuiLibrary.CreateOptionsButton(argstable) --> you can add only combat, blatant, visual, misc, world <--
	local button = Instance.new("TextButton")
	local toggled = false
	local color = false
	button.Name = "button"
	button.Parent = argstable["Tab"]
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	button.BorderSizePixel = 0
	button.Size = UDim2.new(0, 203, 0, 23)
	button.Text = argstable["Name"] or "button"
	button.Font = Enum.Font.SourceSans
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextSize = 25.000
	button.MouseButton1Click:Connect(function()
		toggled = not toggled
		pcall(argstable.Function, toggled)
		if color == false then
			button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
			color = true
		else
			color = false
			button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		end
	end)
end
