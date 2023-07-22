
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxlaserTechAlt/MaxlaserTechAlt.github.io/main/KavoCustom.lua"))()

local Window = Library.CreateLib("MaxUi X | Game", "Luna")
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()
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
		for i2,v2 in
		pairs(game:GetService("CollectionService"):GetTagged("DiamondGuardian")) do --monsters
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


local Settings = {
	Sprint = false,
	Velocity = false,
    Reach = false,
    NoClickDelay = false,
    Killaura = false,
    Animations = false,
    SwordSwing = false,
    NoSlow = false,
    NoFall = false,
    Bob = false,
    FovChanger = false,
    Breaker = false,
    Bank = false,
    AntiVoid = false,
    Stealer = false
}

local array = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxlaserTechAlt/MaxlaserTechAlt.github.io/main/Arraylist.lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaxlaserTechAlt/MaxlaserTechAlt.github.io/main/MemzNotify"))()

local function on(Message, Time)
    Notification:SendNotification("Success", Message .. " - Has been enabled!", Time)
end

local function off(Message, Time)
    Notification:SendNotification("Error", Message .. " - Has been disabled!", Time)
end

local function warn(Message, Time)
    Notification:SendNotification("Warning", Message, Time)
end

local function info(Message, Time)
    Notification:SendNotification("Info", Message, Time)
end

local function MaxUi(Message, Time)
    Notification:SendNotification("MaxUi", Message, Time)
end

local Tab1 = Window:NewTab("Combat")
local Tab2 = Window:NewTab("Blatant")
local Tab3 = Window:NewTab("Render")
local Tab4 = Window:NewTab("Utillity")
local Tab5 = Window:NewTab("World")

   

    local Tab6 = Window:NewTab("Credits")
    function cred(txt)
        local Tab6Section = Tab6:NewSection(txt)
    end

    cred("Made By MaxlaserTech")
    cred("Monia - Theme Luna")
    cred("Maxlaser/Monia - Config System")
    cred("Vamp/Monia - PlaceId Check")
    cred("IamHamza/Icecat - NoBob/Animations")
    cred("7GrandDad - Vape entity")
    cred("Arraylist/Notification MemzWare Source ig")
    cred("If Anyone Showcase it Thanks Ig!")

    local Tab1Section = Tab1:NewSection("Sprint")
    local Enabled = false
    
    local Sprint = Tab1Section:NewToggle("Sprint", "Automatic Sprinting For You I think?", function(callback)
        if callback then
            Enabled = true
            Settings.Sprint = true
            array.Add("AutoSprint")
            on("AutoSprint", 2)
            RunLoops:BindToHeartbeat("Sprinting", 1, function()
                if not bedwars["SprintController"].sprinting then
                    bedwars["SprintController"]:startSprinting()
                end
            end)
        else
            Settings.Sprint = false
            off("AutoSprint", 1)
            array.Remove("AutoSprint")
            RunLoops:UnbindFromHeartbeat("Sprinting")
            Enabled = false
        end
    end)


    
    


local Tab1Section = Tab1:NewSection("NoKnockBack")
local omg = callback
local Enabled = false
local old
local Velocity = Tab1Section:NewToggle("Velocity", "NoKnockback !", function(omg)
    if omg then
        on("Velocity", 2)
        Enabled = true
        Settings.Velocity = true
        array.Add("Velocity")
        old = bedwars["KnockbackUtil"].applyKnockback
        bedwars["KnockbackUtil"].applyKnockback = function() end
    else
        Enabled = false
        Settings.Velocity = false
        off("Velocity", 2)
        array.Remove("Velocity")
        bedwars["KnockbackUtil"].applyKnockback = old
        old = nil
    end
end)




local Tab1Section = Tab1:NewSection("Reach")
local Enabled = false
local reachval = {["Value"] = 17}
local Reach = Tab1Section:NewToggle("Reach", "Change Reach", function(callback)
    if callback then
        Enabled = true
        on("Reach", 2)
        Settings.Reach = true
        array.Add("Reach : ".. reachval["Value"])
        CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = (reachval["Value"] - 0.0001)
    else
        Settings.Reach = false
        off("Reach", 2)
        array.Remove("Reach".. reachval["Value"])
        CombatConstant.RACombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
        Enabled = false
    end
end)



Tab1Section:NewSlider("Reach Value", "Value OF Reach", 17, 0.1, function(val) -- 500 (MaxValue) | 0 (MinValue)
    reachval["Value"] = val
end)

local Tab1Section = Tab1:NewSection("NoClickCap")
local Enabled = false
local old
local NoClickDelay = Tab1Section:NewToggle("NoClickDelay", "Remove Click Cap", function(callback)
    if callback then
        Enabled = true
        Settings.NoClickDelay = true
        array.Add("NoClickDelay")
        old = bedwars["SwordController"].isClickingTooFast
        bedwars["SwordController"].isClickingTooFast = function(self)
            self.lastSwing = tick()
            return false
        end
        debug.setconstant(bedwars["SwordController"].attackEntity,23,0.64)
    else
        Settings.NoClickDelay = false
        array.Remove("NoClickDelay")
        bedwars["SwordController"].isClickingTooFast = old
        debug.setconstant(bedwars["SwordController"].attackEntity,23,0.8)
        Enabled = false
    end
end)
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
	if lplr.Character.Humanoid.Health > 0 then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end
