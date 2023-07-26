local Patched = false
if Patched == true then
      local NotWorkingScreen = Instance.new("ScreenGui")
      local Back = Instance.new("Frame")
      local Main = Instance.new("Frame")
      local UICorner = Instance.new("UICorner")
      local TextLabel = Instance.new("TextLabel")
      local TextLabel_2 = Instance.new("TextLabel")
      local TextButton = Instance.new("TextButton")
      local UICorner_2 = Instance.new("UICorner")
      local TextLabel_3 = Instance.new("TextLabel")
      local UICorner_3 = Instance.new("UICorner")
      
      NotWorkingScreen.Name = "NotWorkingScreen"
      NotWorkingScreen.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
      NotWorkingScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      NotWorkingScreen.ResetOnSpawn = false
      
      Back.Name = "Back"
      Back.Parent = NotWorkingScreen
      Back.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
      Back.BackgroundTransparency = 0.400
      Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
      Back.BorderSizePixel = 0
      Back.Position = UDim2.new(0.38269031, 0, 0.386918008, 0)
      Back.Size = UDim2.new(0, 450, 0, 203)
      Back.Active = true
      Back.Draggable = true
      
      Main.Name = "Main"
      Main.Parent = Back
      Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
      Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
      Main.BorderSizePixel = 0
      Main.Position = UDim2.new(0.0165597051, 0, 0.0232945327, 0)
      Main.Size = UDim2.new(0, 434, 0, 193)
      UICorner.Parent = Main
      
      TextLabel.Parent = Main
      TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel.BackgroundTransparency = 1.000
      TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
      TextLabel.BorderSizePixel = 0
      TextLabel.Position = UDim2.new(-1.40634e-07, 0, -1.58122162e-07, 0)
      TextLabel.Size = UDim2.new(0, 434, 0, 37)
      TextLabel.Font = Enum.Font.SourceSans
      TextLabel.Text = "Zylq client"
      TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel.TextSize = 30.000
      
      TextLabel_2.Parent = Main
      TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_2.BackgroundTransparency = 1.000
      TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
      TextLabel_2.BorderSizePixel = 0
      TextLabel_2.Position = UDim2.new(1.40634e-07, 0, 0.188607335, 0)
      TextLabel_2.Size = UDim2.new(0, 433, 0, 37)
      TextLabel_2.Font = Enum.Font.SourceSans
      TextLabel_2.Text = "script not working rn now!"
      TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_2.TextSize = 30.000
      
      TextButton.Parent = Main
      TextButton.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
      TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
      TextButton.BorderSizePixel = 0
      TextButton.Position = UDim2.new(0.072002776, 0, 0.756476641, 0)
      TextButton.Size = UDim2.new(0, 369, 0, 36)
      TextButton.Font = Enum.Font.SourceSans
      TextButton.Text = "Okay"
      TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextButton.TextSize = 30.000
      UICorner_2.Parent = TextButton
      
      TextLabel_3.Parent = Main
      TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_3.BackgroundTransparency = 1.000
      TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
      TextLabel_3.BorderSizePixel = 0
      TextLabel_3.Position = UDim2.new(0.00230428809, 0, 0.406223893, 0)
      TextLabel_3.Size = UDim2.new(0, 433, 0, 37)
      TextLabel_3.Font = Enum.Font.SourceSans
      TextLabel_3.Text = "come back later"
      TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_3.TextSize = 30.000
      UICorner_3.Parent = Back
      
      local function dziabniety()
      	local script = Instance.new('LocalScript', TextButton)
      
      	local p = script.Parent
      	local screen = p.Parent.Parent.Parent.Parent.NotWorkingScreen
      	
      	p.MouseButton1Click:Connect(function()
      		screen:Destroy()
      	end)
      end
      coroutine.wrap(dziabniety)()
else
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNicknamez/zylq/main/MainScript.lua", true))()
end
