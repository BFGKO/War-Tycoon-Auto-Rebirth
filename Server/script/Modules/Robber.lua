local Debris = game:GetService("Debris")
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer


local Robber = {
    tycoons = {}
}
function Robber:LoadTycoon(tycoon : Model)
 local standPart = Instance.new("Part")
    standPart.Size = Vector3.new(50, 1, 50)
    standPart.Anchored = true
    standPart.Parent = workspace
    standPart.Material = Enum.Material.SmoothPlastic
    standPart.Transparency = 0.5


 local character = player.Character
 local rootPart = character:WaitForChild("HumanoidRootPart")

 local pivot = tycoon.WorldPivot

    rootPart.Anchored = true

    rootPart.CFrame = pivot + Vector3.new(0, 250, 0)

 local startTime = tick()
 repeat
        task.wait(0.1)
 until tycoon:FindFirstChild("Raid") or tick() >= startTime+5

    standPart:Destroy()
end

function Robber:FindRobbableTycoon()
 local character = player.Character
 local rootPart = character:WaitForChild("HumanoidRootPart")

 local startCFrame = rootPart.CFrame
 self.startCFrame = startCFrame

 local tycoons : Model = workspace.PlayerTycoons
 for i,v : table in pairs(self.tycoons) do
 if v.robTime <= tick() then -- robbable
 return i
 end
 end

 for i,tycoon : Model in pairs(tycoons:GetChildren()) do
 if self.tycoons[tycoon] then
            continue
 end

 local ownerId = tycoon:GetAttribute("Player")
 local ownerName = tycoon:GetAttribute("PlayerName")
  if ownerId == player.UserId then
            continue
 end

 self:LoadTycoon(tycoon)

 local hasBunker = tycoon:FindFirstChild("Raid")
 if not hasBunker then
 print(ownerName, "doesnt have bunker")
            continue
 end
   local unlocks = tycoon:WaitForChild("Unlocks")

 local vaultRoom1 = unlocks:FindFirstChild("VaultRoom1")
 if not vaultRoom1 or not vaultRoom1:FindFirstChild("Cooldown") then
            continue
 end
 local cooldownGui = vaultRoom1.Cooldown.SurfaceGui.Frame.Time
 local canRob = cooldownGui.Text == "READY"
   if not canRob then
 local robOffset = tonumber(cooldownGui.Text)
 if not robOffset then
                continue
 end
 print(ownerName, "robbable in", robOffset)

 self.tycoons[tycoon] = {
                robTime = tick() + robOffset
            }

            continue
 else
 print(ownerName, cooldownGui.Text)
 return tycoon
 end
 end
    rootPart.Anchored = false

    rootPart.CFrame = startCFrame
end

function Robber:GetSafes(tycoon : Model)
 local unlocks = tycoon:WaitForChild("Unlocks")
 local safes = {}
 for i, safe : Attachment in pairs(unlocks:GetDescendants()) do
 if safe.Name ~= "HackAttachment" then
            continue
 else
 print(safe:GetFullName())
 end

 -- local enabled = safe:FindFirstChild("Enabled")
 table.insert(safes, safe)
 end
 print(("found %d safes"):format(#safes))
 return safes
end

function Robber:RobTycoon(tycoon : Model)
 local character = player.Character
 local rootPart = character:WaitForChild("HumanoidRootPart")

 local raid = tycoon:WaitForChild("Raid")

 local ownerDoors = {}
 for i,ownerDoor : Model in pairs(tycoon.Unlocks:GetChildren()) do
 local target = ownerDoor:FindFirstChild("Target")
 if not target then continue end
        ownerDoors[#ownerDoors+1] = ownerDoor
        ownerDoor.Parent = nil
 end


    rootPart.CFrame = raid.CFrame
    rootPart.Anchored = true

 firetouchinterest(raid, rootPart, 0)
    task.wait(0.1)
 firetouchinterest(raid, rootPart, 1)

 print("Activated raid")
    rootPart.Anchored = false

    task.wait(1)
  local safes = self:GetSafes(tycoon)

 for i,safe : Attachment in pairs(safes) do
 local enabled = safe.Parent
        task.wait(1.5)
        rootPart.Anchored = false
        task.wait(0.1)
        rootPart.CFrame = enabled.CFrame
        rootPart.Anchored = true
 local proximityPrompt = safe:FindFirstChildOfClass("ProximityPrompt")
 if not proximityPrompt then
            continue
 end
 -- for i,v in pairs(safe.Parent:GetDescendants()) do
 --     print(i, v:GetFullName())
 -- end

        task.wait(0.25)
 fireproximityprompt(proximityPrompt, 0, true)

 end

    rootPart.Anchored = false
    rootPart.CFrame = self.startCFrame

 for i,ownerDoor in pairs(ownerDoors) do
        ownerDoor.Parent = tycoon.Unlocks
 end

 self.tycoons[tycoon] = {
        robTime = tick()+1200
    }

    Robber:CollectCash()
end

function Robber:CollectCash()
 local selfTycoon 
 for i,tycoon : Model in pairs(workspace.PlayerTycoons:GetChildren()) do
 if tycoon:GetAttribute("Player") ~= player.UserId then
            continue
 end
        selfTycoon = tycoon
 end
 self:LoadTycoon(selfTycoon)

 local collector = selfTycoon:WaitForChild("Essentials"):WaitForChild("Giver"):WaitForChild("CollectButton")
 local rootPart = player.Character.HumanoidRootPart
     rootPart.Anchored = false
    rootPart.CFrame = CFrame.new(collector.Position + Vector3.yAxis*5)
 firetouchinterest(collector, rootPart, 0)
    task.wait(0.5)
 firetouchinterest(collector, rootPart, 1)


end

-- print("Executed")
 local tycoon = Robber:FindRobbableTycoon()

Robber:RobTycoon(tycoon)


-- print("Robbed all")

-- Robber:CollectCash()

return Robber