runcode(function()
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

local Tab2Section = Tab2:NewSection("Aura")
local killauraswing = {Enabled = true}
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
    if killauraswing.Enabled == true then
        playAnimation("rbxassetid://4947108314")
    end
end
local Killaura = Tab2Section:NewToggle("Killaura", "Attack players/enemies that are near.", function(callback)
    if callback then    
        Killaura.Enabled = callback
        RunLoops:BindToHeartbeat("Killaura", 1, function()
            local plrs = GetAllNearestHumanoidToPosition(killaurarange["Value"] - 0.0001, 1)
            for i,plr in pairs(plrs) do
                switchItem(sword.tool)
                task.spawn(attackEntity, plr)
                
            end
        end)
    else
        RunLoops:UnbindFromHeartbeat("Killaura")
    end
end)
Tab2Section:NewSlider("Range", "Aura Range", 26, 1, function(val)
    killaurarange["Value"] = val
end)	
Tab2Section:NewButton("Show Target", "When u use it you killaura will 50% slower", function()
    AuraBox()
end)	
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
    local origC0 = cam.Viewmodel.RightHand.RightWrist.C0
	local originalArmC0
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
local Animations = {["Value"] = "Latest"}
local Animations = Tab2Section:NewToggle("Animations", "?", function(callback)
    if callback then
        Enabled = callback
        print("enableds")
        local Distance = {["Value"] = 21}
        local ui2 = Instance.new("ScreenGui")
        local nearestID = nil
        ui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        repeat
            if isAlive(lplr) then
                for _,v in pairs(game.Players:GetPlayers()) do
                    if v ~= lplr then
                        nearestID = v
                        target = v.Character
                        if v.Team ~= lplr.Team and v ~= lplr and isAlive(lplr) and v.Character:FindFirstChild("HumanoidRootPart") and (v.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).Magnitude < 20 then
                            if sword ~= nil then
                                spawn(function()
                                    pcall(function()
                                        if originalArmC0 == nil then
                                            originalArmC0 = cam.Viewmodel.RightHand.RightWrist.C0
                                        end
                                        for i,v in pairs(anims.Latest) do 
                                            anim = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(v.Time), {C0 = originalArmC0 * v.CFrame})
                                            anim:Play()
                                            wait(v.Time)
                                        end
                                    end)
                                end)
                            end
                        end
                    end
                end
            end
            wait(0.28);	
            bedwars["SwordController"].lastAttack = game:GetService("Workspace"):GetServerTimeNow() - 0.11
                if cam.Viewmodel.RightHand.RightWrist.C0 ~= origC0 then
                    pcall(function()
                        anim:Cancel()
                    end)
                    anim2 = game:GetService("TweenService"):Create(cam.Viewmodel.RightHand.RightWrist, TweenInfo.new(0.364), {C0 = origC0})
                    anim2:Play()
                end
            until (not Animations.Enabled)
        end
   end)
Tab2Section:NewDropdown("Select Anims", "Anims Selector", {"Normal", "Slow", "New", "Latest", "VerticalSpin","Exhibition","ExhibitionOld"}, function(val)
    Animations["Value"] = val
end)


   local Remote = require(game:GetService("ReplicatedStorage"):WaitForChild("TS"):WaitForChild("remotes")).default.Client
   function fetchBed()
           local selectedBed
           for _, bed in next, workspace:GetChildren() do
                   if bed.Name == "bed" and not selectedBed then
                           local covers = bed:WaitForChild("Covers")
                           if lplr.TeamColor ~= covers.BrickColor then
                                   selectedBed = bed
                           end
                   end
           end
           return (selectedBed)
   end
   Tab2Section:NewButton("BedTp", "Teleport To Bed", function(callback)
    chr = lplr.Character
    if not isAlive(plr) then
        info("You Will Teleport To The Bed When Game Started", 3)
        repeat wait() until matchState() == 1
        wait(.25)
        if lplr and chr then
            local bed = fetchBed()
            local tppos2 = bed.Position + Vector3.new(0, 10, 0)
            local hum = chr:FindFirstChildWhichIsA("Humanoid")
            local root = chr:WaitForChild("HumanoidRootPart")
            local check = (lplr:GetAttribute("LastTeleported") - lplr:GetAttribute("SpawnTime")) < 1
            con = game:GetService("RunService").Heartbeat:Connect(function(dt)
                local dist = ((check and 700 or 1200) * dt)
                if (tppos2 - root.CFrame.p).Magnitude > dist then
                    root.CFrame = root.CFrame + (tppos2 - root.CFrame.p).Unit * dist
                    local yes = (tppos2 - root.CFrame.p).Unit * 20
                    root.Velocity = Vector3.new(yes.X, root.Velocity.Y, yes.Z)
                else
                    root.CFrame = root.CFrame + (tppos2 - root.CFrame.p)
                end
            end)
            repeat
                wait()
            until (tppos2 - root.CFrame.p).Magnitude < 10
    
            con:Disconnect()
        end
    end
    if isAlive(lplr) then
        info("Resetting To Teleport", 5)
        if lplr and chr then
                local bed = fetchBed()
                local tppos2 = bed.Position + Vector3.new(0, 10, 0)
                local hum = chr:FindFirstChildWhichIsA("Humanoid")
                con = lplr.CharacterAdded:Connect(function(chr)
                        con:Disconnect()
                        wait(.35)
                        local root = chr:WaitForChild("HumanoidRootPart")
                        local check = (lplr:GetAttribute("LastTeleported") - lplr:GetAttribute("SpawnTime")) < 1
                        con = game:GetService("RunService").Heartbeat:Connect(function(dt)
                                local dist = ((check and 700 or 1200) * dt)
                                                        if (tppos2 - root.CFrame.p).Magnitude > dist then
                                                                root.CFrame = root.CFrame + (tppos2 - root.CFrame.p).Unit * dist
                                                                local yes = (tppos2 - root.CFrame.p).Unit * 20
                                                                root.Velocity = Vector3.new(yes.X, root.Velocity.Y, yes.Z)
                                                        else
                                                                root.CFrame = root.CFrame + (tppos2 - root.CFrame.p)
                                                        end
                        end)
                        repeat
                                wait()
                        until (tppos2 - root.CFrame.p).Magnitude < 10

                        con:Disconnect()
                end)
                Remote:Get("ResetCharacter"):SendToServer()
        end
    end
end)

