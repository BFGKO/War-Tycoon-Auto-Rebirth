local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local hopper = {}

local fileName = "serverHopList.json"

function hopper:SaveServer(jobId: string)
 local servers = HttpService:JSONDecode( readfile(fileName) )
    servers[jobId] = {
        id = jobId,
        date = tick()
    }

 writefile(fileName, HttpService:JSONEncode(servers))
end

function hopper:GetServersInfo()
 return HttpService:JSONDecode(readfile(fileName))
end

function hopper:Hop(placeId)
 if not isfile(fileName) then
 writefile(fileName, "{}")
 end

 local url = "https://games.roblox.com/v1/games/%d/servers/0?sortOrder=2&excludeFullGames=true&limit=100"
    url = url:format(placeId)

 local json = HttpService:JSONDecode(game:HttpGet(url))
 local servers = json["data"]

 local info = self:GetServersInfo()

 for i,server in pairs(servers) do
 local sameServer = server.id == game.JobId
 if sameServer then
            continue
 end
 print(server.id)
 local serverInfo = info[server.id]
 if serverInfo then
 local sHopTime = serverInfo.date
 if sHopTime <= tick() + 1000 then
                continue
 end
 end

 self:SaveServer(server.id)
        Players.LocalPlayer:Kick("Server hopping")
        TeleportService:TeleportToPlaceInstance(placeId, server.id, Players.LocalPlayer)
 break
 end
end


return hopper
