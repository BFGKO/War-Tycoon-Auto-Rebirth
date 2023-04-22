local players = game:GetService("Players")
local player = players.LocalPlayer
local rebirths = player.leaderstats.Rebirths

local Tycoon = {}



function Tycoon:GetTycoon()
    local tycoons = workspace.PlayerTycoons
    for i, tycoon:Model in pairs(tycoons:GetChildren()) do
        if tycoon:GetAttribute("Player") == player.UserId then
            self.tycoon = tycoon
            return tycoon
        end
    end
end


function Tycoon:GetCheapestItem() : Model
    local cheapest = {
        price = math.huge,
        item = nil
    }
    for i,item:Model in pairs(self.tycoon.Buttons:GetChildren()) do
        local price : number = item:GetAttribute("Price")

        local isGamepass = item:GetAttribute("Gamepass")
        if not price or isGamepass then
            continue
        end
        local haveEnoughRebirths = rebirths.Value >= item:GetAttribute("Rebirth")
        if not haveEnoughRebirths then
            continue
        end

        if price < cheapest.price then
            cheapest.price = price
            cheapest.item = item
        end

        if item.Name:match("Worker") then
            return item
        end
    end

    return cheapest.item
end

function Tycoon:BuyItem(item : Model)

    local buyEvent : RemoteFunction = self.tycoon.BuyButton
    buyEvent:InvokeServer(item.Name)
end

function Tycoon:CollectCash()
    local character = player.Character
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local essentials : Model = self.tycoon:WaitForChild("Essentials")
    local giver : Model = essentials:WaitForChild("Giver")
    local collectButton = giver:WaitForChild("CollectButton")

    local teleportPosition = collectButton.Position + Vector3.yAxis * 5

    firetouchinterest(collectButton, rootPart, 0)
    task.wait()
    firetouchinterest(collectButton, rootPart, 1)

    rootPart.CFrame = CFrame.new(teleportPosition)
    task.wait(0.25)
end




return Tycoon