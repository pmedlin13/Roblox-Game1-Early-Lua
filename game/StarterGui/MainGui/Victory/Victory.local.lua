local player = game.Players.LocalPlayer
local VictoryEvent = game.ReplicatedStorage.Events:FindFirstChild("VictoryEvent")
local Victor = script.Parent.Victor
local VictorText = script.Parent.VictorText
local VictoryFrame = script.Parent.Parent.Victory

VictoryEvent.OnClientEvent:Connect(function(winnerName)
	Victor.Image = "http://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&Format=Png&username="..winnerName
	VictorText.Text = ""..winnerName..""
	VictoryFrame.Visible = true
	if player.Name == winnerName then
		local fanfare = script.Parent.VictorySound
		fanfare.Playing = true
	end
	wait(5)
	VictoryFrame.Visible = false
end)



script.Parent.ImageButton.MouseButton1Click:Connect(function()
	VictoryFrame.Visible = false
end)