local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
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
local autoFarm = GetModule("Robber")


tycoon:GetTycoon()

local stopped
eventManager:AddEvent("PlayerChattedWhileLoopStop", player.Chatted, function(message)
    print(message)
    if message == "/e stop" then
        stopped = true
    end
end)
while not stopped do
    task.wait(0.25)
    pcall(function()
        local cheapestItem : Model = tycoon:GetCheapestItem()
        if not cheapestItem then
            ReplicatedStorage.LocalRebirth:FireServer()
        end

        print(cheapestItem:GetAttribute("DisplayName"))
    
        local cost : number = cheapestItem:GetAttribute("Price")
        local money : string = moneyUi.Text
        money = money:gsub(",", "")
        if cost > tonumber(money) then
            local robbableTycoon = autoFarm:FindRobbableTycoon()
            if robbableTycoon then
                autoFarm:RobTycoon(robbableTycoon)
            end
            tycoon:CollectCash()
            task.wait(1.5)
            return
        else
            print("buying", cheapestItem:GetAttribute("DisplayName"), "for", cost)
            tycoon:BuyItem(cheapestItem)
        end
        
    end)
end

eventManager:StopAll()