local SwordSwing = Tab2Section:NewToggle("SwordSwing", "Swing Sword", function(callback)
    if callback then
        Settings.SwordSwing = true
        killauraswing = true
    else
        Settings.SwordSwing = true
        killauraswing = false
    end
end)

function speedcheckbypass(wait)
    repeat task.wait(wait)
    local args = {
        [1] = {
            ["partPositions"] = {
                [1] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame),
                [2] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame),
                [3] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame),
                [4] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame),
                [5] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame),
                [6] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame),
                [7] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
            },
            ["partSize"] = Vector3.new(999999, 0.5, 9999.99999999999999999999)
        }
    }
until false
end

local Tab2Section = Tab2:NewSection("Speed")
local EnabledSpeed = false
local SpeedSlider = {["Value"] = 23}
local Multiplier = {["Value"] = 0.057}
Tab2Section:NewToggle("Speed", "", function(callback)
    if callback then
        speedcheckbypass(0.1)
        on("Speed", 3)
        info("Speed Value is ".. SpeedSlider["Value"], 3)
        EnabledSpeed = true
        array.Add("Speed : ".. SpeedSlider["Value"])
    else
        off("Speed", 3)
        EnabledSpeed = false
    end
end)

local SpeedMode = {Value = "Heatseeker"}
local SpeedSlider = false
Tab2Section:NewSlider("Speed", "SpeedMode", 23, 23, function(val)
    repeat wait() until EnabledSpeed == true
    SpeedSlider = true
    repeat wait()
        
    if SpeedMode["Value"] == "Normal" and EnabledSpeed == true then
        repeat wait()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
        until EnabledSpeed == false
    end
    if SpeedMode["Value"] == "Heatseeker" and EnabledSpeed == true then
        repeat wait()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
            wait(1)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
        until EnabledSpeed == false
    end
    if SpeedMode["Value"] == "Tpwalk" and EnabledSpeed == true then
        spawn(function()
        repeat wait()
            local hrp = lplr.Character:FindFirstChild("HumanoidRootPart")
            local hum = lplr.Character:FindFirstChild("Humanoid")
            if isnetworkowner(hrp) and hum.MoveDirection.Magnitude > 0 then
                lplr.Character:TranslateBy(hum.MoveDirection * Multiplier["Value"])
            end
        until EnabledSpeed == false
        end)
    end
    until not SpeedSlider
end)

local Slowdown = false
local NoSlow = Tab2Section:NewToggle("NoSlowDown", "", function(callback)
    if callback then
        Slowdown = true
        Settings.NoSlow = true
        on("NoSlowDown", 3)
        array.Add("NoSlowDown")
        RunLoops:BindToHeartbeat("NoSlowDown", 1, function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
        end)
    else
        Settings.NoSlow = false
        RunLoops:UnbindFromHeartbeat("NoSlowDown")
        off("NoSlowDown", 3)
        array.Remove("NoSlowDown")
        Slowdown = false
    end
end)
Tab2Section:NewDropdown("Select Mode", "Anims Selector", {"Normal", "Heatseeker", "Tpwalk"}, function(mode)
    SpeedMode["Value"] = mode
end)

