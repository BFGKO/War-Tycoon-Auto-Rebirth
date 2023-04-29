local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = {}
Network.__index = Network

local dataEvent: RemoteFunction = ReplicatedStorage:WaitForChild("Packages")
	:WaitForChild("Knit")
	:WaitForChild("Services")
	:WaitForChild("DataService")
	:WaitForChild("RF")
	:WaitForChild("Get")

-- Inventory
local Inventory = {}

setmetatable(Inventory, Network)
function Inventory:SortSoliders(soliders: { { Id: string, XP: number } })
	for i = 1, #soliders do
		for j = 1, #soliders - i do
			local current = soliders[j]
			local next = soliders[j + 1]
			if current.XP < next.XP then
				soliders[j] = next
				soliders[j + 1] = current
			end
		end
	end

	return soliders
end

function Inventory:GetBestSolider(foundSoliders: { { { Id: string, XP: number, Type : string } } })
	local selectSoliders = {}
	for _, soliders in pairs(foundSoliders) do
		local sorted = self:SortSoliders(soliders)
		table.insert(selectSoliders, sorted[1])
	end

	-- print(selectSoliders[3].Type)
	return selectSoliders
end

function Inventory:GetSoliders(soliders: { { name: string } })
	local inventory = self.data["Inventory"]
	local foundSoliders = {}

	-- get all soliders
	for i, solider: { Type: string, XP: number } in pairs(inventory) do
		local soliderType = solider.Type
		if not table.find(soliders, soliderType) then
			continue
		end

		print(soliderType)

		local soliderInfo = {
			XP = solider.XP,
			Id = i,
			Type = solider.Type
		}

		if foundSoliders[soliderType] then
			table.insert(foundSoliders[soliderType], soliderInfo)
		else
			foundSoliders[soliderType] = {
				soliderInfo,
			}
		end
	end
	local bestSoliders = self:GetBestSolider(foundSoliders)
	-- for i,v in pairs(bestSoliders) do
	-- 	print(i, v)
	-- end
	return bestSoliders
end

function Network:StartCapture()
	self.capture = true
	coroutine.wrap(function()
		while self.capture do
			self.data = dataEvent:InvokeServer()
			task.wait(2)
		end
	end)()
end

function Network:Destroy()
	self.capture = false
end

print("-----------")
Network:StartCapture()
task.wait(0.5)
Inventory:GetSoliders({
	"Raid Solider",
	"Medic"
})
Network:Destroy()
print("-----------")


return Inventory
