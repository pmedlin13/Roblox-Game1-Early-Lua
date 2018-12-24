local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:FindFirstChild("Events")
local Participate = Events:FindFirstChild("Participate")

Participate.OnServerEvent:Connect(function(player)
	local stats = player:WaitForChild("stats")
	local Participation = stats:WaitForChild("Participate")
	Participation.Value = true
end)

