local array = {}
local array = Instance.new("ScreenGui")
local arrayframe = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

--zylq array

array.Name = "array"
array.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
array.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

arrayframe.Name = "arrayframe"
arrayframe.Parent = array
arrayframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
arrayframe.BackgroundTransparency = 1.000
arrayframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
arrayframe.BorderSizePixel = 0
arrayframe.Position = UDim2.new(0.83291769, 0, 0, 0)
arrayframe.Size = UDim2.new(0, 268, 0, 799)

UIListLayout.Parent = arrayframe
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

function array.add(Name)
    local textframe = Instance.new("Frame")
    textframe.Name = "textframe"
    textframe.Parent = arrayframe
    textframe.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    textframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
    textframe.BorderSizePixel = 3
    textframe.Position = UDim2.new(-2.08955216, 0, 0, 0)
    textframe.Size = UDim2.new(0, 828, 0, 29)

    local Label = Instance.new("TextLabel")
    Label.Name = "Label"
    Label.Parent = textframe
    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1.000
    Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Label.BorderSizePixel = 0
    Label.Position = UDim2.new(0, 0, -0.392337143, 0)
    Label.Size = UDim2.new(0, 828, 0, 50)
    Label.Font = Enum.Font.SourceSansBold
    Label.Text = Name or "u forgot to set name nigger - maxlasertech"
    Label.TextColor3 = Color3.fromRGB(10, 200, 243)
    Label.TextSize = 19.000
    Label.TextXAlignment = Enum.TextXAlignment.Right


    local function DCLWV_fake_script()
        local script = Instance.new('LocalScript', textframe)

        local frame = script.Parent
        local label = frame:FindFirstChild("Label")
        
        local function resizeLeftSide()
            local labelWidth = label.TextBounds.X
            local frameWidth = frame.Size.X.Offset
            local frameHeight = frame.Size.Y.Offset
            local newWidth = math.min(frameWidth, labelWidth) + 10 
            local rightOffset = frameWidth - newWidth
        
            frame.Size = UDim2.new(0, newWidth, 0, frameHeight)
            frame.Position = UDim2.new(0, rightOffset, 0, 0)
            frame.AnchorPoint = Vector2.new(0, 0)
        
            label.Size = UDim2.new(1, -10, 1, -10)
            label.Position = UDim2.new(0.5, 0, 0.5, 0)
            label.AnchorPoint = Vector2.new(0.5, 0.5)
        end
        
        label:GetPropertyChangedSignal("TextBounds"):Connect(resizeLeftSide)
        
        resizeLeftSide()
        
    end
    coroutine.wrap(DCLWV_fake_script)()
end
function array.del(Name)
    if arrayframe:FindFirstChild(Name) then
        arrayframe:FindFirstChild(Name):Destroy()
    end
end
return array
