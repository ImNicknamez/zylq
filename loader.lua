local function zylqgithubrequest(scripturl)
    if not isfile("zylq/"..scripturl) then
        local suc, res = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/ImNicknamez/zylq/main/"..scripturl, true)
        end)
        if suc and res and res ~= "404: Not Found" then
            if scripturl:find(".lua") then
                res = "--This is used for something.\n"..res
            end
            writefile("zylq/"..scripturl, res)
        end
    end
    return readfile("zylq/"..scripturl)
end

local function zylqdownloadassets(path)
    if not isfile(path) then
        task.spawn(function()
            local textlabel = Instance.new("TextLabel")
            textlabel.Size = UDim2.new(1, 0, 0, 36)
            textlabel.Text = "Downloading zylq/"..path
            textlabel.BackgroundTransparency = 1
            textlabel.TextStrokeTransparency = 0
            textlabel.TextSize = 30
            textlabel.Font = Enum.Font.SourceSans
            textlabel.TextColor3 = Color3.new(1, 1, 1)
            textlabel.Position = UDim2.new(0, 0, 0, -36)
            textlabel.Parent = game.CoreGui.RobloxGui
            repeat task.wait() until isfile("zylq/"..path)
            textlabel:Destroy()
        end)
        local suc, req = pcall(function() 
            return zylqgithubrequest(path:gsub("zylq/assets", "assets")) 
        end)
        if suc and req then
            writefile("zylq/"..path, req)
        else
            return ""
        end
    end
end

function zylqdownloadfolder(path)
    if not isfolder("zylq"..path) then
        task.spawn(function()
            local textlabel = Instance.new("TextLabel")
            textlabel.Size = UDim2.new(1, 0, 0, 36)
            textlabel.Text = "Downloading "..path
            textlabel.BackgroundTransparency = 1
            textlabel.TextStrokeTransparency = 0
            textlabel.TextSize = 30
            textlabel.Font = Enum.Font.SourceSans
            textlabel.TextColor3 = Color3.new(1, 1, 1)
            textlabel.Position = UDim2.new(0, 0, 0, -36)
            textlabel.Parent = game.CoreGui.RobloxGui
            repeat wait() until isfolder("zylq"..path)
            textlabel:Destroy()
        end)
        local suc, req = pcall(function() 
            return zylqgithubrequest(path:gsub("zylq/assets", "assets")) 
        end)
        if suc and req then
            makefolder("zylq"..path, req)
        else
            return ""
        end
    end
end
function zylqcreatefolder(path)
    if not isfolder(path) then
        task.spawn(function()
            local textlabel = Instance.new("TextLabel")
            textlabel.Size = UDim2.new(1, 0, 0, 36)
            textlabel.Text = "Downloading "..path
            textlabel.BackgroundTransparency = 1
            textlabel.TextStrokeTransparency = 0
            textlabel.TextSize = 30
            textlabel.Font = Enum.Font.SourceSans
            textlabel.TextColor3 = Color3.new(1, 1, 1)
            textlabel.Position = UDim2.new(0, 0, 0, -36)
            textlabel.Parent = game.CoreGui.RobloxGui
            repeat wait(.1) until isfolder(path)
            textlabel:Destroy()
        end)
        spawn(function()
            makefolder(path)
        end)
    end
end

function zylqexecute(path)
    if not isfile(path) then 
        loadstring(readfile("zylq/"..path))()
    end
end

zylqcreatefolder("zylq")
zylqcreatefolder("zylq/assets")
zylqcreatefolder("zylq/Profile")
zylqcreatefolder("zylq/CustomModules")
zylqdownloadassets("assets/Logo.png")
zylqdownloadassets("MainScript.lua")
zylqdownloadassets("commithash.txt")
zylqdownloadassets("loadstring.lua")
zylqdownloadassets("NewMainScript.lua")
zylqdownloadassets("verison.lua")
zylqdownloadassets("CustomModules/6872265039.lua")
zylqdownloadassets("CustomModules/6872274481.lua")
zylqdownloadassets("CustomModules/8444591321.lua")
zylqdownloadassets("CustomModules/8560631822.lua")
zylqdownloadassets("UpdateLogs.lua")
zylqexecute("NewMainScript.lua")
