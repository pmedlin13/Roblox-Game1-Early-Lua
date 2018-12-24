local player = game.Players.LocalPlayer
local Tool = script.Parent
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IncreaseStrength = ReplicatedStorage.Events:WaitForChild("IncreaseStrength")
local debounce = false
local Cooldown = 1

Tool.Activated:Connect(function()
	if not debounce and player.Character.Humanoid.Health > 0 then
		debounce = true
		wait(Cooldown)
		IncreaseStrength:FireServer()
		debounce = false
	end
	wait(1)
end)