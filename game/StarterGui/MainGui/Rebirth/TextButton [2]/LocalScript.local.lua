script.Parent.MouseButton1Click:connect(function()
local RebirthGui = script.Parent.Parent.Parent.Rebirth
local player = game.Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local PowerLevel = leaderstats:WaitForChild("PowerLevel")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IncreaseRebirth = ReplicatedStorage.Events:WaitForChild("IncreaseRebirth")

if PowerLevel.Value > 1000000 then
	IncreaseRebirth:FireServer()
	PowerLevel.Value = 1
end
RebirthGui.Visible = false
end)