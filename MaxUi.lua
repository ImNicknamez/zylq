local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()
local WhitelistFunction = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/Chattags/main/stupidwhitelists.lua", true))()
local MaxUiEntity = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxlaserTechAlt/MaxlaserTechAlt.github.io/main/Library/BedwarsFunctionLoader.lua"))()
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
local kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightbedForRoblox/main/Libraries/kavo.lua"))()
if WhitelistFunction.userId then
	print("hi")
end
	local win = kavo:CreateWindow({
		["Title"] = "MaxUi X",
		["Theme"] = "Luna"
	})
local Tabs = shared.TabsLoaded
Tabs = {
    ["Info"] = win.CreateTab("Info"),
    ["Combat"] = win.CreateTab("Combat"),
    ["World"] = win.CreateTab("World"),
    ["Blatant"] = win.CreateTab("Blatant"),
    ["Render"] = win.CreateTab("Render"),
    ["Utility"] = win.CreateTab("Utility"),
	["CustomModule"] = win.CreateTab("CustomModule"),
  }

local Sections = shared.SectionsLoaded
Sections = {
    Tabs["Info"].CreateSection("Credits to Monia - Argstable Kavo"),
    Tabs["Info"].CreateSection("Maxlaser - owner of script"),
	["Sprint"] = Tabs["Combat"].CreateSection("Sprint"),
	["Velocity"] = Tabs["Combat"].CreateSection("Velocity"),
	["Killaura"] = Tabs["Combat"].CreateSection("Killaura"),
	["KillFeed"] = Tabs["Combat"].CreateSection("KillFeed"),
	["Reach"] = Tabs["Combat"].CreateSection("Reach"),
	["AntiVoid"] = Tabs["World"].CreateSection("AntiVoid"),
	["InfJump"] = Tabs["Blatant"].CreateSection("InfJump"),
	["Speed"] = Tabs["Blatant"].CreateSection("Speed"),
	["Cape"] = Tabs["Render"].CreateSection("Cape"),
	["NoFall"] = Tabs["Utility"].CreateSection("NoFall"),
	["CustomModule"] = Tabs["CustomModule"].CreateSection("CustomModule"),
}
local cam = game:GetService("Workspace").CurrentCamera
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
local bedwars = { -- this is litterally the only part of the script that isnt mine :/
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
runFunction(function()
	local Velocity = {Enabled = false}
	Velocity = Sections["Velocity"].CreateToggle({
		Name = "Velocity",
		Function = function(callback)
		if callback then
			Velocity.Enabled = callback

		else

			end
		end,
	})
end)
runFunction(function()
	local killauraswing = true
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
	Killaura = Sections["Killaura"].CreateToggle({
		Name = "Killaura",
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
		HoverText = "Aura"
	})
	Swing = Sections["Killaura"].CreateToggle({
		Name = "Swing",
		Function = function(callback)
			killauraswing = callback
		end,
		HoverText = "Make Sword Swinging Default is true"
	})
	local Animations = {Enabled = false}
	Animations = Sections["Killaura"].CreateToggle({
		Name = "Animations",
		Function = function(callback)
		if callback then
			Animations = callback
    		
			local Distance = {["Value"] = 21}
			local Enabled = state
			local originalNeckC0
			local originalRootC0
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
					local origC0 = cam.Viewmodel.RightHand.RightWrist.C0
			local ui2 = Instance.new("ScreenGui")
			local nearestID = nil
			ui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            repeat
                if entity.isAlive then
                    for _,v in pairs(game.Players:GetPlayers()) do
                        if v ~= lplr then
                            nearestID = v
                            target = v.Character
                            if v.Team ~= lplr.Team and v ~= lplr and entity.isAlive and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
                                local sword = getSword()
                                if sword ~= nil then
                                    function swing()
                                        spawn(function()
                                            pcall(function()
                                                for i,v in pairs(anims.Latest) do 
                                                    anim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(v.Time), {C0 = origC0 * v.CFrame})
                                                    anim:Play()
                                                    wait(v.Time)
                                                end
                                            end)
                                        end)
                                    end
                                    coroutine.wrap(swing)()
            
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
                                end
                            end
                        end
                    end
                end
                wait(0.30);	
                bedwars["SwordController"].lastAttack = game:GetService("Workspace"):GetServerTimeNow() - 0.11
                local function redo()
                    if cam.Viewmodel.RightHand.RightWrist.C0 ~= origC0 then
                        pcall(function()
                            anim:Cancel()
                        end)
                        anim2 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.364), {C0 = origC0})
                        anim2:Play()
                    end
                end
                coroutine.wrap(redo)()
            until (not Animations.Enabled)  
			end
		end,
		HoverText = "Make Sword Swinging Default is true"
	})

	Range = Sections["Killaura"].CreateSlider({
		Name = "Range",
		Min = 1,
		Max = 21,
		Default = 21,
		Function = function(val) 
		killaurarange["Value"] = val
		end,
	})