local HighJumpEnabled = false
local Tab2Section = Tab2:NewSection("HighJump")
local HighJumpVal = {["Value"] = 150}
local HighJumpGrav = {["Value"] = 35}
local HighJump = Tab2Section:NewButton("HighJump", "highjump op!1!!!1!11", function()
    off("HighJump", 3)
    workspace.Gravity = HighJumpGrav["Value"]
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.Velocity = Vector3.new(0, HighJumpVal["Value"], 0)
    wait(1)
    workspace.Gravity = 196.579
end)
Tab2Section:NewKeybind("KeyBind", "HighJump Bind", Enum.KeyCode.B, function()
    off("HighJump", 3)
    workspace.Gravity = HighJumpGrav["Value"]
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.Velocity = Vector3.new(0, HighJumpVal["Value"], 0)
    wait(1)
    workspace.Gravity = 196.579
end)
Tab2Section:NewSlider("Gravity Value", "gravity", 200, 1, function(val)
    HighJumpGrav["Value"] = val
end)
Tab2Section:NewSlider("HighJump Value", "Fucking Op", 700, 1, function(val)
    HighJumpVal["Value"] = val
end)


local function studtoblock(startpos, pos)
    local mag = math.round((startpos - pos).Magnitude / 3)
    return mag
end
local Tab2Section = Tab2:NewSection("Fly")
local EnabledFly = false
local starttick
local startpos1
local part
local velo
local flyVelocity;
local flytime;
local blocks
local cam = workspace.CurrentCamera
local part
local oldchar
local funnyFly
local FlyVerticalSpeed = {Value = 80}
local bodyVelocity
local EnabledInfFly = false
Tab2Section:NewKeybind("InfFly", "Inf Fly Fly", Enum.KeyCode.Y, function()
    if EnabledInfFly == false then
        starttick = tick()
        startpos1 = lplr.Character.HumanoidRootPart.Position
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
        on("Infinite Fly", 3)
        array.Add("Infinite Fly")
        EnabledInfFly = true
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
				RunLoops:UnbindFromHeartbeat("FunnyFlyVeloEnd");
        off("Infinite Fly", 3)
        array.Remove("Infinite Fly")
        EnabledInfFly = false 
        spawn(function()
            flytime = math.abs(math.round(starttick - tick()))
            blocks = studtoblock(startpos1, lplr.Character.HumanoidRootPart.Position)
            info("Infinite Fly flew " .. tostring(flytime) .. " and " .. blocks .. " blocks", 2)
            wait(0.1)
        end)
    end
end) 
Tab2Section:NewKeybind("Fly", "Fly", Enum.KeyCode.R, function()
    if EnabledFly == false then
        on("Fly", 3)
        starttick = tick()
        startpos1 = lplr.Character.HumanoidRootPart.Position
        print("true")
        array.Add("Fly : ".. FlyVerticalSpeed["Value"])
        EnabledFly = true
        starttick = tick()
        startpos1 = lplr.Character.HumanoidRootPart.Position
        local UserInputService = game:GetService("UserInputService")
        local character = game.Players.LocalPlayer.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        
        UserInputService.InputBegan:Connect(function(inputObject)
            if inputObject.KeyCode == Enum.KeyCode.Space then
                bodyVelocity.Velocity = Vector3.new(0, FlyVerticalSpeed.Value, 0)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(inputObject)
            if inputObject.KeyCode == Enum.KeyCode.Space then
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end)
                        UserInputService.InputBegan:Connect(function(inputObject)
                            if inputObject.KeyCode == Enum.KeyCode.LeftShift then
                                bodyVelocity.Velocity = Vector3.new(0, -50, 0)
                            end
                        end)
                        
                        UserInputService.InputEnded:Connect(function(inputObject)
                            if inputObject.KeyCode == Enum.KeyCode.LeftShift then
                                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                            end
                        end)
                        repeat
                            wait(2)
                            local Players = game:GetService("Players")
                            local player = Players.LocalPlayer
                            local character = player.Character or player.CharacterAdded:Wait()
                            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                            raycastParams.FilterDescendantsInstances = {character}
                        
                            -- Store the player's current position
                            local currentPosition = humanoidRootPart.CFrame
                        
                            -- Create a ray starting from the player's current position and pointing straight down
                            local ray = Ray.new(currentPosition.Position, Vector3.new(0, -1000, 0))
                        
                            -- Perform the raycast and get the result
                            local result = workspace:Raycast(ray.Origin, ray.Direction, raycastParams)
                        
                            if result then
                                -- If the raycast hit something, teleport the player's character to that position
                                local groundPosition = CFrame.new(result.Position)
                                humanoidRootPart.CFrame = groundPosition
                        
                                -- Wait for a short time
                                wait(.15)
                        
                                -- Teleport the player's character back to their previous position
                                humanoidRootPart.CFrame = currentPosition
                            else
                                -- If the raycast did not hit anything, wait until it does
                                repeat
                                    wait()
                                    result = workspace:Raycast(ray.Origin, ray.Direction, raycastParams)
                                until result
                        
                                -- Teleport the player's character to the position of the part below them
                                local groundPosition = CFrame.new(result.Position)
                                humanoidRootPart.CFrame = groundPosition
                        
                                -- Wait for a short time
                                wait(.1)
                        
                                -- Teleport the player's character back to their previous position
                                humanoidRootPart.CFrame = currentPosition
                            end
                        until not EnabledFly
                        
    else
        EnabledFly = false
        off("Fly", 3)
        array.Remove("Fly : ".. FlyVerticalSpeed["Value"])
        bodyVelocity:Destroy()
        print("false")    
        spawn(function()
            flytime = math.abs(math.round(starttick - tick()))
            blocks = studtoblock(startpos1, lplr.Character.HumanoidRootPart.Position)
            info("Fly flew " .. tostring(flytime) .. " and " .. blocks .. " blocks", 2)
            wait(0.1)
        end) 
    end
end) 



