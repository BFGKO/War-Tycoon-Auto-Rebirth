local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Teams = game:GetService("Teams")

local developmentMode = true
local repoUrl = "https://raw.githubusercontent.com/BFGKO/War-Tycoon-Auto-Rebirth/master/%s"

if developmentMode then
    repoUrl = "127.0.0.1:5000/script/%s"
end

local function GetModule(moduleName: string)
	if not developmentMode then
		
		url = repoUrl:format("Modules/"..moduleName..".lua")
		local succes, response: table = pcall(function()
			local content = game:HttpGet(url)
			return loadstring(content)()
		end)

		if not succes then
			print(response, "when loading", moduleName)
		else
			getgenv()[moduleName] = response
			return response
		end
	else
		local url = "http://127.0.0.1:5000/script/Modules/%s.lua"
		url = url:format(moduleName)
        print(url)
		local succes, response: table = pcall(function()
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
end

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local playingScene = playerGui:WaitForChild("PlayingScene")
local moneyUi = playingScene:WaitForChild("Money"):WaitForChild("Cash"):WaitForChild("Meter")

local tycoon = GetModule("Tycoon")
local eventManager = GetModule("EventManager")
local autoFarm = GetModule("Robber")
local serverHopper = GetModule("ServerHopper")
local antiAfk = GetModule("AntiAfk")

antiAfk:Init()

if not player:GetAttribute("Emoji") then
    print("no team selecting chile")
	local Team = "Chile"

	ReplicatedStorage:WaitForChild("Packages")
		:WaitForChild("Knit")
		:WaitForChild("Services")
		:WaitForChild("TycoonService")
		:WaitForChild("RF")
		:WaitForChild("Select")
		:InvokeServer(Team)
end

tycoon:GetTycoon()

local function Rejoin()
	print("Server hopping")
	queue_on_teleport("task.wait(15)"..game:HttpGet(repoUrl:format("Main.lua")))
	serverHopper:Hop(game.PlaceId)
end

local stopped
eventManager:AddEvent("PlayerChattedWhileLoopStop", player.Chatted, function(message)
	print(message)
	if message == "/e stop" then
		stopped = true
	end
end)

while not stopped and task.wait() do
	pcall(function()
		local cheapestItem: Model = tycoon:GetCheapestItem()
		if not cheapestItem then
			ReplicatedStorage.LocalRebirth:FireServer()
		end

		local cost: number = cheapestItem:GetAttribute("Price")
		local money: string = moneyUi.Text
		money = money:gsub(",", "")
		if cost > tonumber(money) then
			local robbableTycoon = autoFarm:FindRobbableTycoon()
			print("robableTycoon =", robbableTycoon)
			if robbableTycoon then
				autoFarm:RobTycoon(robbableTycoon)
			else
				Rejoin()
			end
			task.wait(1)
			print("Collecting cash")
			tycoon:CollectCash()
			task.wait(1.5)
			return
		else
			print("buying", cheapestItem:GetAttribute("DisplayName"), "for", cost)
			tycoon:BuyItem(cheapestItem)
			task.wait()
		end
	end)
end

eventManager:StopAll()
