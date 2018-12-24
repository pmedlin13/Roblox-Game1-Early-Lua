local player = game.Players.LocalPlayer
local stats = player:WaitForChild("stats")
local VIP = stats:WaitForChild("VIP")

if VIP.Value == true then
	script.Parent.Visible = true
end

script.Parent.MouseButton1Click:connect(function()
local VIPGui = script.Parent.Parent.Parent.VIPCommands
	if VIP.Value == true then
		if VIPGui.Visible == false then
			VIPGui.Visible = true
		
		else 
			VIPGui.Visible = false
		end
	end
end)

VIP.Changed:connect(function()
	script.Parent.Visible = true
end)
