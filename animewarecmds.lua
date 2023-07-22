local clientID = game:GetService("RbxAnalyticsService"):GetClientId()
local funcs = {}
local function warningNotification(client, message, priority)
    print(client, "|", message, ", priority =", priority)
end

local whitelist = {
    private = {
        { clientID = "", priority = 1 }, -- person
        { clientID = "", priority = 1 }, -- person
        { clientID = "", priority = 1 } -- person
    },
}

local function getClientWhitelistInfo(clientID, whitelistType)
    local list = whitelist[whitelistType]
    if not list then
        return nil
    end

    for _, entry in ipairs(list) do
        if entry.clientID == clientID then
            return entry.priority
        end
    end
    return nil
end

local function hasPriority(clientID, priority)
    for _, list in pairs(whitelist) do
        for _, entry in ipairs(list) do
            if entry.clientID == clientID and entry.priority >= priority then
                return true
            end
        end
    end
    return false
end



local whitelistType
local priority
for listType, _ in pairs(whitelist) do
    priority = getClientWhitelistInfo(clientID, listType)
    if priority then
        whitelistType = listType
        break
    end
end

local chatTag
local chatTagColor
if whitelistType == "private" then
    local user = game.Players.LocalPlayer
    warningNotification("AnimeWare Private", "Welcome " .. (user.Name or user.DisplayName), priority) -- i'll replace priority with timer when we add it to vape
    chatTag = "[ANIMEWARE PRIVATE]"
    chatTagColor = Color3.fromRGB(128, 0, 128)
elseif whitelistType == "owner" then
    local user = game.Players.LocalPlayer
    warningNotification("AnimeWare Owner", "Welcome " .. (user.Name or user.DisplayName), priority)
    chatTag = "[ANIMEWARE OWNER]"
    chatTagColor = Color3.fromRGB(255, 0, 0)
else
    local user = game.Players.LocalPlayer
    warningNotification("AnimeWare Public", "Hey there " .. (user.Name or user.DisplayName), priority)
    chatTag = "[ANIMEWARE USER]"
    chatTagColor = Color3.fromRGB(0, 128, 0)
end

local textChatService = game:GetService("TextChatService")
textChatService.OnIncomingMessage = function(message)
    local properties = Instance.new("TextChatMessageProperties")
    if message.TextSource then
        local player = game:GetService("Players"):GetPlayerByUserId(message.TextSource.UserId)
        if player then
            local playerWhitelistType = whitelist[player.UserId] or "public"
            if playerWhitelistType ~= whitelistType then
                local playerName = player.Name or player.DisplayName
                warningNotification(whitelistType .. " User", "Detected " .. playerWhitelistType .. " Player " .. playerName, priority)
                if whitelistType == "owner" or whitelistType == "private" then
                    local commandFunc = commands["kick"]
                    if commandFunc then
                        commandFunc({ playerName }, priority)
                    end
                end
            end
            properties.PrefixText = "<font color='" .. tostring(chatTagColor) .. "'>" .. chatTag .. "</font> " .. message.PrefixText
        end
    end
    local colorHex = string.format("#%02X%02X%02X", math.floor(chatTagColor.R * 255), math.floor(chatTagColor.G * 255), math.floor(chatTagColor.B * 255))
    properties.PrefixText = "<font color='" .. colorHex .. "'>" .. chatTag .. "</font> " .. message.PrefixText
    return properties
end



