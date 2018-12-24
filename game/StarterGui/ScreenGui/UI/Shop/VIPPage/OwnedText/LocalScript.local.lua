local player = game.Players.LocalPlayer
local OwnText = script.Parent
local BuyB = script.Parent.Parent.BuyB
local stats = player:WaitForChild("stats")
local VIP = stats:WaitForChild("VIP")

if VIP.Value == true then
	OwnText.Visible = true
	BuyB.Visible = false
end