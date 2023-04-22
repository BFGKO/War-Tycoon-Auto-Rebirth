local Players = game:GetService("Players")
local player = Players.LocalPlayer


local Robber = {}


function Robber:FindRobbableBank()

    local character = player.Character
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local startCFrame = rootPart.CFrame

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
        
        -- if ownerId == player.UserId then
        --     continue
        -- end

        
        local unlocks = tycoon:WaitForChild("Unlocks")
        local hasBunker = unlocks:FindFirstChild("Bunker")
        if not hasBunker then
            continue
        end
        
        
        local vaultRoom1 = unlocks.VaultRoom1
        if vaultRoom1:FindFirstChild("Cooldown") then
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
end
Robber:FindRobbableBank()

return Robber