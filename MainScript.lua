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
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()
local WhitelistFunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/Chattags/main/stupidwhitelists.lua", true))()
local lplr = game.Players.LocalPlayer
local plr = game.Players.LocalPlayer
local player = game:GetService("Players")
local cam = workspace.CurrentCamera
local networkownertick = tick()
local isnetworkowner = isnetworkowner or function(part)
  if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
      sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
      networkownertick = tick() + 8
  end
  return networkownertick <= tick()
end
do
  local oldcharacteradded = entity.characterAdded
  entity.characterAdded = function(plr, char, localcheck)
      return oldcharacteradded(plr, char, localcheck, function() end)
  end
  entity.fullEntityRefresh()
end

local bedwars = {}
local bedwarsData = {}

local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local getrobloxasset = getassetid or assetrbx or getrobloxpic or function(assetid) return "rbxassetid://"..assetid end
local gamequeue = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
local uis = game:GetService("UserInputService")
local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local getremote = function(tab)
  for i,v in pairs(tab) do
      if v == "Client" then
          return tab[i + 1]
      end
  end
  return ""
end

function isAlive(plr)
    plr = plr or lplr
    if not plr.Character then return false end
    if not plr.Character:FindFirstChild("Head") then return false end
    if not plr.Character:FindFirstChild("Humanoid") then return false end
    return true
  end

  local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
	return plr.Team ~= lplr.Team and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
	if isAlive(lplr) then -- alive check
		for i,v in pairs(game.Players:GetChildren()) do -- loop through players
			if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
				local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("DiamondGuardian")) do --monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and
			v2.Name ~= "DiamondGuardian" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "DiamondGuardian"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
	end
	return returnedplayer
end
local function hashvec(vec)
	return {value = vec}
end
  
