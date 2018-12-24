local player = game.Players.LocalPlayer
local Tool = script.Parent
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IncreaseStrength = ReplicatedStorage.Events:WaitForChild("IncreaseStrength")
local enabled = true

Tool.Activated:connect(function()
	if not enabled then
		return
	end
	enabled = false
	wait(1)
	if player.Character.Humanoid.Health > 0 then 		
		IncreaseStrength:FireServer()
	end
	enabled = true
end)

