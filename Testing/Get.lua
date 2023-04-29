local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote: RemoteFunction = ReplicatedStorage:WaitForChild("Packages")
	:WaitForChild("Knit")
	:WaitForChild("Services")
	:WaitForChild("DataService")
	:WaitForChild("RF")
	:WaitForChild("Get")
local data = remote:InvokeServer()

json = HttpService:JSONEncode(data)

setclipboard(json)
