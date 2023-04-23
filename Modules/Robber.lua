local Debris = game:GetService("Debris")
local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer


local Robber = {}

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
    for i,tycoon : Model in pairs(tycoons:GetChildren()) do
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
            print(ownerName, "robbable in", cooldownGui.Text)
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
    for i, safe : Model in pairs(unlocks:GetDescendants()) do
        if not (safe.Name:match("Safe") or safe.Name == "DiamondMiner") then
            continue
        end
        local hasSafe = safe:FindFirstChild("Safe")
        if hasSafe then
            safe = hasSafe
        end
        local enabled = safe:FindFirstChild("Enabled")
        if enabled and enabled.Color == Color3.fromRGB(25, 175, 30) then
            table.insert(safes, safe)
        end
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

    local safes = self:GetSafes(tycoon)

    for i,v : Model in pairs(safes) do
        print(v:GetFullName())
    end



    rootPart.CFrame = raid.CFrame
    rootPart.Anchored = true

    firetouchinterest(raid, rootPart, 0)
    task.wait(0.1)
    firetouchinterest(raid, rootPart, 1)

    print("Activated raid")
    rootPart.Anchored = false

    task.wait(1)
    

    for i,safe in pairs(safes) do
        local enabled : Part = safe.Enabled

        local attachment : Attachment = enabled:FindFirstChild("HackAttachment")
        if not attachment then
            continue
        end
        local proximityPrompt = attachment:WaitForChild("ProximityPrompt")

        rootPart.CFrame = enabled.CFrame - Vector3.yAxis * 20
        rootPart.Anchored = true
        task.wait(0.25)
        fireproximityprompt(proximityPrompt, 1, true)

        task.wait(1.25)
    end

    rootPart.Anchored = false
    rootPart.CFrame = self.startCFrame

    for i,ownerDoor in pairs(ownerDoors) do
        ownerDoor.Parent = tycoon.Unlocks
    end
end

-- Robber:RobTycoon( Robber:FindRobbableTycoon() )

return Robber