Tab2Section:NewSlider("VerticalSpeed", "Fly Vertical Speed", 150, 0, function(val)
    FlyVerticalSpeed["Value"] = val
end)

local MobileZephyr = Instance.new("ScreenGui")
local MobileSettingsZephyr = Instance.new("Frame")
local UIGridLayout = Instance.new("UIGridLayout")
local HighJump = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")

MobileZephyr.Name = "MobileZephyr"
MobileZephyr.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MobileZephyr.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
MobileZephyr.ResetOnSpawn = false

MobileSettingsZephyr.Name = "MobileSettingsZephyr"
MobileSettingsZephyr.Parent = MobileZephyr
MobileSettingsZephyr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MobileSettingsZephyr.BackgroundTransparency = 1.000
MobileSettingsZephyr.Position = UDim2.new(0, 0, 0.0458823517, 0)
MobileSettingsZephyr.Size = UDim2.new(0.110433191, 0, 0.955294132, 0)

UIGridLayout.Parent = MobileSettingsZephyr
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 128, 0, 57)

Tab2Section:NewButton("Mobile Fly + InfFly Button", "", function()

local EnabledFlyPhone = false
local TextButton = Instance.new("TextButton")
TextButton.Parent = MobileSettingsZephyr
TextButton.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
TextButton.BorderColor3 = Color3.fromRGB(86, 86, 86)
TextButton.Position = UDim2.new(0.591824293, 0, 0.308235288, 0)
TextButton.Size = UDim2.new(0.707182348, 0, 0.0701970458, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Fly"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
local bodyVelocity
TextButton.MouseButton1Down:Connect(function()
    if EnabledFlyPhone == false then
        EnabledFlyPhone = true
        array.Add("Fly")
        on("Fly", 5)
    local UserInputService = game:GetService("UserInputService")
    local character = game.Players.LocalPlayer.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    
    UserInputService.InputBegan:Connect(function(inputObject)
        if inputObject.KeyCode == Enum.KeyCode.Space then
            bodyVelocity.Velocity = Vector3.new(0, 100, 0)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(inputObject)
        if inputObject.KeyCode == Enum.KeyCode.Space then
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        end
    end)
                    UserInputService.InputBegan:Connect(function(inputObject)
                        if inputObject.KeyCode == Enum.KeyCode.LeftShift then
                            bodyVelocity.Velocity = Vector3.new(0, -FlyVerticalSpeed.Value, 0)
                        end
    end)
                    
    UserInputService.InputEnded:Connect(function(inputObject)
                        if inputObject.KeyCode == Enum.KeyCode.LeftShift then
                            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                        end
    end)
    repeat wait(2)
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        raycastParams.FilterDescendantsInstances = {character}

        -- Store the player's current position
        local currentPosition = humanoidRootPart.CFrame

        -- Create a ray starting from the player's current position and pointing straight down
        local ray = Ray.new(currentPosition.Position, Vector3.new(0, -1000, 0))

        -- Perform the raycast and get the result
        local result = workspace:Raycast(ray.Origin, ray.Direction, raycastParams)

        if result then
            -- If the raycast hit something, teleport the player's character to that position
            local groundPosition = CFrame.new(result.Position)
            humanoidRootPart.CFrame = groundPosition

            -- Wait for a short time
            wait(.15)

            -- Teleport the player's character back to their previous position
            humanoidRootPart.CFrame = currentPosition
        end
    until not EnabledFlyPhone
    else
        off("Fly", 3)
        EnabledFlyPhone = false
        array.Remove("Fly")
        bodyVelocity:Destroy()
    end
end)

local TextButton2 = Instance.new("TextButton")
TextButton2.Parent = MobileSettingsZephyr
TextButton2.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
TextButton2.BorderColor3 = Color3.fromRGB(86, 86, 86)
TextButton2.Position = UDim2.new(0.591824293, 0, 0.308235288, 0)
TextButton2.Size = UDim2.new(0.707182348, 0, 0.0701970458, 0)
TextButton2.Font = Enum.Font.SourceSans
TextButton2.Text = "InfFly"
TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton2.TextScaled = true
TextButton2.TextSize = 14.000
TextButton2.TextWrapped = true
local bodyVelocity
TextButton2.MouseButton1Down:Connect(function()
    if EnabledInfFly == false then
        starttick = tick()
        startpos1 = lplr.Character.HumanoidRootPart.Position
        local origy = entity.character.HumanoidRootPart.Position.y;
        part = Instance.new("Part", workspace);
        part.Size = Vector3.new(1, 1, 1);
        part.Name = "BetterFlyPart"
        part.Transparency = 1;
        part.Anchored = true;
        part.CanCollide = false;
        cam.CameraSubject = part;

        local cf = entity.character.HumanoidRootPart.CFrame;
        entity.character.HumanoidRootPart.CFrame = CFrame.new(cf.x, 30000, cf.z);
        if (entity.character.HumanoidRootPart.Position.X < 50000) then
            entity.character.HumanoidRootPart.CFrame *= CFrame.new(0, 10000, 0)
        end


            
        RunLoops:BindToHeartbeat("FunnyFlyPart", 1, function(Delta)			
            local pos = entity.character.HumanoidRootPart.Position;
            part.Position = Vector3.new(pos.x, origy, pos.z);				
        end);
        on("Infinite Fly", 3)
        array.Add("Infinite Fly")
        EnabledInfFly = true
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
				RunLoops:UnbindFromHeartbeat("FunnyFlyVeloEnd");
        off("Infinite Fly", 3)
        array.Remove("Infinite Fly")
        EnabledInfFly = false 
        spawn(function()
            flytime = math.abs(math.round(starttick - tick()))
            blocks = studtoblock(startpos1, lplr.Character.HumanoidRootPart.Position)
            info("Infinite Fly flew " .. tostring(flytime) .. " and " .. blocks .. " blocks", 2)
            wait(0.1)
        end)
    end
end)
end)


UITextSizeConstraint_2.Parent = TextButton
UITextSizeConstraint_2.MaxTextSize = 57

UITextSizeConstraint_3.Parent = TextButton2
UITextSizeConstraint_3.MaxTextSize = 57


local Tab2Section = Tab2:NewSection("Scaffold")
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

local Enabled = false
local ExpendSlider = {Value = 5}
local ScaffoldEnabled = Tab2Section:NewToggle("Scaffold", "AutoMatic Place Block For you", function(callback)
    if callback then
        Enabled = true
        on("Scaffold", 3)
        array.Add("Scaffold : ".. ExpendSlider["Value"])
        task.spawn(function()
            repeat wait() if not Enabled then break end until getScaffoldBlock() ~= 'black'
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
            until not Enabled
        end)
    else
        off("Scaffold", 3)
        array.Remove("Scaffold : ".. ExpendSlider["Value"])
        Enabled = false
    end
end)

Tab2Section:NewKeybind("Keybind", "Keybind Of Scaffold", Enum.KeyCode.V, function()
    if Enabled == false then
        Enabled = true
        ScaffoldEnabled:UpdateToggle(ScaffoldEnabled.text, true)
    else
        Enabled = false

        ScaffoldEnabled:UpdateToggle(ScaffoldEnabled.text, false)
    end
end)

Tab2Section:NewSlider("Expand", "Expand Of Scaffold", 5, 1, function(val)
    ExpendSlider["Value"] = val
end)



local Tab2Section = Tab2:NewSection("TakeNoFall")
local Enabled = false
local NoFall = Tab2Section:NewToggle("NoFall", "NoFall", function(callback)
    if callback then
        Enabled = true
        Settings.NoFall = true
        array.Add("NoFall")
        on("NoFall", 3)
        RunLoops:BindToHeartbeat("NoFall", 1, function()
            Client:Get("GroundHit"):SendToServer()
        end)
    else
        Settings.NoFall = true
        RunLoops:UnbindFromHeartbeat("NoFall")
        off("NoFall", 3)
        array.Remove("NoFall")
        Enabled = false
    end
end)

local Tab3Section = Tab3:NewSection("Bob")
local Enabled = false
local lplr = game.Players.LocalPlayer
local Depth = {["Value"] = 2}
local Horizontal = {["Value"] = 2}
local Bob = Tab3Section:NewToggle("Bob", "NoBob is worse so i made bob!", function(callback)
    if callback then
        Settings.Bob = true
        Enabled = true
                lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_DEPTH_OFFSET", -(Depth["Value"] / 10))
                lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_HORIZONTAL_OFFSET", (Horizontal["Value"] / 10))
            else
         Settings.Bob = false
        Enabled = false
        lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_DEPTH_OFFSET", 0)
        lplr.PlayerScripts.TS.controllers.global.viewmodel["viewmodel-controller"]:SetAttribute("ConstantManager_HORIZONTAL_OFFSET", 0)
    end
end)

Tab3Section:NewSlider("Depth", "Bob Depth", 50, 1, function(val)
    Depth["Value"] = val
end)

Tab3Section:NewSlider("Horizontal", "Bob Horizontal", 50, 1, function(val)
    Horizontal["Value"] = val
end)

local Tab3Section = Tab3:NewSection("Fov")
local Enabled = false
local FieldOfView = {["Value"] = 120}
local FovChanger = Tab3Section:NewToggle("FovChanger", "Change you fov", function(callback)
    if callback then
        Settings.FovChanger = true
        Enabled = true
        on("FovChanger", 3)
        array.Add("Fov : ".. FieldOfView["Value"])
        RunLoops:BindToHeartbeat("FovChanger", 1, function()
        workspace.CurrentCamera.FieldOfView = FieldOfView.Value
        end)
    else
        Settings.FovChanger = false
        Enabled = false
        RunLoops:UnbindFromHeartbeat("FovChanger")
        off("FovChanger", 3)
        array.Remove("Fov : ".. FieldOfView["Value"])
        workspace.CurrentCamera.FieldOfView = 100
    end
end)
Tab3Section:NewSlider("FieldOfView", "View", 120, 1, function(Value)
    FieldOfView["Value"] = Value
end)

function NukerFunction(part)
    local raycastResult = game:GetService("Workspace"):Raycast(part.Position + Vector3.new(0,24,0),Vector3.new(0,-27,0),params)
    if raycastResult then
        local targetblock = raycastResult.Instance
        for i,v in pairs(targetblock:GetChildren()) do
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
        local args = {
            [1] = {
                ["blockRef"] = {
                    ["blockPosition"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3))
                },
                ["hitPosition"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3)),
                ["hitNormal"] = Vector3.new(math.round(targetblock.Position.X/3),math.round(targetblock.Position.Y/3),math.round(targetblock.Position.Z/3))
            }
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@easy-games"):WaitForChild("block-engine"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("DamageBlock"):InvokeServer(unpack(args))        
        
        
        if BreakingMsg == false then
            BreakingMsg = true
            info("Breaking Bed..", 3)
            spawn(function()
                wait(3)
                BreakingMsg = false
            end)
        end
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

