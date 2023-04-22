local Debris = game:GetService("Debris")
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

    local standPart = Instance.new("Part")
    standPart.Size = Vector3.new(50, 1, 50)
    standPart.Anchored = true
    standPart.Parent = workspace
    standPart.Material = Enum.Material.SmoothPlastic
    standPart.Transparency = 0.5

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
            Debris:AddItem(standPart, 3)
            return tycoon
        end
    end
    rootPart.Anchored = false

    rootPart.CFrame = startCFrame
    standPart:Destroy()
end

function Robber:RobTycoon(tycoon : Model)
    local character = player.Character
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local raid = tycoon:WaitForChild("Raid")
    
    firetouchinterest(raid, rootPart, 0)
    task.wait()
    firetouchinterest(raid, rootPart, 1)
    
    task.wait(1)
    
    local unlocks = tycoon:WaitForChild("Unlocks")
    local safes = {}
    for i = 1,5 do
        local name = "Safes"..i
        local safesParent = unlocks:FindFirstChild(name)
        if safesParent then
            for i,safe in pairs(safesParent:GetChildren()) do
                table.insert(safes, safe)
            end
        end
    end

    for i,safe in pairs(safes) do
        local enabled : Part = safe.Enabled
        local isEnabled = enabled.Color == Color3.fromRGB(25, 175, 30)
        if not isEnabled then
            continue
        end
        pcall(function()
            local attachment : Attachment = enabled:FindFirstChild("HackAttachment")
            local proximityPrompt = attachment:FindFirstChildOfClass("ProximityPrompt")
    
            rootPart.CFrame = enabled.CFrame - Vector3.yAxis * 20
            rootPart.Anchored = true
            fireproximityprompt(proximityPrompt, 1, true)
        end)

        task.wait(.5)
    end
    rootPart.Anchored = false
    rootPart.CFrame = self.startCFrame
end

Robber:RobTycoon( Robber:FindRobbableTycoon() )

return Robber