local Players = game:GetService("Players")
local function GetModule(moduleName : string)
    local url = "https://raw.githubusercontent.com/BFGKO/War-Tycoon-Auto-Rebirth/master/Modules/%s.lua"
    url = url:format(moduleName)
    print(url)
    local succes, response = pcall(function()
        local content = game:HttpGet(url)
        return loadstring(content)()
    end)

    if not succes then
        print(response, "when loading", moduleName)
    else
        return response
    end
end

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local playingScene = playerGui:WaitForChild("PlayingScene")
local moneyUi = playingScene:WaitForChild("Money"):WaitForChild("Cash"):WaitForChild("Meter")

local tycoon = GetModule("Tycoon")
local eventManager = GetModule("EventManager")

tycoon:GetTycoon()
local stopped
eventManager:AddEvent("PlayerChattedWhileLoopStop", player.Chatted, function(message)
    print(message)
    if message == "/e stop" then
        stopped = true
    end
end)
while not stopped do
    task.wait(1)
    local cheapestItem = tycoon:GetCheapestItem()
    local cost = cheapestItem:GetAttribute("Price")
    local money : string = moneyUi.Text
    money = money:gsub(",", "")
    print(cost, money)
    if cost > tonumber(money) then
        tycoon:CollectCash()
        continue
    else
        tycoon:BuyItem(cheapestItem)
    end
end

eventManager:StopAll()