local Tab5Section = Tab5:NewSection("Nuker")
local DistanceBreak = {Value = 50}
local BreakerEnabled = false
local Breaker = Tab5Section:NewToggle("Breaker", "it nuker but breaker name is better so", function(callback)
    if callback then
        Settings.Breaker = true
    BreakerEnabled = true
    on("Breaker", 3)
    array.Add("Breaker : ".. DistanceBreak["Value"])
    RunLoops:BindToRenderStep("bedBreaker", 1, function()
        if not BreakerEnabled then return end
        spawn(function()
            if lplr:GetAttribute("DenyBlockBreak") == true then
                lplr:SetAttribute("DenyBlockBreak",nil)
            end
        end)
        if isAlive(lplr) then
            local beds = GetBeds()
            for i,v in pairs(beds) do
                local mag = (v.Position - lplr.Character.PrimaryPart.Position).Magnitude
                if mag < DistanceBreak.Value then
                    NukerFunction(v)
                end
            end
        end
    end)    
    else
        Settings.Breaker = false
        off("Breaker", 3)
        array.Remove("Breaker : ".. DistanceBreak["Value"])
        BreakerEnabled = false
    end
end)

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
Tab5Section:NewKeybind("UI", "Keybind Of UI", Enum.KeyCode.KeypadZero, function()
    Library:ToggleUI()
end)
local Tab4Section = Tab4:NewSection("Bank")
local Enabled = false
local Bank = Tab4Section:NewToggle("AutoBank", "AutoBank", function(callback)
    if callback then
        Enabled = true
        Settings.Bank = true
        array.Add("AutoBank")
        on("AutoBank", 3)
        spawn(function()
            repeat wait(0.2)
                if isAlive(lplr) then
                    if isnearshop() then
                        getitems()
                    else
                        takeitems()
                    end
                end
            until not Enabled
        end)
    else
        Settings.Bank = false
        off("AutoBank", 3)
        array.Remove("AutoBank")
        Enabled = false
        getitems()
    end
end)
local Tab4Section = Tab4:NewSection("Stealer")
local MaxStuds = {["Value"] = 40}
    local function ChestStealerFunc()
        for i,v in pairs(game:GetService("CollectionService"):GetTagged("chest")) do
            local mag = (lplr.Character:FindFirstChild("HumanoidRootPart").Position - v.Position).Magnitude
            if mag < MaxStuds["Value"] then
                local chest = v:FindFirstChild("ChestFolderValue")
                chest = chest and chest.Value or nil
                local chestitems = chest and chest:GetChildren() or {}
                if #chestitems > 0 then
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(chest)
                    for i3,v3 in pairs(chestitems) do
                        if v3:IsA("Accessory") then
                            pcall(function()
                                Client:GetNamespace("Inventory"):Get("ChestGetItem"):CallServer(v.ChestFolderValue.Value,v3)
                            end)
                        end
                    end
                    Client:GetNamespace("Inventory"):Get("SetObservedChest"):SendToServer(nil)
                end
            end
        end
    end
