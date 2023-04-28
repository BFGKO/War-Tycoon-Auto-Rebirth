local function GetModule(moduleName : string)
    local url = "https://raw.githubusercontent.com/BFGKO/War-Tycoon-Auto-Rebirth/master/Modules/%s.lua"
    url = url:format(moduleName)
    local succes, response : table = pcall(function()
        local content = game:HttpGet(url)
        return loadstring(content)()
    end)

    if not succes then
        print(response, "when loading", moduleName)
    else
        getgenv()[moduleName] = response
        return response
    end
end

local robber = GetModule("Robber")
print("Executed")
while true do
    
    local tycoon = robber:FindRobbableTycoon()
    if not tycoon then
        break
    end
    
    robber:RobTycoon(tycoon)
end

print("Robbed all")