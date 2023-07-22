local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TITLE", "DarkTheme")
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
Section:NewKeybind("TpUp", "KeybindInfo", Enum.KeyCode.T, function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(721.635315, 675.702759, 47.970211, -0.994036794, -4.66358721e-08, -0.1090452, -4.2708912e-08, 1, -3.83477854e-08, 0.1090452, -3.34619052e-08, -0.994036794)
end)

local tweenval = {Value = 1}
Section:NewKeybind("TpAllUp igrone fahuj", "KeybindInfo", Enum.KeyCode.Z, function()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    
    local tweenInfo = TweenInfo.new(tweenval.Value)
    
    for i, player in pairs(Players:GetPlayers()) do
        if player.Character and player ~= Players.LocalPlayer and player.Name ~= "cfhfmmmmmjh" then
            local destination = player.Character.HumanoidRootPart.CFrame
            local tween = TweenService:Create(Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, {CFrame = destination})
            tween:Play()
            tween.Completed:Wait()
        end
    end
    
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(761.37207, 675.702759, 43.7852745, -0.998962581, 4.91829653e-08, -0.0455390364, 4.51211193e-08, 1, 9.02226844e-08, 0.0455390364, 8.80743158e-08, -0.998962581)
    
end)

Section:NewSlider("Tween Value", "Textbox", 20,1 function(text)
    tweenval["Value"] = text
end)

Section:NewKeybind("TpAllUp not igrone", "KeybindInfo", Enum.KeyCode.N, function()
    local Players = game:GetService("Players")

    for i, player in pairs(Players:GetPlayers()) do
        if player.Character and player ~= Players.LocalPlayer then
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            wait(0.11)
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(761.37207, 675.702759, 43.7852745, -0.998962581, 4.91829653e-08, -0.0455390364, 4.51211193e-08, 1, 9.02226844e-08, 0.0455390364, 8.80743158e-08, -0.998962581)
end)
local Enabled = false
Section:NewToggle("TpAllUp Repeat", "KeybindInfo", function(callback)
    Enabled = callback
    repeat task.wait(.3)
    local Players = game:GetService("Players")

    for i, player in pairs(Players:GetPlayers()) do
        if player.Character and player ~= Players.LocalPlayer then
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            wait(0.14)
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(761.37207, 675.702759, 43.7852745, -0.998962581, 4.91829653e-08, -0.0455390364, 4.51211193e-08, 1, 9.02226844e-08, 0.0455390364, 8.80743158e-08, -0.998962581)
    until not Enabled
end) 

Section:NewKeybind("TpAll void", "KeybindInfo", Enum.KeyCode.Y, function()
	local Players = game:GetService("Players")

    for i, player in pairs(Players:GetPlayers()) do
        if player.Character and player ~= Players.LocalPlayer and player.Name ~= "cfhfmmmmmjh" then
            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            wait(0.1)
        end
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(965.273743, 518.734863, -100.470863, 0.679967523, 1.05463911e-07, -0.733242214, -8.89852387e-08, 1, 6.13123916e-08, 0.733242214, 2.35572983e-08, 0.679967523)
end)