end)
runFunction(function()
	local KillFeed = {Enabled = false}
	KillFeed = Sections["KillFeed"].CreateToggle({
		Name = "KillFeed",
		Function = function(callback)
        if callback then
            game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = false
        else
            game:GetService("Players").LocalPlayer.PlayerGui.KillFeedGui.KillFeedContainer.Visible = true
            end
        end,
		HoverText = "Remove knockbacks."
	})
end)
local bedwars = {}
runFunction(function()
    local reachval = {Value = 20}
	local Reach = {Enabled = false}
	Reach = Sections["Reach"].CreateToggle({
		Name = "Reach",
		Function = function(callback)
        if callback then
            bedwars["CombatConstant"].RAYCAST_SWORD_CHARACTER_DISTANCE = reachval["Value"]
		else
			bedwars["CombatConstant"].RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
            end
        end,
		HoverText = "Remove knockbacks."
	})
end)
runFunction(function()
    local antivoidpart
    local antivoidconnection
    local materialList = {}
    for _, material in pairs(Enum.Material:GetEnumItems()) do
        table.insert(materialList, material.Name)
    end
    local anticolor = {["Hue"] = 1, ["Sat"] = 1, ["Value"] = 0.55}
	local AntiVoid = {Enabled = false}
    local AntiVoidMode = {"Collide", "Velocity"}
    local Hue
    local antivoidpartexist = false
	AntiVoid = Sections["AntiVoid"].CreateToggle({
		Name = "AntiVoid",
		Function = function(callback)
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
		HoverText = "AntiVoid Basic and easy to explain"
	})
    Sections["AntiVoid"].CreateDropdown({
		Name = "Mode",
		HoverText = "Mode queue that you want.",
		List = AntiVoidMode,
		Function = function(val)
            AntiVoidMode = val
            if AntiVoidMode == "Velocity" and antivoidpartexist == true then
                antivoidpart.CanCollide = false
            else
                repeat wait() until antivoidpartexist == true
                if AntiVoidMode == "Velocity" and antivoidpartexist == true then
                    antivoidpart.CanCollide = false
                end
            end
            if AntiVoidMode == "Collide" and antivoidpartexist == true then
                antivoidpart.CanCollide = true
            else
                repeat wait() until antivoidpartexist == true
                if AntiVoidMode == "Collide" and antivoidpartexist == true then
                    antivoidpart.CanCollide = true
                end
            end
        end,
	})
    Sections["AntiVoid"].CreateDropdown({
		Name = "Materials",
		HoverText = "Mode queue that you want.",
		List = materialList,
		Function = function(val)
            if antivoidpart then
                antivoidpart.Material = Enum.Material[val]
            end
        end,
	})
    Sections["AntiVoid"].CreateColorPicker({
	    Name = "Color",
		Default = Color3.fromHSV(anticolor["Hue"], anticolor["Sat"], anticolor["Value"]),
		Function = function(col)
		if antivoidpart then
				antivoidpart.Color = col
			end
		end,
	})
end)

runFunction(function()
	local InfJump = {Enabled = false}
    local InfiniteJumpEnabled = true
	InfJump = Sections["InfJump"].CreateToggle({
		Name = "InfJump",
		Function = function(callback)
            game:GetService("UserInputService").JumpRequest:connect(function() 
                if InfiniteJumpEnabled then 
                    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping") 
                end 
            end)
        end,
		HoverText = "Jump inf"
	})
end)
local networkownertick = tick()
local isnetworkowner = isnetworkowner or function(part)
  if gethiddenproperty(part, "NetworkOwnershipRule") == Enum.NetworkOwnership.Manual then 
      sethiddenproperty(part, "NetworkOwnershipRule", Enum.NetworkOwnership.Automatic)
      networkownertick = tick() + 8
  end
  return networkownertick <= tick()