local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}
do
	function RunLoops:BindToRenderStep(name, num, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = game:GetService("RunService").RenderStepped:Connect(func)
		end
	end

	function RunLoops:UnbindFromRenderStep(name)
		if RunLoops.RenderStepTable[name] then
			RunLoops.RenderStepTable[name]:Disconnect()
			RunLoops.RenderStepTable[name] = nil
		end
	end

	function RunLoops:BindToStepped(name, num, func)
		if RunLoops.StepTable[name] == nil then
			RunLoops.StepTable[name] = game:GetService("RunService").Stepped:Connect(func)
		end
	end

	function RunLoops:UnbindFromStepped(name)
		if RunLoops.StepTable[name] then
			RunLoops.StepTable[name]:Disconnect()
			RunLoops.StepTable[name] = nil
		end
	end

	function RunLoops:BindToHeartbeat(name, num, func)
		if RunLoops.HeartTable[name] == nil then
			RunLoops.HeartTable[name] = game:GetService("RunService").Heartbeat:Connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end
    local bedwars = {
        ["SprintController"] = KnitClient.Controllers.SprintController,
        ["ClientHandlerStore"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
        ["KnockbackUtil"] = require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil,
        ["PingController"] = require(lplr.PlayerScripts.TS.controllers.game.ping["ping-controller"]).PingController,
        ["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
        ["SwordController"] = KnitClient.Controllers.SwordController,
        ["ViewmodelController"] = KnitClient.Controllers.ViewmodelController,
        ["SwordRemote"] = getremote(debug.getconstants((KnitClient.Controllers.SwordController).attackEntity)),
        --["PaintRemote"] = getremote(debug.getconstants(KnitClient.Controllers.PaintShotgunController.fire)),
    }
	
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
    local runFunction = function(func)
        func()
    end      

    local userId = lplr.UserId
    local nothing = [[

    ]]
    local cam = game:GetService("Workspace").CurrentCamera
    local modules = {}
    
    local BedwarsSwords = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsSwords
    function hashFunc(vec) 
        return {value = vec}
    end
    local function GetInvenatory(plr)
        if not plr then 
            return {items = {}, armor = {}}    
        end
    
        local suc, ret = pcall(function() 
            return require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil.getInventory(plr)
        end)
    
        if not suc then 
            return {items = {}, armor = {}}
        end
    
        if plr.Character and plr.Character:FindFirstChild("InventoryFolder") then 
            local invFolder = plr.Character:FindFirstChild("InventoryFolder").Value
            if not invFolder then return ret end
            for i,v in next, ret do 
                for i2, v2 in next, v do 
                    if typeof(v2) == 'table' and v2.itemType then
                        v2.instance = invFolder:FindFirstChild(v2.itemType)
                    end
                end
                if typeof(v) == 'table' and v.itemType then
                    v.instance = invFolder:FindFirstChild(v.itemType)
                end
            end
        end
    
        return ret
    end
    local function getSword()
        local highest, returning = -9e9, nil
        for i,v in next, GetInventory(lplr).items do 
            local power = table.find(BedwarsSwords, v.itemType)
            if not power then continue end
            if power > highest then 
                returning = v
                highest = power
            end
        end
        return returning
    end 
    
    local function runcode(func)
        func()
    end
    local function playAnimation(id) 
        if entity.isAlive then 
            local animation = Instance.new("Animation")
            animation.AnimationId = id
            local animatior = lplr.Character.Humanoid.Animator
            animatior:LoadAnimation(animation):Play()
        end
    end
    runFunction(function()
        local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
        local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
        local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
        modules = {
            AttackRemote = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController).attackEntity)),
            BlockController = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine,
            BlockController2 = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer,
            BlockEngine = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
            ClientHandler = Client,
            getCurrentInventory = function(plr)
                local plr = plr or lplr
                local suc, result = pcall(function()
                    return InventoryUtil.getInventory(plr)
                end)
                return (suc and result or {
                    ["items"] = {},
                    ["armor"] = {},
                    ["hand"] = nil
                })
            end,
            ItemMeta = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1),
            KnockbackUtil = require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil,
            SprintCont = KnitClient.Controllers.SprintController,
            SwordController = KnitClient.Controllers.SwordController
        }
    end)
    local function getCurrentScythe()
        local sword, swordslot, swordrank = nil, nil, 0
        for i5, v5 in pairs(modules.getCurrentInventory().items) do
            if v5.itemType:lower():find("scythe") or v5.itemType:lower():find("dagger") then
                if modules.ItemMeta[v5.itemType].sword.damage > swordrank then
                    sword = v5
                    swordslot = i5
                    swordrank = modules.ItemMeta[v5.itemType].sword.damage
                end
            end
        end
        return sword, swordslot
    end
    local function getCurrentSword()
        local sword, swordslot, swordrank = nil, nil, 0
        for i5, v5 in pairs(modules.getCurrentInventory().items) do
            if v5.itemType:lower():find("scythe") or v5.itemType:lower():find("hammer") or v5.itemType:lower():find("sword") or v5.itemType:lower():find("dagger") then
                if modules.ItemMeta[v5.itemType].sword.damage > swordrank then
                    sword = v5
                    swordslot = i5
                    swordrank = modules.ItemMeta[v5.itemType].sword.damage
                end
            end
        end
        return sword, swordslot
    end

    local function switchItem(tool)
        local args = {
            [1] = {
                hand = tool,
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SetInvItem"):InvokeServer(unpack(args))    
        repeat wait() until lplr.Character.HandInvItem.Value == tool
    end
    
    local function switchToAndUseTool(block, legit)
        local tool = getBestTool(block.Name)
        if tool and (isAlive(plr) and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value ~= tool.tool) then
            if legit then
                if getHotbarSlot(tool.itemType) then
                    bedwars.ClientStoreHandler:dispatch({
                        type = "InventorySelectHotbarSlot", 
                        slot = getHotbarSlot(tool.itemType)
                    })
                    vapeEvents.InventoryChanged.Event:Wait()
                    updateitem:Fire(inputobj)
                    return true
                else
                    return false
                end
            end
            switchItem(tool.tool)
        end
    end
    local currentinventory = {
        ["inventory"] = {
            ["items"] = {},
            ["armor"] = {},
            ["hand"] = nil
        }
    }
    local oneTime = false
    
    local lplr = game.Players.LocalPlayer
    local cam = game:GetService("Workspace").CurrentCamera
    local uis = game:GetService("UserInputService")
    local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
    local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
    local getremote = function(tab)
        for i,v in pairs(tab) do
            if v == "Client" then
                return tab[i + 1]
            end
        end
        return ""
    end
    local repstorage = game:GetService("ReplicatedStorage")
    local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
    local cstore = require(lplr.PlayerScripts.TS.ui.store).ClientStore
    local bedwars = { -- the part i skidded
        ["DropItemRemote"] = getremote(debug.getconstants(getmetatable(KnitClient.Controllers.ItemDropController).dropItemInHand)),
        ["SprintController"] = KnitClient.Controllers.SprintController,
        ["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
        ["ClientHandlerStore"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
        ["KnockbackUtil"] = require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil,
        ["PingController"] = require(lplr.PlayerScripts.TS.controllers.game.ping["ping-controller"]).PingController,
        ["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
        ["SwordController"] = KnitClient.Controllers.SwordController,
        ["ClientHandler"] = Client,
        ["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
        ["SwordRemote"] = getremote(debug.getconstants((KnitClient.Controllers.SwordController).attackEntity)),
    }
    
    local BedwarsSwords = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsSwords
    function hashFunc(instance) 
        return {value = instance}
    end
    
    
    local function GetInventory(plr)
        if not plr then
            return {inv = {}, armor = {}}
        end
    
        local success, result = pcall(function()
            return require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil.getInventory(plr)
        end)
    
        if not success then
            return {items = {}, armor = {}}
        end
    
        if plr.Character and plr.Character:FindFirstChild("InventoryFolder") then
            local invFolder = plr.Character:FindFirstChild("InventoryFolder").Value
            if not invFolder then return result end
    
            for _, item in pairs(result) do
                for _, subItem in pairs(item) do
                    if typeof(subItem) == "table" and subItem.itemType then
                        subItem.instance = invFolder:FindFirstChild(subItem.itemType)
                    end
                end
    
                if typeof(item) == "table" and item.itemType then
                    item.instance = invFolder:FindFirstChild(item.itemType)
                end
            end
        end
    
        return result
    end
    local function getSword()
        -- Initialize the highest power value and the returning item to nil.
        local highestPower = -9e9
        local returningItem = nil
    
        -- Get the inventory of the local player.
        local inventory = GetInventory(lplr)
    
        -- Loop through the items in the inventory.
        for _, item in pairs(inventory.items) do
            -- Check if the item is a sword.
            local power = table.find(BedwarsSwords, item.itemType)
            if not power then
                -- Skip the item if it is not a sword.
                continue
            end
    
            -- Check if the power of the current sword is higher than the current highest power.
            if power > highestPower then
                -- Set the returning item to the current sword and update the highest power value.
                returningItem = item
                highestPower = power
            end
        end
    
        -- Return the item with the highest power.
        return returningItem
    end
    
    local function getNearestPlayer(maxDist)
        -- define the position or object that you want to use as the reference point
        local referencePoint = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    
        -- get the list of players currently connected to the game
        local players = game:GetService("Players"):GetPlayers()
    
        -- initialize variables to store the nearest player and their distance
        local nearestPlayer = nil
        local nearestDistance = maxDist
    
        -- loop through all the players and find the nearest one
        for _, player in pairs(players) do
    
            if player ~= game.Players.LocalPlayer then
                -- calculate the distance between the reference point and the player
                local distance = (referencePoint - player.Character.PrimaryPart.Position).magnitude
    
                -- check if this player is closer than the current nearest player
                if distance < nearestDistance then
                    -- update the nearest player and distance
                    nearestPlayer = player
                    nearestDistance = distance
                end
    
            end
        end
        if nearestPlayer then
            return nearestPlayer
        end
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

    local buttonbind = true

    local function OXZPCGS_fake_script() -- HorionGui.GuiBind 
        local script = Instance.new('LocalScript', ScreenGui)
    
        
        local UserInputService = game:GetService("UserInputService")
        local ScreenGui = script.Parent
        
        UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.V then
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
    local lplr = game.Players.LocalPlayer
    local ItemTable = debug.getupvalue(require(game.ReplicatedStorage.TS.item["item-meta"]).getItemMeta, 1)
    local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
    local howmuchihateblacks = math.huge
    
    local IsAlive = function(blackmonkeyboy)
        blackmonkeyboy = blackmonkeyboy or lplr
        return blackmonkeyboy and tostring(blackmonkeyboy.Team) ~= 'Spectators' and blackmonkeyboy.Character ~= nil and blackmonkeyboy.Character:FindFirstChild('HumanoidRootPart') and blackmonkeyboy.Character:FindFirstChild("Humanoid") and blackmonkeyboy.Character.Humanoid.Health > 0 or false 
    end
    
    local GetInventory = function(blackboy)
        blackboy = blackboy or lplr
        return InventoryUtil.getInventory(blackboy)
    end
    
    local getRemoteName = function(black, index)
        local tableTargetted = debug.getconstants(black[index])
        local iSaved = nil
        for i, v in pairs(tableTargetted) do
            if v == 'Client' then iSaved = i+1 end
            if iSaved ~= nil then return tostring(tableTargetted[iSaved]) end
        end
        return nil
    end
    
    local GetBestSword = function()
        local dmg = 0
        local sword = nil
        for i, v in pairs(GetInventory().items) do
            if v.itemType:lower():find('sword') or v.itemType:lower():find('scythe') or v.itemType:lower():find('blade') then
                if ItemTable[v.itemType].sword.damage > dmg then
                    sword = v.tool
                end
            end
        end
        return sword
    end
    
    local getScaffoldBlock = function()
        local Inventory = GetInventory()
        for i, v in pairs(Inventory.items) do
            if ItemTable[v.itemType].block ~= nil then return v.itemType end
        end
        return 'black'
    end
    
    local setToY = 0
    local blackie = nil
    
    local setMotionY = function(value, set)
        setToY = value
        if set then
            blackie = lplr.Character.Humanoid.Jumping:Connect(function(IsJumping)
                print(IsJumping)
                if IsJumping then
                    print('jumped')
                    lplr.Character.HumanoidRootPart.Velocity += Vector3.new(0, setToY*500, 0)
                end
            end)
        else
            if blackie ~= nil then blackie:Disconnect() end
        end
    end
    
    local ClientBlockEngine = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine
    local BlockBase = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client.placement["block-placer"]).BlockPlacer
    local BlockUtils = require(game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out).BlockEngine
    local BlockController = BlockBase.new(ClientBlockEngine, getScaffoldBlock())
    
    local returnScaffoldPosition = function(vector)
        return Vector3.new(vector.X/3, vector.Y/3, vector.Z/3)
    end
    
    local IsAllowedAtPosition = function(position)
        return BlockUtils:isAllowedPlacement(lplr, getScaffoldBlock(), Vector3.new(position.X, position.Y, position.Z))
    end
    
    local PlaceBlock = function(position)
        return BlockController:placeBlock(returnScaffoldPosition(position))
    end
    
    local HashVector = function(black)
        return {value = black}
    end    
    
    local KnitClient = debug.getupvalue(require(lplr.PlayerScripts.TS.knit).setup, 6)
    local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
    local HitRemoteName = getRemoteName(getmetatable(KnitClient.Controllers.SwordController), 'attackEntity')
    local HitRemote = game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"]["@rbxts"].net.out._NetManaged[HitRemoteName]
    local kbtable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
    
    local function getwoolamount()
        local value = 0
        for i,v in pairs(lplr.Character:FindFirstChild("InventoryFolder").Value:GetChildren()) do
            if string.lower(v.Name):find("wool") then
                value = value + v:GetAttribute("Amount")
            end
        end
        return value
    end      
    function GuiLibrary.CreateOptionsButton(argstable) --> you can add only combat, blatant, visual, misc, world <--
        local TogFunction = {} 
        local tname = argstable["Name"]
        local callback = argstable["Function"]
        local DefaultT = argstable["Default"]
        local toggled = DefaultT
        local color = false
        table.insert(SettingsT, Name)
        local notification = Instance.new("ScreenGui")

        
        --Properties
        
        notification.Name = "notification"
        notification.Parent = game.CoreGui
        notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local NotifyFrame
    
        local button = Instance.new("TextButton")
        button.Name = "button"
        button.Parent = argstable["Tab"]
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        button.BorderSizePixel = 0
        button.Size = UDim2.new(0, 200, 0, 33)
        button.Text = tname
        button.Font = Enum.Font.SourceSans
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 21.000
        button.MouseButton1Click:Connect(function()
            toggled = not toggled
            pcall(callback, toggled)
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
                        pcall(callback, toggled)
                        button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                        GuiLibrary.add(argstable["Name"])
                        warningNotification("Module Toggled", argstable["Name"].." Enabled", 3)
                    else
                    	toggled = false
                        color = false
                    	pcall(callback, toggled)
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
                pcall(callback, toggled)
                button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                warningNotification("Module Toggled", argstable["Name"].." Enabled", 3)
            else
                toggled = false
                color = false
                GuiLibrary.remove(argstable["Name"])
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

    local SelfDestruct = {Enabled = false}
    SelfDestruct = GuiLibrary.CreateOptionsButton({
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

    local bedwarsStore = {
        attackReach = 0,
        attackReachUpdate = tick(),
        blocks = {},
        blockPlacer = {},
        blockPlace = tick(),
        blockRaycast = RaycastParams.new(),
        equippedKit = "none",
        forgeMasteryPoints = 0,
        forgeUpgrades = {},
        grapple = tick(),
        inventories = {},
        localInventory = {
            inventory = {
                items = {},
                armor = {}
            },
            hotbar = {}
        },
        localHand = {},
        matchState = 0,
        matchStateChanged = tick(),
        pots = {},
        queueType = "bedwars_test",
        zephyrOrb = 0
    }


    local function getItem(itemName, inv)
        for slot, item in pairs(inv or bedwarsStore.localInventory.inventory.items) do
            if item.itemType == itemName then
                return item, slot
            end
        end
        return nil
    end
    
    local function getItemNear(itemName, inv)
        for slot, item in pairs(inv or bedwarsStore.localInventory.inventory.items) do
            if item.itemType == itemName or item.itemType:find(itemName) then
                return item, slot
            end
        end
        return nil
    end


    local Mark = Instance.new("ScreenGui")
    local Fps = Instance.new("TextLabel")
    local Ping = Instance.new("TextLabel")
    local TextLabel = Instance.new("TextLabel")


    Mark.Name = "Mark"
    Mark.Parent = game.CoreGui
    Mark.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Fps.Name = "Fps"
    Fps.Parent = Mark
    Fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Fps.BackgroundTransparency = 1.000
    Fps.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Fps.BorderSizePixel = 0
    Fps.Position = UDim2.new(0.0660847872, 0, 0.29058823, 0)
    Fps.Size = UDim2.new(0, 371, 0, 50)
    Fps.Font = Enum.Font.SourceSansSemibold
    Fps.Text = "[Fps : 60]"
    Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
    Fps.TextSize = 25.000
    Fps.TextWrapped = true
    Fps.TextXAlignment = Enum.TextXAlignment.Left
    Fps.TextYAlignment = Enum.TextYAlignment.Top

    Ping.Name = "Ping"
    Ping.Parent = Mark
    Ping.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Ping.BackgroundTransparency = 1.000
    Ping.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Ping.BorderSizePixel = 0
    Ping.Position = UDim2.new(0, 0, 0.29058823, 0)
    Ping.Size = UDim2.new(0, 371, 0, 50)
    Ping.Font = Enum.Font.SourceSansSemibold
    Ping.Text = "Zylq"
    Ping.TextColor3 = Color3.fromRGB(255, 255, 255)
    Ping.TextSize = 25.000
    Ping.TextWrapped = true
    Ping.TextXAlignment = Enum.TextXAlignment.Left
    Ping.TextYAlignment = Enum.TextYAlignment.Top

    TextLabel.Parent = Mark
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BorderSizePixel = 0
    TextLabel.Position = UDim2.new(0.122817956, 0, 0.29058823, 0)
    TextLabel.Size = UDim2.new(0, 371, 0, 50)
    TextLabel.Font = Enum.Font.SourceSansSemibold
    TextLabel.Text = "[Ping : 100]"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 25.000
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextYAlignment = Enum.TextYAlignment.Top
            spawn(function()
                            game:GetService("RunService").Heartbeat:Connect(function()
                                local ping = tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
                                ping = math.floor(ping)
                                TextLabel.Text = "   [Ping] : ".. ping
                        end)
                end)
    spawn(function()
        local RunService = game:GetService("RunService")
        local FpsLabel = Fps
        
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

    
    runFunction(function()
        local FovChanger = {Enabled = false}
        FovChanger = GuiLibrary.CreateOptionsButton({
            Name = "FovChanger",
            Tab = misc,
            Function = function(callback)
                FovChanger.Enabled = callback
                if callback then
                    task.spawn(function()
                        repeat wait()
                            workspace.CurrentCamera.FieldOfView = 120
                        until (not FovChanger.Enabled)
                    end)
                else
                    workspace.CurrentCamera.FieldOfView = 100
                end
            end
        })
    end)
    
    runFunction(function()
        local Disabler = {Enabled = false}
        Disabler = GuiLibrary.CreateOptionsButton({
            Name = "Disabler",
            Tab = misc,
            Function = function(callback)
                Disabler.Enabled = callback
                if callback then
                    task.spawn(function()
                        repeat
                            wait(0.03)
                            local item = getItemNear("scythe")
                            if item and lplr.Character.HandInvItem.Value == item.tool then 
                                bedwars.ClientHandler:Get("ScytheDash"):SendToServer({direction = Vector3.new(9e9, 9e9, 9e9)})
                            end
                        until (not Disabler.Enabled)
                    end)
                end
            end
        })
    end)
    runFunction(function()
        local InfFly = {Enabled = false}
        local part
        local oldchar
        local funnyFly
        InfFly = GuiLibrary.CreateOptionsButton({
            Name = "Infinite Fly",
            Tab = visual,
            Function = function(callback)
                if callback then
                    oldchar = lplr.Character
                    oldchar.Archivable = true
                    oldchar.PrimaryPart.Anchored = false
                    local origy = entity.character.HumanoidRootPart.Position.y;
                    part = Instance.new("Part", workspace);
                    part.Size = Vector3.new(1, 1, 1);
                    part.Name = "BetterFlyPart"
                    part.Transparency = 1;
                    part.Anchored = true;
                    part.CanCollide = false;
                    cam.CameraSubject = part;
                        
                    RunLoops:BindToHeartbeat("FunnyFlyPart", 1, function(Delta)			
                        local pos = lplr.character.HumanoidRootPart.Position;
                        part.Position = Vector3.new(pos.x, origy, pos.z);				
                    end);
                    local cf = entity.character.HumanoidRootPart.CFrame
                    entity.character.HumanoidRootPart.CFrame = CFrame.new(cf.x, 300000, cf.z)
                    if entity.character.HumanoidRootPart.Position.X < 50000 then 
                        entity.character.HumanoidRootPart.CFrame *= CFrame.new(0, 100000, 0)
                    end
                else
                    RunLoops:UnbindFromHeartbeat("FunnyFlyPart");
				local pos = entity.character.HumanoidRootPart.Position;
				local rcparams = RaycastParams.new();
				rcparams.FilterType = Enum.RaycastFilterType.Whitelist;
				rcparams.FilterDescendantsInstances = {workspace.Map};
				rc = workspace:Raycast(Vector3.new(pos.x, 300, pos.z), Vector3.new(0, -1000, 0), rcparams);
				if (rc and rc.Position) then
					entity.character.HumanoidRootPart.CFrame = CFrame.new(rc.Position) * CFrame.new(0, 3, 0);
				end
				cam.CameraSubject = lplr.Character;
				part:Destroy();
				RunLoops:BindToHeartbeat("FunnyFlyVeloEnd", 1, function(Delta)
					local entity = game.Players.LocalPlayer.Character
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if humanoidRootPart then
						local ray = Ray.new(humanoidRootPart.Position, Vector3.new(0, -1, 0) * 1000)
						local part, position = workspace:FindPartOnRay(ray, character)
						if part then
							entity.CFrame = CFrame.new(position)
						end
					end				
					
				end);
                wait(0.5)
                warningNotification("InfFly", "Wait Few Second To Not Flag", 2.5)
				RunLoops:UnbindFromHeartbeat("FunnyFlyVeloEnd");
                end
            end
        })
    end)
    local scythedo = false
    runFunction(function()
        local anims = {
            Normal = {
                {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.05},
                {CFrame = CFrame.new(0.69, -0.71, 0.6) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.05}
            },
            Slow = {
                {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(295), math.rad(55), math.rad(290)), Time = 0.15},
                {CFrame = CFrame.new(0.69, -0.71, 0.6) * CFrame.Angles(math.rad(200), math.rad(60), math.rad(1)), Time = 0.15}
            },
            New = {
                {CFrame = CFrame.new(0.69, -0.77, 1.47) * CFrame.Angles(math.rad(-33), math.rad(57), math.rad(-81)), Time = 0.12},
                {CFrame = CFrame.new(0.74, -0.92, 0.88) * CFrame.Angles(math.rad(147), math.rad(71), math.rad(53)), Time = 0.12}
            },
            Latest = {
                {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-65), math.rad(55), math.rad(-51)), Time = 0.1},
                {CFrame = CFrame.new(0.16, -1.16, 1) * CFrame.Angles(math.rad(-179), math.rad(54), math.rad(33)), Time = 0.1}
            },
            ["VerticalSpin"] = {
                {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-90), math.rad(8), math.rad(5)), Time = 0.1},
                {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(180), math.rad(3), math.rad(13)), Time = 0.1},
                {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(90), math.rad(-5), math.rad(8)), Time = 0.1},
                {CFrame = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(0), math.rad(-0), math.rad(-0)), Time = 0.1}
            },
            Exhibition = {
                {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(-90)), Time = 0.1},
                {CFrame = CFrame.new(0.7, -0.71, 0.59) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.2}
            },
            ["ExhibitionOld"] = {
                {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(-90)), Time = 0.15},
                {CFrame = CFrame.new(0.69, -0.7, 0.6) * CFrame.Angles(math.rad(-30), math.rad(50), math.rad(-90)), Time = 0.05},
                {CFrame = CFrame.new(0.7, -0.71, 0.59) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.1},
                {CFrame = CFrame.new(0.7, -0.71, 0.59) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.05},
                {CFrame = CFrame.new(0.63, -0.1, 1.37) * CFrame.Angles(math.rad(-84), math.rad(50), math.rad(-38)), Time = 0.15}
            }
        }
        local killauraswing = false
        local killaurarange = {["Value"] = 21}
        local killauraremote = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsMelees
        local Killaura = false
        local sword = getCurrentSword()
        local Swing = {Enabled = false}
        local SwordHitRmote = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SwordHit")
        local Killaura = {Enabled = false}
        Killaura = GuiLibrary.CreateOptionsButton({
            Name = "Killaura",
            Tab = blatant,
            Function = function(callback)
                Killaura.Enabled = callback
                if callback then
                    local sword = getCurrentSword()
                    local function attackEntity(plr)
                        local root = plr.Character.HumanoidRootPart
                        if not root then
                            return nil
                        end
                        
                        local selfrootpos = lplr.Character.HumanoidRootPart.Position
                        local selfpos = selfrootpos + (killaurarange["Value"] > 14 and (selfrootpos - root.Position).magnitude > 14 and (CFrame.lookAt(selfrootpos, root.Position).lookVector * 4) or Vector3.zero)
                        SwordHitRmote:FireServer({
                            ["chargedAttack"] = {
                                ["chargeRatio"] = 0
                            },
                            ["entityInstance"] = plr.Character,
                            ["validate"] = {
                                ["raycast"] = {
                                    ["cameraPosition"] = hashvec(cam.CFrame.Position),
                                    ["cursorDirection"] = hashvec(Ray.new(cam.CFrame.Position, root.CFrame.Position).Unit.Direction)
                                },
                                ["targetPosition"] = hashvec(root.CFrame.Position),
                                ["selfPosition"] = hashvec(selfpos)
                            },
                            ["weapon"] = sword.tool,
                        })
                    end
                    task.spawn(function()
                        RunLoops:BindToHeartbeat("Killaura", 1, function()
                            local plrs = GetAllNearestHumanoidToPosition(killaurarange["Value"] - 0.0001, 1)
                            switchItem(sword.tool)
                            for i,plr in pairs(plrs) do
                                task.spawn(attackEntity, plr)
                            end
                        end)
                    end)
                else
                    RunLoops:UnbindFromHeartbeat("Killaura")
                end
            end,
        })
        local Animations = {Enabled = false}
        Animations = GuiLibrary.CreateOptionsButton({
            Name = "Sword Anims",
            Tab = blatant,
            Function = function(callback)
                Animations.Enabled = callback
                if callback then
                    task.spawn(function()
                        local origC0 = cam.Viewmodel.RightHand.RightWrist.C0
                        local ui2 = Instance.new("ScreenGui")
                        local nearestID = nil
                        ui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
                        repeat
                            for _,v in pairs(game.Players:GetPlayers()) do
                                if v ~= lplr then
                                    nearestID = v
                                    target = v.Name
                                    if v.Team ~= lplr.Team and v ~= lplr and isAlive(v) and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
                                        local sword = getCurrentSword()
                                        if sword ~= nil then
                                            spawn(function()
                                                pcall(function()
                                                    for i,v in pairs(anims.Latest) do 
                                                        anim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.1), {C0 = origC0 * v.CFrame})
                                                        anim:Play()
                                                        wait(v.Time)
                                                    end
                                                end)
                                            end)
                                        end
                                    end
                                end
                            end
                            wait(0.23);	
                            bedwars["SwordController"].lastAttack = game:GetService("Workspace"):GetServerTimeNow() - 0.11
                            if cam.Viewmodel.RightHand.RightWrist.C0 ~= origC0 then
                                pcall(function()
                                    anim:Cancel()
                                end)
                                anim2 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.364), {C0 = origC0})
                                anim2:Play()
                            end
                        until (not Animations.Enabled)
                    end)
                end
            end
        })
        local function playSound(id, volume) 
            local sound = Instance.new("Sound")
            sound.Parent = workspace
            sound.SoundId = id
            sound.PlayOnRemove = true 
            if volume then 
                sound.Volume = volume
            end
            sound:Destroy()
        end
        function SwordSwing()
            playAnimation("rbxassetid://4947108314")
        end
        function SwordSound()
            playSound("rbxassetid://6760544639", 0.5)
        end
        local Swing = {Enabled = false}
        Swing = GuiLibrary.CreateOptionsButton({
            Name = "Swing",
            Tab = blatant,
            Function = function(callback) 
                Swing.Enabled = callback
                if callback then
                    repeat wait(0.1)
                        task.spawn(function()
                            local plrs = GetAllNearestHumanoidToPosition(killaurarange["Value"] - 0.0001, 1)
                            switchItem(sword.tool)
                            for i,plr in pairs(plrs) do
                                SwordSwing()
                                SwordSound()
                            end
                        end)
                    until (not Swing.Enabled)
                end
            end,
        })

    end)
    --]]
    runFunction(function()
        local Speed = {Enabled = false}
        Speed = GuiLibrary.CreateOptionsButton({
            Name = "Speed",
            Tab = blatant,
            Function = function(callback)
                Speed.Enabled = callback
                if callback then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
                    RunLoops:BindToHeartbeat("Speeding", 1, function()
                        spawn(function()
                            local hrp = lplr.Character:FindFirstChild("HumanoidRootPart")
                            local hum = lplr.Character:FindFirstChild("Humanoid")
                            if isnetworkowner(hrp) and hum.MoveDirection.Magnitude > 0 then
                                lplr.Character:TranslateBy(hum.MoveDirection * 0.055)
                            end  
                        end)
                    end)
                else
                    RunLoops:UnbindFromHeartbeat("Speeding")
                end
            end,
        })
    end)
    
        local JumpBoost = {Enabled = false}
        JumpBoost = GuiLibrary.CreateOptionsButton({
            Name = "Jump Boost",
            Tab = blatant,
            Function = function(callback)
                JumpBoost.Enabled = callback
                if callback then
                    task.spawn(function()
                        repeat wait(0.18)
                            local character = game.Players.LocalPlayer.Character
                            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                            local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
                            bodyVelocity.Velocity = Vector3.new(0, 9, 0)
                            wait(.2)
                            bodyVelocity:Destroy()
                        until (not JumpBoost.Enabled)
                    end)
                end
            end,
        })

            local ExpendSlider = {Value = 5}
            local Scaffold = {Enabled = false}
            Scaffold = GuiLibrary.CreateOptionsButton({
                Name = "Scaffold",
                Tab = blatant,
                Function = function(callback)
                    Scaffold.Enabled = callback
                    if callback then
                        task.spawn(function()
                            repeat wait() if not Scaffold.Enabled then break end until getScaffoldBlock() ~= 'black'
                            if not Enabled then return end
                            BlockController = BlockBase.new(ClientBlockEngine, getScaffoldBlock())
                            repeat wait()
                                if not Enabled then break end
                                if IsAlive() and getScaffoldBlock() ~= 'black' then
                                    for i = 1, ExpendSlider.Value do
                                        local BlockPosition = lplr.Character.HumanoidRootPart.Position + (lplr.Character.Humanoid.MoveDirection * (i*1.5)) + Vector3.new(0, -math.floor(lplr.Character.Humanoid.HipHeight * 3), 0)
                                        if IsAllowedAtPosition(BlockPosition) then
                                            task.spawn(PlaceBlock, BlockPosition)
                                        end
                                    end
                                end
                            until (not Scaffold.Enabled)
                        end)
                    end
                end,
            })
        runFunction(function()
            local bodyVelocity
            local Fly = {Enabled = false}
            Fly = GuiLibrary.CreateOptionsButton({
                Name = "Fly",
                Tab = visual,
                Function = function(callback)
                    Fly.Enabled = callback

                    if callback then
                        task.spawn(function()
                            local character = game.Players.LocalPlayer.Character
                            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                            local UserInputService = game:GetService("UserInputService")
                            bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
                            bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
                            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                            
                            UserInputService.InputBegan:Connect(function(inputObject)
                                if inputObject.KeyCode == Enum.KeyCode.Space then
                                    bodyVelocity.Velocity = Vector3.new(0, 70, 0)
                                end
                            end)
                            
                            UserInputService.InputEnded:Connect(function(inputObject)
                                if inputObject.KeyCode == Enum.KeyCode.Space then
                                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                                end
                            end)
                            UserInputService.InputBegan:Connect(function(inputObject)
                                if inputObject.KeyCode == Enum.KeyCode.LeftShift then
                                    bodyVelocity.Velocity = Vector3.new(0, -70, 0)
                                end
                            end)
                            
                            UserInputService.InputEnded:Connect(function(inputObject)
                                if inputObject.KeyCode == Enum.KeyCode.LeftShift then
                                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                                end
                            end)
                        end)
                    else
                        bodyVelocity:Destroy()
                    end
                end,
            })
            local TpDown = {Enabled = false}
            TpDown = GuiLibrary.CreateOptionsButton({
                Name = "TpDown",
                Tab = visual,
                Function = function()
                    TpDown.Enabled = callback
                    task.spawn(function()
                        repeat
                            wait(2.2)
                            local lplr = game:GetService("Players")
                            local player = lplr.LocalPlayer
                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                            raycastParams.FilterDescendantsInstances = {character}
                        
                            local currentPosition = humanoidRootPart.CFrame
                        
                            local ray = Ray.new(currentPosition.Position, Vector3.new(0, -1000, 0))
                        
                            local result = workspace:Raycast(ray.Origin, ray.Direction, raycastParams)
                        
                            if result then
                                local groundPosition = CFrame.new(result.Position)
                                humanoidRootPart.CFrame = groundPosition
                                wait(.15)
                                humanoidRootPart.CFrame = currentPosition
                            else
                                repeat
                                    wait()
                                    result = workspace:Raycast(ray.Origin, ray.Direction, raycastParams)
                                until result
                                local groundPosition = CFrame.new(result.Position)
                                humanoidRootPart.CFrame = groundPosition
                                wait()
                                humanoidRootPart.CFrame = currentPosition
                            end
                        until (not Fly.Enabled or not TpDown.Enabled)
                    end)
                end
            })
        end)
    runFunction(function()
        local KillFeed = {Enabled = false}
        KillFeed = GuiLibrary.CreateOptionsButton({
            Name = "KillFeed",
            Tab = visual,
            Function = function(callback)
                KillFeed.Enabled = callback
            if callback then
                game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = false
            else
                game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = true
                end
            end,
        })
    end)
    runFunction(function()
        local items = {"iron", "emerald", "diamond"}
        local getshops = function()
            local shops = {}
            for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v.Name:find("item_shop") or v.Name:find("upgrade_shop") then
                    table.insert(shops, v)
                end
            end
            return shops
        end
        local isnearshop = function()
            local shops = getshops()
            for i,v in pairs(shops) do
                local mag = (lplr.Character.HumanoidRootPart.Position - v.Position).Magnitude
                if mag < 20 then
                    return true
                end
            end
            return false
        end
        local getinv = function()
            return lplr.Character.InventoryFolder.Value
        end
        local getpersonal = function()
            return game:GetService("ReplicatedStorage").Inventories:FindFirstChild(lplr.Name.."_personal")
        end
        local getitems = function()
            local personal = getpersonal()
            local inv = getinv()
            for i, item in pairs(items) do
                if personal:FindFirstChild(item) then
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(personal)
                    Client:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(personal, personal[item])
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
                end
            end
        end
        local takeitems = function()
            local personal = getpersonal()
            local inv = getinv()
            for i, item in pairs(items) do
                if inv:FindFirstChild(item) then
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(personal)
                    Client:GetNamespace("Inventory"):Get("ChestGiveItem"):CallServer(personal, inv[item])
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
                end
            end
        end
        local AutoBank = {Enabled = false}
        AutoBank = GuiLibrary.CreateOptionsButton({
            Name = "AutoBank",
            Tab = visual,
            Function = function(callback)
                AutoBank.Enabled = callback
                if callback then
                spawn(function()
                    repeat wait(0.2)
                        if isAlive(lplr) then
                            if isnearshop() then
                                getitems()
                            else
                                takeitems()
                            end
                        end
                    until (not AutoBank.Enabled)
                end)
            else
                    Enabled = false
                    getitems()
                end
            end
        })
    end)
    runFunction(function()
        local HitFix = {Enabled = false}
        HitFix = GuiLibrary.CreateOptionsButton({
            Name = "HitFix",
            Tab = combat,
            Function = function(callback)
            HitFix.Enabled = callback
                if callback then
                    debug.setconstant(bedwars.SwordController.swingSwordAtMouse, 27, "raycast")
                    debug.setupvalue(bedwars.SwordController.swingSwordAtMouse, 4, bedwars.QueryUtil)
                else
                    debug.setconstant(bedwars.QueueCard.render, 9, 0.01)
                    debug.setconstant(bedwars.SwordController.swingSwordAtMouse, 27, "Raycast")
                end
            end,
        })
    end)
    runFunction(function()
        local Sprint = {Enabled = false}
        Sprint = GuiLibrary.CreateOptionsButton({
            Name = "Sprint",
            Tab = combat,
            Function = function(callback)
                Sprint.Enabled = callback
            if callback then
                RunLoops:BindToHeartbeat("Sprinting", 1, function()
                    if not bedwars["SprintController"].sprinting then
                        bedwars["SprintController"]:startSprinting()
                    end
                end)
            else
                RunLoops:UnbindFromHeartbeat("Sprinting")
                end
            end,
        })
    end)
    runFunction(function()
        local reachval = {Value = 21}
        local Reach = {Enabled = false}
        Reach = GuiLibrary.CreateOptionsButton({
            Name = "Reach",
            Tab = combat,
            Function = function(callback)
            Reach.Enabled = callback
            if callback then
                bedwars["CombatConstant"].RAYCAST_SWORD_CHARACTER_DISTANCE = reachval["Value"]
            else
                bedwars["CombatConstant"].RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
                end
            end,
        })
    end)
    runFunction(function()
        local old
        local Velocity = {Enabled = false}
        Velocity = GuiLibrary.CreateOptionsButton({
            Name = "Velocity",
            Tab = combat,
            Default = false,
            Function = function(callback)
                Velocity.Enabled = callback
                if callback then
                    old = bedwars["KnockbackUtil"].applyKnockback
                    bedwars["KnockbackUtil"].applyKnockback = function() end
                else
                    bedwars["KnockbackUtil"].applyKnockback = old
                end
            end,
        })
    end)
    runFunction(function()
        local old
        local NoClickDelay = {Enabled = false}
        NoClickDelay = GuiLibrary.CreateOptionsButton({
            Name = "NoClickDelay",
            Tab = combat,
            Default = false,
            Function = function(callback)
                NoClickDelay.Enabled = callback
                if callback then
                    old = bedwars["SwordController"].isClickingTooFast
                    bedwars["SwordController"].isClickingTooFast = function(self)
                        self.lastSwing = tick()
                        return false
                    end
                    debug.setconstant(bedwars["SwordController"].attackEntity,23,0.64)
                else
                    bedwars["SwordController"].isClickingTooFast = old
                    debug.setconstant(bedwars["SwordController"].attackEntity,23,0.8)
                end
            end,
        })
    end)


    local antivoidpart
    local antivoidconnection
    runFunction(function()
        local materialList = {}
        for _, material in pairs(Enum.Material:GetEnumItems()) do
            table.insert(materialList, material.Name)
        end
        local anticolor = {["Hue"] = 1, ["Sat"] = 1, ["Value"] = 0.55}
        local AntiVoid = {Enabled = false}
        local AntiVoidMode = {"Collide", "Velocity"}
        local Hue
        local antivoidpartexist = false
        AntiVoid = GuiLibrary.CreateOptionsButton({
            Name = "AntiVoid",
            Tab = world,
            Function = function(callback)
                AntiVoid.Enabled = callback
                if callback then
                    antivoidpartexist = true
                    task.spawn(function()
                        antivoidpart = Instance.new("Part")
                        antivoidpart.CanCollide = false
                        antivoidpart.Size = Vector3.new(10000, 1, 10000)
                        antivoidpart.Anchored = true
                        antivoidpart.Material = Enum.Material.Neon
                        antivoidpart.Color = Color3.fromHSV(anticolor["Hue"], anticolor["Sat"], anticolor["Value"])
                        antivoidpart.Transparency = 0.2
                        antivoidpart.Position = lplr.Character.HumanoidRootPart.Position - Vector3.new(0, 15, 0)
                        antivoidpart.Parent = workspace
                            antivoidconnection = antivoidpart.Touched:Connect(function(touched)
                                lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, 100, 0)
                            end)
                    end)
                else
                    if antivoidconnection then antivoidconnection:Disconnect() end
                    if antivoidpart then
                        antivoidpartexist = false
                        antivoidpart:Remove() 
                    end
                end
            end,
        })
    end)


    runFunction(function()
        local params = RaycastParams.new()
        params.IgnoreWater = true
        function BreakFunction(part)
          local raycastResult = game:GetService("Workspace"):Raycast(part.Position + Vector3.new(0,24,0),Vector3.new(0,-27,0),params)
          if raycastResult then
            local targetblock = raycastResult.Instance
            for i,v in pairs(targetblock:GetChildren()) do
              if v:IsA("Texture") then
                v:Destroy()
              end
            end
            game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@easy-games"):WaitForChild("block-engine"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("DamageBlock"):InvokeServer({
              ["blockRef"] = {
                ["blockPosition"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3))
              },
              ["hitPosition"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3)),
              ["hitNormal"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3))
            })
          end
        end
        function GetBeds()
          local beds = {}
          for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if string.lower(v.Name) == "bed" and v:FindFirstChild("Covers") ~= nil and v:FindFirstChild("Covers").BrickColor ~= lplr.Team.TeamColor then
              table.insert(beds,v)
            end
          end
          return beds
        end
        local BreakerRange = {Value = 30}
        local Breaker = {Enabled = false}
        Breaker = GuiLibrary.CreateOptionsButton({
          Name = "Breaker",
          Tab = world,
          Function = function(callback)
            Breaker.Enabled = callback
            if Breaker.Enabled then
              task.spawn(function()
                RunLoops:BindToHeartbeat("BreakingBlock", 1, function()
                  if not Breaker.Enabled then return end
                  task.spawn(function()
                    if lplr:GetAttribute("DenyBlockBreak") == true then
                      lplr:SetAttribute("DenyBlockBreak",nil)
                    end
                  end)
                  if isAlive(plr) then
                    local beds = GetBeds()
                    for i,v in pairs(beds) do
                      local mag = (v.Position - lplr.Character.PrimaryPart.Position).Magnitude
                      if mag < BreakerRange.Value then
                        BreakFunction(v)
                      end
                    end
                  end
                end)
              end)
            end
          end
        })
      end)

    runFunction(function()
        local NoFall = {Enabled = false}
        NoFall = GuiLibrary.CreateOptionsButton({
            Name = "NoFallDamage",
            Tab = misc,
            Default = false,
            Function = function(callback)
                NoFall.Enabled = callback
                if callback then
                    RunLoops:BindToHeartbeat("GroundHitRemote", 1, function()
                        bedwars.ClientHandler:Get("GroundHit"):SendToServer()
                    end)
                else
                    RunLoops:UnbindFromHeartbeat("GroundHitRemote")
                end
            end,
        })
    end)
