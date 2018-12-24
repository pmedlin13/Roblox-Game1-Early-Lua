-- Written by FullMetalEdward45221
local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local tool = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IncreaseKi = ReplicatedStorage.Events:WaitForChild("IncreaseKi")
local player = game.Players.LocalPlayer
local stats = player:WaitForChild("stats")
local Ki = stats:WaitForChild("Ki")
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local mouse = player:GetMouse()


 	--// Default [0.2]
local enabled = true

tool.Activated:connect(function()
	if not enabled then
		return
	end
	
	enabled = false
	
	wait(1)
	if player.Character.Humanoid.Health > 0 then 
		local point = mouse.Hit.p
		remotes.FireBlast:InvokeServer(point)
		IncreaseKi:FireServer()
	end
	enabled = true
end)

--local point = mouse.Hit.p
--Tool.FireBlast:FireServer(point)