--sorry xylex, im too lazy to remake the cmds (dont kill me plez)
local commands = {
    function funcs:rickroll(args, priority)
        if hasPriority(clientID, priority) then
            if whitelistType == "owner" or whitelistType == "private" then
                local targetPlayer = args[1]
                if targetPlayer == "user" then
                    if whitelistType == "owner" then
                        warningNotification("AnimeWare Owner", "Successfully executed command against a User", priority)
                        --  User
                    else
                        warningNotification("AnimeWare Private", "Successfully executed command against a User", priority)
                        --  User
                    end
                elseif targetPlayer == "private" and whitelistType == "owner" then
                    warningNotification("AnimeWare Owner", "Successfully executed command against a Private User", priority)
                    --  Private User
                else
                    warningNotification("AnimeWare", "Invalid target for command", 5)
                end
            else
                warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
            end
        else
            warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
        end
    end
    function funcs:Gravity(args, priority)
        if hasPriority(clientID, priority) then
            if whitelistType == "owner" or whitelistType == "private" then
                local targetPlayer = args[1]
                if targetPlayer == "user" then
                    if whitelistType == "owner" then
                        warningNotification("AnimeWare Owner", "Successfully executed command against a User", priority)
                        --  User
                    else
                        warningNotification("AnimeWare Private", "Successfully executed command against a User", priority)
                        --  User
                    end
                elseif targetPlayer == "private" and whitelistType == "owner" then
                    warningNotification("AnimeWare Owner", "Successfully executed command against a Private User", priority)
                    --  Private User
                else
                    warningNotification("AnimeWare", "Invalid target for command", 5)
                end
            else
                warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
            end
        else
            warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
        end
    end
    function funcs:kick(args, priority)
        if hasPriority(clientID, priority) then
            if whitelistType == "owner" or whitelistType == "private" then
                local targetPlayer = args[1]
                if targetPlayer == "user" then
                    if whitelistType == "owner" then
                        warningNotification("AnimeWare Owner", "Successfully executed command against a User", priority)
                        -- User
                    else
                        warningNotification("AnimeWare Private", "Successfully executed command against a User", priority)
                        -- User
                    end
                elseif targetPlayer == "private" and whitelistType == "owner" then
                    warningNotification("AnimeWare Owner", "Successfully executed command against a Private User", priority)
                    -- Private User
                else
                    warningNotification("AnimeWare", "Invalid target for command", 5)
                end
            else
                warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
            end
        else
            warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
        end
    end,
    ["ban"] = function(args, priority)
        if hasPriority(clientID, priority) then
            if whitelistType == "owner" or whitelistType == "private" then
                local targetPlayer = args[1]
                if targetPlayer == "user" then
                    if whitelistType == "owner" then
                        warningNotification("AnimeWare Owner", "Successfully executed command against a User", priority)
                        -- User
                    else
                        warningNotification("AnimeWare Private", "Successfully executed command against a User", priority)
                        -- User
                    end
                elseif targetPlayer == "private" and whitelistType == "owner" then
                    warningNotification("AnimeWare Owner", "Successfully executed command against a Private User", priority)
                    --  Private User
                else
                    warningNotification("AnimeWare", "Invalid target for command", 5)
                end
            else
                warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
            end
        else
            warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
        end
    end,
    ["errorkick"] = function(args, priority)
        if hasPriority(clientID, priority) then
            if whitelistType == "owner" or whitelistType == "private" then
                local targetPlayer = args[1]
                if targetPlayer == "user" then
                    if whitelistType == "owner" then
                        warningNotification("AnimeWare Owner", "Successfully executed command against a User", priority)
                        --  User
                    else
                        warningNotification("AnimeWare Private", "Successfully executed command against a User", priority)
                        -- User
                    end
                elseif targetPlayer == "private" and whitelistType == "owner" then
                    warningNotification("AnimeWare Owner", "Successfully executed command against a Private User", priority)
                    --  Private User
                else
                    warningNotification("AnimeWare", "Invalid target for command", 5)
                end
            else
                warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
            end
        else
            warningNotification("AnimeWare", "Priority is too low, failed to execute command", 5)
        end
    end
}



local function executeCommand(command, args)
    local commandFunc = commands[command]
    if commandFunc then
        local priority = getClientWhitelistInfo(clientID, whitelistType)
        commandFunc(args, priority)
    else
        warningNotification("AnimeWare", "Command not found (you stupid)", 5)
    end
end

local prefix = "."
local function onPlayerChatted(player, message)
    if message:sub(1, #prefix) == prefix then
        local args = {}
        for arg in message:sub(#prefix + 1):gmatch("%S+") do
            table.insert(args, arg)
        end
        local command = table.remove(args, 1)
        local playerWhitelistType = whitelist[player.UserId] or "public"
        if playerWhitelistType == "public" then
            local commandFunc = commands[command]
            if commandFunc then
                commandFunc(args, priority)
            else
                warningNotification("AnimeWare", "Command not found", 5)
            end
        else
            local commandFunc = commands[command]
            if commandFunc then
                local priority = getClientWhitelistInfo(clientID, whitelistType)
                commandFunc(args, priority)
            else
                warningNotification("AnimeWare", "Command not found", 5)
            end
        end
    end
end