local stealer = false
local Stealer = Tab4Section:NewToggle("ChestStealer", "Steal all the chest that near you", function(callback)
    if callback then
        stealer = callback
        Settings.Stealer = true
        array.Add("Stealer")
        on("Stealer", 3)
        spawn(function()
            while wait(0) do
                if stealer == false then return end
                if isAlive(lplr) then
                    ChestStealerFunc()
                end
            end
        end)
    else
        array.Remove("Stealer")
        off("Stealer", 3)
    end
end)

Tab4Section:NewSlider("Studs", "Chest Distance", 40, 1, function(val)
    MaxStuds["Value"] = val
end)

Tab5Section:NewSlider("Distance", "Breaker Distance", 50, 1, function(val)
    DistanceBreak["Value"] = val
end)

local Tab5Section = Tab5:NewSection("AntiVoid")
local antivoidpart
local antivoidmode = {Value = "Velocity"}
local antivoidconnection
local antivoiding = false
local antitransparent = {["Value"] = 50}
local Height = {["Value"] = 200}
local anticolor = {["Hue"] = 1, ["Sat"] = 1, ["Value"] = 0.55}
local AntiVoid = Tab5Section:NewToggle("AntiVoid", "AntiVoid", function(callback)
    if callback then
        array.Add("AntiVoid : Velocity")
        on("AntiVoid", 3)
        Settings.AntiVoid = true
        task.spawn(function()
            antivoidpart = Instance.new("Part")
            antivoidpart.CanCollide = false
            antivoidpart.Size = Vector3.new(10000, 1, 10000)
            antivoidpart.Anchored = true
            antivoidpart.Material = Enum.Material.Neon
            antivoidpart.Color = Color3.fromHSV(anticolor["Hue"], anticolor["Sat"], anticolor["Value"])
            antivoidpart.Transparency = 1 - (antitransparent["Value"] / 100)
            antivoidpart.Position = lplr.Character.HumanoidRootPart.Position - Vector3.new(0, 21, 0)
            antivoidpart.Parent = workspace
            antivoidconnection = antivoidpart.Touched:Connect(function(touched)
                if touched.Parent == lplr.Character and isAlive(lplr) then
                    if (not antivoiding) and lplr.Character.Humanoid.Health > 0 then
                        antivoiding = true
                        lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0, Height.Value, 0)
                        antivoiding = false
                    end
                end
            end)
        end)
    else
        if antivoidconnection then antivoidconnection:Disconnect() end
        if antivoidpart then
            Settings.AntiVoid = false
            off("AntiVoid", 3)
            array.Remove("AntiVoid : Velocity")
            antivoidpart:Remove() 
        end
    end
