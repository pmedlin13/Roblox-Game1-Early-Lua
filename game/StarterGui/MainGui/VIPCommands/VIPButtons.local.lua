local player = game.Players.LocalPlayer
local stats = player:WaitForChild("stats")
local VIP = stats:WaitForChild("VIP")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AngelEvent = ReplicatedStorage.Events:WaitForChild("Angel")
local UndeadEvent = ReplicatedStorage.Events:WaitForChild("Undead")
local OmegaEvent = ReplicatedStorage.Events:WaitForChild("Omega")
local LSSJGEvent = ReplicatedStorage.Events:WaitForChild("LSSJG")
local SSJ5Event = ReplicatedStorage.Events:WaitForChild("SSJ5")

script.Parent.AngelOn.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = true
   		AngelEvent:FireServer(Switch)
	end
end)

script.Parent.AngelOff.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = false
   		AngelEvent:FireServer(Switch)
	end
end)

script.Parent.UndeadOn.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = true
   		UndeadEvent:FireServer(Switch)
	end
end)

script.Parent.UndeadOff.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = false
   		UndeadEvent:FireServer(Switch)
	end
end)

script.Parent.OmegaOn.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = true
   		OmegaEvent:FireServer(Switch)
	end
end)

script.Parent.OmegaOff.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = false
   		OmegaEvent:FireServer(Switch)
	end
end)

script.Parent.LSSJGOn.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = true
   		LSSJGEvent:FireServer(Switch)
	end
end)

script.Parent.LSSJGOff.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = false
   		LSSJGEvent:FireServer(Switch)
	end
end)

script.Parent.SSJ5On.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = true
   		SSJ5Event:FireServer(Switch)
	end
end)

script.Parent.SSJ5Off.MouseButton1Click:Connect(function()
	if VIP.Value == true then
		local Switch = false
   		SSJ5Event:FireServer(Switch)
	end
end)