end
runFunction(function()
	local SpeedMode = {"Normal", "CFrame"}
    local player = game:GetService("Players")
    local cam = workspace.CurrentCamera
	local Speed = {Enabled = false}
    local Speed = true
	Speed = Sections["Speed"].CreateToggle({
		Name = "Speed",
		Function = function(callback)
            Speed.Enabled = callback
            repeat wait()
            if SpeedMode == "CFrame" then
                print("Cframe speed")
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
                spawn(function()
                    local hrp = lplr.Character:FindFirstChild("HumanoidRootPart")
                    local hum = lplr.Character:FindFirstChild("Humanoid")
                    if isnetworkowner(hrp) and hum.MoveDirection.Magnitude > 0 then
                        lplr.Character:TranslateBy(hum.MoveDirection * 0.057)
                    end
                end)
            else
                print("Normal speed")
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23.3
            end
        until (not Speed.Enabled)
        end,
		HoverText = "Make you Humanoid Or Character Faster!"
	})
    Sections["Speed"].CreateDropdown({
		Name = "Mode",
		HoverText = "Mode queue that you want.",
		List = SpeedMode,
		Function = function(val)
            SpeedMode = val
            notify("Speed", "Speed Mode Is Now ".. SpeedMode, 5)
		end
	})
end)
runFunction(function()
    local playersService = game:GetService("Players")
    local lplr = playersService.LocalPlayer
    function Cape(char, texture)
		for i,v in pairs(char:GetDescendants()) do
			if v.Name == "Cape" then
				v:Remove()
			end
		end
		local hum = char:WaitForChild("Humanoid")
		if char:FindFirstChild("Torso") then
			torso = char.Torso
		else
			torso = char.UpperTorso
		end
		local p = Instance.new("Part", torso.Parent)
		p.Name = "Cape"
		p.Anchored = false
		p.CanCollide = false
		p.TopSurface = 0
		p.BottomSurface = 0
		p.FormFactor = "Custom"
		p.Size = Vector3.new(0.2,0.2,0.2)
		p.Transparency = 1
		local decal = Instance.new("Decal", p)
		decal.Texture = texture
		decal.Face = "Back"
		local msh = Instance.new("BlockMesh", p)
		msh.Scale = Vector3.new(9,17.5,0.5)
		local motor = Instance.new("Motor", p)
		motor.Part0 = p
		motor.Part1 = torso
		motor.MaxVelocity = 0.01
		motor.C0 = CFrame.new(0,2,0) * CFrame.Angles(0,math.rad(90),0)
		motor.C1 = CFrame.new(0,1,0.45) * CFrame.Angles(0,math.rad(90),0)
		local wave = false
		repeat wait(1/44)
		decal.Transparency = torso.Transparency
		local ang = 0.1
		local oldmag = torso.Velocity.magnitude
		local mv = 0.002
		if wave then
			ang = ang + ((torso.Velocity.magnitude/10) * 0.05) + 0.05
			wave = false
		else
			wave = true
		end
		ang = ang + math.min(torso.Velocity.magnitude/11, 0.5)
		motor.MaxVelocity = math.min((torso.Velocity.magnitude/111), 0.04) --+ mv
		motor.DesiredAngle = -ang
		if motor.CurrentAngle < -0.2 and motor.DesiredAngle > -0.2 then
			motor.MaxVelocity = 0.04
		end
		repeat wait() until motor.CurrentAngle == motor.DesiredAngle or math.abs(torso.Velocity.magnitude - oldmag) >= (torso.Velocity.magnitude/10) + 1
		if torso.Velocity.magnitude < 0.1 then
			wait(0.1)
		end
        until not p or p.Parent ~= torso.Parent
    end
    local Cape = {Enabled = true}
    local CapeValue = {Value = 13609964699}
	Cape = Sections["Cape"].CreateToggle({
		Name = "Custom Cape",
		Function = function(callback)
        if callback then
            Cape.Enabled = callback
            lplr.CharacterAdded:Connect(function(char)
                spawn(function()
                    pcall(function() 
                        Cape(char, ("rbxthumb://type=Asset&id=" .. 13609964699 or CapeValue["Value"] .. "&w=420&h=420"))
                    end)
                end)
            end)
            if lplr.Character then
                spawn(function()
                    pcall(function() 
                        Cape(lplr.Character, ("rbxthumb://type=Asset&id=" .. 13609964699 or CapeValue["Value"] .. "&w=420&h=420"))
                    end)
                end)
            end
            end
        end,
		HoverText = "Customizeable cape"
	})
    Sections["Cape"].CreateTextBox({
		Name = "Cape Id",
		HoverText = "Mode queue that you want.",
		Function = function(val) 
            CapeValue["Value"] = val
        end,
	})
end)
runFunction(function()
    local ClientHandler = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
    local bedwars = {}
    local NoFall = {Enabled = true}
	NoFall = Sections["NoFall"].CreateToggle({
		Name = "NoFallDamage",
		Function = function(callback)
        if callback then
                Cape.Enabled = callback
                repeat wait()
                    bedwars.ClientHandler:Get("GroundHit"):SendToServer()
                until (not NoFall.Enabled)
            end
        end,
		HoverText = "Make U Take No Damage when falling"
	})
end)