end)
Tab5Section:NewSlider("JumpHeight", "AntiVoid Transparency", 500, 1, function(val)
    Height["Value"] = val
end)
Tab5Section:NewSlider("Invisible", "AntiVoid Transparency", 100, 1, function(val)
    antitransparent["Value"] = val
    if antivoidpart then
        antivoidpart.Transparency = 1 - (antitransparent["Value"] / 100)
    end
end)

Tab5Section:NewColorPicker("Color", "AntiVOID Color", Color3.fromHSV(anticolor["Hue"], anticolor["Sat"], anticolor["Value"]), function(col)
    if antivoidpart then
        antivoidpart.Color = col
    end
end)


spawn(function()
	repeat
	  wait(1)
		writefile("MaxUiX/Profiles/BedwarsProfile.json",game:GetService("HttpService"):JSONEncode(Settings))
	until false
end)
local suc, res = pcall(function()
	return game:GetService("HttpService"):JSONDecode(readfile("MaxUiX/Profiles/BedwarsProfile.json"))
end)
 if suc and type(res) == "table" then 
  Settings = res
  if Sprint then
    Sprint:UpdateToggle(Sprint.text, Settings.Sprint)
  end
  if Velocity then
    Velocity:UpdateToggle(Velocity.text, Settings.Velocity)
  end
  if Reach then
    Reach:UpdateToggle(Reach.text, Settings.Reach)
  end
  if NoClickDelay then
    NoClickDelay:UpdateToggle(NoClickDelay.text, Settings.NoClickDelay)
  end
  if Killaura then
    Killaura:UpdateToggle(Killaura.text, Settings.Killaura)
  end
  if SwordSwing then
    SwordSwing:UpdateToggle(SwordSwing.text, Settings.SwordSwing)
  end
  if NoSlow then
    NoSlow:UpdateToggle(NoSlow.text, Settings.NoSlow)
  end
  if NoFall then
    NoFall:UpdateToggle(NoFall.text, Settings.NoFall)
  end
  if Bob then
    Bob:UpdateToggle(Bob.text, Settings.Bob)
  end
  if FovChanger then
    FovChanger:UpdateToggle(FovChanger.text, Settings.FovChanger)
  end
  if Breaker then
    Breaker:UpdateToggle(Breaker.text, Settings.Breaker)
  end
  if Bank then
    Bank:UpdateToggle(Bank.text, Settings.Bank)
  end
  if AntiVoid then
    AntiVoid:UpdateToggle(AntiVoid.text, Settings.AntiVoid)
  end
  if Stealer then
    Stealer:UpdateToggle(Stealer.text, Settings.Stealer)
  end
  if Animations then
    Animations:UpdateToggle(Animations.text, Settings.Animations)
  end
end
Library:ToggleUiButton()
