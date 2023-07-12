--//credits monia//configsystem,function and whitelist//7granddad//vapentity//
local GuiLibrary = {}
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
	

    local runFunction = function(func)
        func()
    end      

    local userId = lplr.UserId
    local nothing = [[

    ]]local cam = game:GetService("Workspace").CurrentCamera
    local modules = {}
    
    local BedwarsSwords = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsSwords
    function hashFunc(vec) 
        return {value = vec}
    end
    local function GetInventory(plr)
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
    local function getCurrentSword()
        local sword, swordslot, swordrank = nil, nil, 0
        for i5, v5 in pairs(modules.getCurrentInventory().items) do
            if v5.itemType:lower():find("sword") or v5.itemType:lower():find("blade") or v5.itemType:lower():find("dao") or v5.itemType:lower():find("stone_great_hammer") or v5.itemType:lower():find("diamond_great_hammer") or v5.itemType:lower():find("scythe")  then
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
        repeat task.wait() until lplr.Character.HandInvItem.Value == tool
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
    array.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
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
    function GuiLibrary.CreateOptionsButton(argstable) --> you can add only combat, blatant, visual, misc, world <--
        local TogFunction = {} 
        local toggled = false
        local color = false
        local notification = Instance.new("ScreenGui")

        
        --Properties:
        
        notification.Name = "notification"
        notification.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        

        local DefaultT = argstable["Default"] or false
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
                --[[
                local NotifyFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelFrame = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local ColorEnable = Instance.new("Frame")
                local EnableLabel = Instance.new("TextLabel")
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
                Label.Text = "Module Toggled"
                Label.TextColor3 = Color3.fromRGB(255, 255, 255)
                Label.TextSize = 23.000
                
                ColorEnable.Name = "ColorEnable"
                ColorEnable.Parent = NotifyFrame
                ColorEnable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
                EnableLabel.Text = argstable["Name"] .. "Enabled"
                EnableLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                EnableLabel.TextSize = 26.000
                --]]
                button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
                color = true
            else
                --[[
                local NotifyFrame = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local LabelFrame = Instance.new("Frame")
                local UICorner_2 = Instance.new("UICorner")
                local ColorEnable = Instance.new("Frame")
                local EnableLabel = Instance.new("TextLabel")
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
                Label.Text = "Module Toggled"
                Label.TextColor3 = Color3.fromRGB(255, 255, 255)
                Label.TextSize = 23.000
                
                ColorEnable.Name = "ColorEnable"
                ColorEnable.Parent = NotifyFrame
                ColorEnable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
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
                EnableLabel.Text = argstable["Name"] .. "Enabled"
                EnableLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                EnableLabel.TextSize = 26.000
                --]]
                color = false
                button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
                    else
                    	toggled = false
                        color = false
                    	pcall(argstable.Function, toggled)
                        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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
                pcall(argstable.Function, toggled)
                button.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
            else
                toggled = false
                color = false
                pcall(argstable.Function, toggled)
                button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            end
        end
        task.spawn(function()
            if DefaultT then
                TogFunction.ToggleButton(DefaultT)
            end
        end)
        return TogFunction
    end

    local Settings = {
        Killaura = false,
        Velocity = false
    }

    runFunction(function()
        local killauraswing = true --// change this to false if u dont want sword swing
        local killaurarange = {["Value"] = 21}
        local killauraremote = require(game:GetService("ReplicatedStorage").TS.games.bedwars["bedwars-swords"]).BedwarsMelees
        local Killaura = false
        local sword = getCurrentSword()
        local function attackEntity(plr)
            local root = plr.Character.HumanoidRootPart
            if not root then
                return nil
            end
            
            local selfrootpos = lplr.Character.HumanoidRootPart.Position
            local selfpos = selfrootpos + (killaurarange["Value"] > 14 and (selfrootpos - root.Position).magnitude > 14 and (CFrame.lookAt(selfrootpos, root.Position).lookVector * 4) or Vector3.zero)
    
    
            local args = {
                [1] = {
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
                }
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("SwordHit"):FireServer(unpack(args))
            
            if killauraswing == true then
                playAnimation("rbxassetid://4947108314")
            end
        end
        local Killaura = {Enabled = false}
        Killaura = GuiLibrary.CreateOptionsButton({
            Name = "Aura",
            Tab = combat,
            Default = false,
            Function = function(callback)
                if callback then
                    Killaura = callback
                    RunLoops:BindToHeartbeat("Killaura", 1, function()
                        local plrs = GetAllNearestHumanoidToPosition(killaurarange["Value"] - 0.0001, 1)
                        switchItem(sword.tool)
                        for i,plr in pairs(plrs) do
                            task.spawn(attackEntity, plr)
                        end
                    end)
                else
                    RunLoops:UnbindFromHeartbeat("Killaura")
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
                if callback then
                    old = bedwars["KnockbackUtil"].applyKnockback
                    bedwars["KnockbackUtil"].applyKnockback = function() end
                else
                    bedwars["KnockbackUtil"].applyKnockback = old
                end
            end,
        })
    end)


    spawn(function()
        repeat
          wait(0.5)
            writefile("ZylaCfg.json",game:GetService("HttpService"):JSONEncode(Settings))
        until false
    end)
    local suc, res = pcall(function()
        return game:GetService("HttpService"):JSONDecode(readfile("ZylaCfg.json"))
    end)
     if suc and type(res) == "table" then 
      Settings = res
      if Killaura then
        Killaura.ToggleButton(Settings.Killaura)
      end
      if Velocity then
        Velocity.ToggleButton(Settings.Velocity)
      end
    end
