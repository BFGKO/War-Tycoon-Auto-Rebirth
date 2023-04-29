local Players = game:GetService("Players")
local VirtualUser = game:service("VirtualUser")
local player = Players.LocalPlayer

local AntiAfk = {}

function AntiAfk:Init()
	player.Idled:connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.zero)
 end)
end

return AntiAfk
