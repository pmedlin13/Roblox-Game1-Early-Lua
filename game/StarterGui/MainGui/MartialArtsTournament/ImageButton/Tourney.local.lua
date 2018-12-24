local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
local player = Players.LocalPlayer
local TourneyPrompt = ReplicatedStorage:FindFirstChild("TourneyPrompt")
local MartialArtsFrame = script.Parent.Parent.Parent.MartialArtsTournament
local Events = ReplicatedStorage:FindFirstChild("Events")
local ParticipateEvent = Events:FindFirstChild("Participate")
 

 
local function TourneyStarting()
	MartialArtsFrame.Visible = true
	wait(15)
	MartialArtsFrame.Visible = false
end
 
TourneyPrompt.OnClientEvent:Connect(TourneyStarting)

script.Parent.Parent.Yes.MouseButton1Click:Connect(function()
	if player.Character.Humanoid.Health > 0 then
		MartialArtsFrame.Visible = false
		ParticipateEvent:FireServer()
	end
end)

script.Parent.Parent.No.MouseButton1Click:Connect(function()
	MartialArtsFrame.Visible = false
end)

script.Parent.Parent.ImageButton.MouseButton1Click:Connect(function()
	MartialArtsFrame.Visible = false
end)