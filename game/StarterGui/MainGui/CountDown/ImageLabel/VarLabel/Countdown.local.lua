local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
local player = Players.LocalPlayer
local TourneyMessages = script.Parent.Parent.VarLabel

local CountdownEvent = game.ReplicatedStorage.Events:FindFirstChild("Countdown")
local EndedEvent = game.ReplicatedStorage.Events:FindFirstChild("Ended")
local StartedEvent = game.ReplicatedStorage.Events:FindFirstChild("Started")

interTime = 60

 
local function End()
	TourneyMessages.Text = "Two or more required!"
end

local function Count()
	for i = interTime,1,-1 do
		TourneyMessages.Text = "Intermission: "..i
		wait(1)
	end 
	TourneyMessages.Text = "Tournament about to begin!"
end

local function Start()
	TourneyMessages.Text = "Tournament is under way!"
end

CountdownEvent.OnClientEvent:Connect(Count)
StartedEvent.OnClientEvent:Connect(Start)
EndedEvent.OnClientEvent:Connect(End)