local player = game.Players.LocalPlayer --gets player
local character = game.Players.LocalPlayer.CharacterAdded:Wait();
local humanoid = character:WaitForChild("Humanoid")--gets the humanoid
local hrp = character:WaitForChild("HumanoidRootPart");
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IncreaseSpeed = ReplicatedStorage.Events:WaitForChild("IncreaseSpeed")

while wait(2) do --put a number in the () if you want to slow down speed incerasing
	if humanoid.Health > 0 and hrp.Velocity.Magnitude > 1 then
		IncreaseSpeed:FireServer() 
   	end
end

