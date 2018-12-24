local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:FindFirstChild("Events")
local EnableAura = Events:FindFirstChild("EnableAura")
local DisableAura = Events:FindFirstChild("DisableAura")

EnableAura.OnServerEvent:Connect(function(player)
	local stats = player:WaitForChild("stats")
	local leaderstats = player:WaitForChild("leaderstats") --gets leaderstats
	local PowerLevel = leaderstats:WaitForChild("PowerLevel") --gets the speed
	local torso = player.Character.Humanoid.RigType == "R6" and player.Character.Torso or player.Character.UpperTorso
	--destroy old aura if there--
	for i,v in pairs(torso:GetChildren())do
		if v:IsA("ParticleEmitter") then
			v:Destroy()
	end
	

	--give aura based on PowerLevel--
	if PowerLevel.Value > 0 and PowerLevel.Value < 1000 then
		local aura = game.ServerStorage.auras.basicaura6:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
	
	if PowerLevel.Value >= 1000 and PowerLevel.Value < 10000 then
		local aura = game.ServerStorage.auras.basicaura7:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
	if PowerLevel.Value >= 10000 and PowerLevel.Value < 100000 then
		local aura = game.ServerStorage.auras.basicaura8:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
	if PowerLevel.Value >= 100000 and PowerLevel.Value < 1000000 then
		local aura = game.ServerStorage.auras.blueandwhiteaura:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
	if PowerLevel.Value >= 1000000 and PowerLevel.Value < 10000000 then
		local aura = game.ServerStorage.auras.redandpinkaura:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
	if PowerLevel.Value >= 10000000 and PowerLevel.Value < 100000000 then
		local aura = game.ServerStorage.auras.pinkaura:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
		if PowerLevel.Value >= 100000000 and PowerLevel.Value < 1000000000 then
		local aura = game.ServerStorage.auras.flameaura:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
	if PowerLevel.Value >= 10000000 then
		local aura = game.ServerStorage.auras.godaura:Clone()
		aura.Parent = workspace
		for i,v in pairs(aura:GetChildren())do
			if v:IsA("ParticleEmitter") then
				v.Parent = torso
				end
			end
	end
	end
end)


DisableAura.OnServerEvent:Connect(function(player)
	local torso = player.Character.Humanoid.RigType == "R6" and player.Character.Torso or player.Character.UpperTorso
	for i,v in pairs(torso:GetChildren())do
		if v:IsA("ParticleEmitter") then
			v:Destroy()
		end
	end
end)
