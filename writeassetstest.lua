local function zylqgithubrequest(scripturl)
    local suc, res = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/ImNicknamez/zylq/main/"..scripturl, true)
    end)
    if suc and res and res ~= "404: Not Found" then
        if scripturl:find(".lua") then
            res = "--This is used for something.\n"..res
        end
        writefile("zylq/"..scripturl, res)
    end
return readfile("zylq/"..scripturl)
end

local ZylqAssetsTable = {
    ["assets/Logo.png"] = "rbxassetid://14049259595"
}

local function zylqdownloadassets(path)
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
        repeat task.wait(0.5) until isfile("zylq/"..path)
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

function zylqdownloadfolder(path)
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
        repeat task.wait(0.5) until isfolder("zylq"..path)
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

function zylqcreatefolder(path)        
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
        repeat task.wait(0.5) until isfolder(path)
        textlabel:Destroy()
    end)
    spawn(function()
        makefolder(path)
    end)
end

function zylqexecute(path)
    loadstring(readfile("zylq/"..path))()
end

task.spawn(function()
    repeat task.wait() until isfile("zylq/loader.lua") == true
    zylqexecute("loader.lua")
end)

zylqcreatefolder("zylq")
task.wait(.25)
zylqcreatefolder("zylq/assets")
task.wait(.25)
zylqcreatefolder("zylq/Profile")
task.wait(.25)
zylqcreatefolder("zylq/CustomModules")
task.wait(.25)
zylqdownloadassets("CustomModules/6872265039.lua")
task.wait(.25)
zylqdownloadassets("CustomModules/6872274481.lua")
task.wait(.25)
zylqdownloadassets("CustomModules/8444591321.lua")
task.wait(.25)
zylqdownloadassets("CustomModules/8560631822.lua")
task.wait(.25)
zylqdownloadassets("MainScript.lua")
task.wait(.25)
zylqdownloadassets("commithash.txt")
task.wait(.25)
zylqdownloadassets("loadstring.lua")
task.wait(.25)
zylqdownloadassets("NewMainScript.lua")
task.wait(.25)
zylqdownloadassets("verison.lua")
task.wait(.25)
zylqdownloadassets("loader.lua")
task.wait(.25)
zylqdownloadassets("GuiLibrary.lua")
task.wait(.25)

