local DataStore = game:GetService("DataStoreService"):GetDataStore("SuperSimulator9000")
local ods = game:GetService("DataStoreService"):GetOrderedDataStore("PowerLevel")
local odsR = game:GetService("DataStoreService"):GetOrderedDataStore("Rebirth")
local Players = game:GetService("Players")
game:GetService('StarterGui').ResetPlayerGuiOnSpawn = false
local VIPPlayers = {}
local CurrPlayers = {}
local respawnDelay = 5
local firstSpawn = 10
local Events = game.ReplicatedStorage.Events
local rem = game.ReplicatedStorage.Remotes
local MPS = game:GetService("MarketplaceService")
game.Players.CharacterAutoLoads = false
local gamePassID = 5347441

local ShopM = require(game.ReplicatedStorage.Shop)
local Collections = require(game.ReplicatedStorage.Collections)

local respawnDelay = 3

local function getIndex(tab, item)
	for i, v in pairs(tab) do
		if v == item then
			return i
		end
	end
	return -1
end

game.Players.PlayerAdded:connect(function(plr)
--folders--
	local leaderstats = Instance.new("IntValue")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = plr
	
	local stats = Instance.new("IntValue")
	stats.Name = "stats"
	stats.Parent = plr
	
	local training = Instance.new("IntValue")
	training.Name = "training"
	training.Parent = plr
	
	--leaderstats children--
	local PowerLevel = Instance.new("IntValue") --Change points to whatever you want, unless you want to keep it
	PowerLevel.Name = "PowerLevel" --Name of the Points, or whatever name you changed it to
	PowerLevel.Parent = leaderstats
	
	local Rebirth = Instance.new("IntValue") --Change points to whatever you want, unless you want to keep it
	Rebirth.Name = "Rebirth" --Name of the Points, or whatever name you changed it to
	Rebirth.Parent = leaderstats
	
	local Rank = Instance.new("StringValue") --Change wins to whatever you want, unless you want to keep it
	Rank.Name = "Rank" --Name of the Wins, or whatever name you changed it to
	Rank.Parent = leaderstats
	
	--stats children--
	local Speed = Instance.new("IntValue")
	Speed.Name = "Speed"
	Speed.Parent = stats
	
	local Strength = Instance.new("IntValue")
	Strength.Name = "Strength"
	Strength.Parent = stats
	
	local Ki = Instance.new("IntValue")
	Ki.Name = "Ki"
	Ki.Parent = stats
	
	local Zeni = Instance.new("IntValue")
	Zeni.Name = "Zeni"
	Zeni.Parent = stats
	
	--training children--
	local StrengthRate = Instance.new("IntValue")
	StrengthRate.Name = "StrengthRate"
	StrengthRate.Parent = training
	
	local KiRate = Instance.new("IntValue")
	KiRate.Name = "KiRate"
	KiRate.Parent = training
	
	local SpeedRate = Instance.new("IntValue")
	SpeedRate.Name = "SpeedRate"
	SpeedRate.Parent = training
	
	local VIP = Instance.new("BoolValue")
	VIP.Name = "VIP"
	VIP.Parent = stats
	
	local Participate = Instance.new("BoolValue")
	Participate.Name = "Participate"
	Participate.Parent = stats
	
	local Victories = Instance.new("IntValue")
	Victories.Name = "Victories"
	Victories.Parent = leaderstats
	
	local key = "user-" .. plr.userId
	
	local storeditems = DataStore:GetAsync(key)
	if storeditems then
		PowerLevel.Value = storeditems[1] --Value of the Points, change "points" if you changed line 10
		Rebirth.Value = storeditems[2]
		Rank.Value = storeditems[3] --Value of the Wins, change "wins" if you changed line 14
		Speed.Value = storeditems[4]
		Strength.Value = storeditems[5]
		Ki.Value = storeditems[6]
		Zeni.Value = storeditems[7]
		StrengthRate.Value = storeditems[8]
		KiRate.Value = storeditems[9]
		SpeedRate.Value = storeditems[10]
		VIP.Value = storeditems[11]
		Victories.Value = storeditems[12]
	else
		local items = {PowerLevel.Value, Rebirth.Value, Rank.Value, Speed.Value, Strength.Value, Ki.Value, Zeni.Value, StrengthRate.Value, KiRate.Value, SpeedRate.Value, VIP.Value, Victories.Value} --Change Points or Wins if you changed line 10 or 14
		DataStore:SetAsync(key, items)
	end
	

	plr.CharacterAdded:Connect(function(character)
		local items = {plr.leaderstats.PowerLevel.Value, plr.leaderstats.Rebirth.Value, plr.leaderstats.Rank.Value, plr.stats.Speed.Value, plr.stats.Strength.Value, plr.stats.Ki.Value, plr.stats.Zeni.Value,plr.training.StrengthRate.Value, plr.training.KiRate.Value, plr.training.SpeedRate.Value, plr.stats.VIP.Value, plr.leaderstats.Victories.Value} --Change Points or Wins if you changed line 10 or 14
		local key = "user-" .. plr.userId
		local humanoid = character:FindFirstChild("Humanoid")
		if humanoid then
			humanoid.Died:connect(function()
				DataStore:SetAsync(key, items)
				ods:SetAsync(plr.Name, PowerLevel.Value)
				odsR:SetAsync(plr.Name, Rebirth.Value)
				wait(respawnDelay)
                plr:LoadCharacter()
				if getIndex(CurrPlayers, plr) ~= 1 then
					table.remove(CurrPlayers, getIndex(CurrPlayers, plr))
				end
			
			
			local dilutedHealth = plr.leaderstats.PowerLevel.Value / 500
			humanoid.MaxHealth = humanoid.MaxHealth + dilutedHealth
			humanoid.Health = humanoid.MaxHealth
			
			if plr.stats.Speed.Value == 0 then
				plr.stats.Speed.Value = 1
			end
			local dilutedSpeed = plr.stats.Speed.Value / 10000
			humanoid.WalkSpeed = humanoid.WalkSpeed + dilutedSpeed
			if plr.stats.Participate.Value == true then
				plr.stats.Participate.Value = false
			end 
				
			end)
		end
			
		if plr.stats.VIP.Value == true or plr.Name == "Player" or plr.Name == "rainbowlocks13" or plr.Name == "selvius13" or plr.Name == "pmedlin13" or plr.Name == "maddisonloves1" or plr.Name == "liljoyc8" then 
			game.ServerStorage.VIP:Clone().Parent = plr
			game.ServerStorage.VIPItems.EvilKnightSword:Clone().Parent = plr.Backpack
			game.ServerStorage.VIPItems.RainbowSword:Clone().Parent = plr.Backpack
			plr.stats.VIP.Value = true
		end
		
		if plr.leaderstats.PowerLevel.Value == 0 then
			plr.leaderstats.PowerLevel.Value = 1
		end
			
		if plr.stats.Speed.Value == 0 then
			plr.leaderstats.Speed.Value = 1
		end
		
	end)
	wait(firstSpawn)
    plr:LoadCharacter()
end)

local function getIndex(tab, item)
	for i, v in pairs(tab) do
		if v == item then
			return i
		end
	end
	return -1
end

-- works for multiples now {name, n}

-- called when a Accessories is requested to be equipped; the local script checks if player owns the asset

MPS.ProcessReceipt = function(receiptInfo)
	
	local player = game:GetService("Players"):GetPlayerByUserId(receiptInfo.PlayerId)
	if not player then return Enum.ProductPurchaseDecision.NotProcessedYet end
	
	-- Zeni
	--100
	if receiptInfo.ProductId == 416334370 then
		player.stats.Zeni.Value = player.stats.Zeni.Value + 200
		
	
	--250
	elseif receiptInfo.ProductId == 416335093 then
		player.stats.Zeni.Value = player.stats.Zeni.Value + 425
	
	--750
	elseif receiptInfo.ProductId == 416335333 then
		player.stats.Zeni.Value = player.stats.Zeni.Value + 950
	
	--1250
	elseif receiptInfo.ProductId == 416335629 then
		player.stats.Zeni.Value = player.stats.Zeni.Value + 2000
	
	--3500
	elseif receiptInfo.ProductId == 416336090 then
		player.stats.Zeni.Value = player.stats.Zeni.Value + 2500
		
	--10000
	elseif receiptInfo.ProductId == 416336607 then
		player.stats.Zeni.Value = player.stats.Zeni.Value + 30000
		
	end
	rem.UpdZeniDisplay:FireClient(player, player.stats.Zeni.Value)
	return Enum.ProductPurchaseDecision.PurchaseGranted		
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:FindFirstChild("Events")

local IncreaseStrength = Events:FindFirstChild("IncreaseStrength")
local IncreaseSpeed = Events:FindFirstChild("IncreaseSpeed")
local IncreaseKi = Events:FindFirstChild("IncreaseKi")
local IncreaseRebirth = Events:FindFirstChild("IncreaseRebirth")

local IncreaseStrengthRate = Events:FindFirstChild("StrengthRate")
local IncreaseKiRate = Events:FindFirstChild("KiRate")
local IncreaseSpeedRate = Events:FindFirstChild("SpeedRate")

--Increase Stats--
IncreaseStrength.OnServerEvent:Connect(function(player)
	local stats = player:WaitForChild("stats")
	local Strength = stats:WaitForChild("Strength")
	local training = player:WaitForChild("training")
	local StrengthRate = training:WaitForChild("StrengthRate")
	
	if StrengthRate.Value == 0 then
		StrengthRate.Value = 1
	end
	
	local StrengthGain = StrengthRate.Value * 1
	Strength.Value = Strength.Value + StrengthGain
	updatePowerLevel(player)
	wait(1)
end)

IncreaseSpeed.OnServerEvent:Connect(function(player)
	local character = player.Character
	local humanoid = character:WaitForChild("Humanoid")
	local stats = player:WaitForChild("stats")
	local Speed = stats:WaitForChild("Speed")
	local training = player:WaitForChild("training")
	local SpeedRate = training:WaitForChild("SpeedRate")
	
	if SpeedRate.Value == 0 then
		SpeedRate.Value = 1
	end
	
	local SpeedGain = SpeedRate.Value * 1
	Speed.Value = Speed.Value + SpeedGain
	
	local dilutedSpeed = Speed.Value / 10000
	humanoid.WalkSpeed = humanoid.WalkSpeed + dilutedSpeed
	updatePowerLevel(player)
	wait(1)

end)

IncreaseKi.OnServerEvent:Connect(function(player, kiamount)
	local stats = player:WaitForChild("stats")
	local Ki = stats:WaitForChild("Ki")
	local training = player:WaitForChild("training")
	local KiRate = training:WaitForChild("KiRate")
	
	if KiRate.Value == 0 then
		KiRate.Value = 1
	end
	
	if kiamount == nil then
		kiamount = 1
	end
	
	local KiGain = KiRate.Value * kiamount
	Ki.Value = Ki.Value + KiGain
	wait(1)
end)

--Training Rates--
IncreaseSpeedRate.OnServerEvent:Connect(function(player)
	local training = player:WaitForChild("training")
	local SpeedRate = training:WaitForChild("SpeedRate")
	local stats = player:WaitForChild("stats")
	local Zeni = stats:WaitForChild("Zeni")
	if SpeedRate.Value == 0 then
		SpeedRate.Value = 1
	end
	if Zeni.Value >= (SpeedRate.Value * 100) then
		Zeni.Value = Zeni.Value - (SpeedRate.Value * 100)	
		SpeedRate.Value = SpeedRate.Value * 2
	end 
	wait(1)
end)

IncreaseKiRate.OnServerEvent:Connect(function(player)
	local stats = player:WaitForChild("stats")
	local Zeni = stats:WaitForChild("Zeni")
	local training = player:WaitForChild("training")
	local KiRate = training:WaitForChild("KiRate")
	if KiRate.Value == 0 then
		KiRate.Value = 1
	end
	if Zeni.Value >= (KiRate.Value * 100) then
		Zeni.Value = Zeni.Value - (KiRate.Value * 100)
		KiRate.Value = KiRate.Value * 2
	end
	wait(1) 
end)


IncreaseStrengthRate.OnServerEvent:Connect(function(player)
	local stats = player:WaitForChild("stats")
	local Zeni = stats:WaitForChild("Zeni")
	local training = player:WaitForChild("training")
	local StrengthRate = training:WaitForChild("StrengthRate")
	if StrengthRate.Value == 0 then
		StrengthRate.Value = 1
	end
	
	if Zeni.Value >= (StrengthRate.Value * 100) then
		Zeni.Value = Zeni.Value - (StrengthRate.Value * 100)
		StrengthRate.Value = StrengthRate.Value * 2
	end 
	wait(1)
end)

function updatePowerLevel(player)
	local leaderstats = player:WaitForChild("leaderstats")
    local PowerLevel = leaderstats:WaitForChild("PowerLevel")
	local Rank = leaderstats:WaitForChild("Rank")
	local character = player.Character
	local humanoid = character:WaitForChild("Humanoid")
	local stats = player:WaitForChild("stats")
	local Speed = stats:WaitForChild("Speed")
	local Strength = stats:WaitForChild("Strength")

	PowerLevel.Value = (Strength.Value + Speed.Value)
	local dilutedHealth = PowerLevel.Value / 500
	humanoid.MaxHealth = humanoid.MaxHealth + dilutedHealth
	
	if PowerLevel.Value <= 100 then
		Rank.Value = "Farmer"
	
	
	elseif PowerLevel.Value > 100 and PowerLevel.Value < 9000 then
		Rank.Value = "Red Ribbon Grunt"
	
	elseif PowerLevel.Value >= 9000 and PowerLevel.Value < 100000 then
		Rank.Value = "Over 9000!!"
	
	elseif PowerLevel.Value >= 100000 and PowerLevel.Value < 1000000 then
		Rank.Value = "Super Namek"
	
	elseif PowerLevel.Value >= 1000000 and PowerLevel.Value < 10000000 then 
		Rank.Value = "Super Saiyan!"
	
	elseif PowerLevel.Value >= 10000000 and PowerLevel.Value < 100000000 then
		Rank.Value = "Legendary Super Saiyan"
	
	elseif PowerLevel.Value >= 100000000 then
		Rank.Value = "Legendary Super Saiyan God!"
	end

	
end

IncreaseRebirth.OnServerEvent:Connect(function(player)
	local character = player.Character
	local humanoid = character:WaitForChild("Humanoid")
	local leaderstats = player:WaitForChild("leaderstats")
	local PowerLevel = leaderstats:WaitForChild("PowerLevel")
	local stats = player:WaitForChild("stats")
	local Speed = stats:WaitForChild("Speed")
	local Strength = stats:WaitForChild("Strength")
	local Ki = stats:WaitForChild("Ki")
	local Rebirth = leaderstats:WaitForChild("Rebirth")
	local Zeni = stats:WaitForChild("Zeni")
	
	if PowerLevel.Value > 100000 then
		Rebirth.Value = Rebirth.Value + 1
		Strength.Value = 1
		Speed.Value = 1
		Ki.Value = 1
		Zeni.Value = Zeni.Value + 1000
		if stats.VIP.Value == true then
			Zeni.Value = Zeni.Value + 500
		end
		humanoid.Health = 0
		wait(5)
	end
end)

game.Players.PlayerRemoving:connect(function(player)
	local items = {player.leaderstats.PowerLevel.Value, player.leaderstats.Rebirth.Value, player.leaderstats.Rank.Value, player.stats.Speed.Value, player.stats.Strength.Value, player.stats.Ki.Value, player.stats.Zeni.Value, player.training.StrengthRate.Value, player.training.KiRate.Value, player.training.SpeedRate.Value, player.stats.VIP.Value, player.leaderstats.Victories.Value, player.stats.Participate.Value} --Change Points or Wins if you changed line 10 or 14
	local key = "user-" .. player.userId
	for i, plr in pairs(CurrPlayers) do
		if plr == player then
			table.remove(CurrPlayers, i)
			end 
	end
	
	ods:SetAsync(player.Name, player.leaderstats.PowerLevel.Value)
	odsR:SetAsync(player.Name, player.leaderstats.Rebirth.Value)
	DataStore:SetAsync(key, items)
end)

local Spawns = game.Workspace.tournament.TourneySpawns:GetChildren()
local TourneyPrompt = game.ReplicatedStorage:FindFirstChild("TourneyPrompt")

local CountdownEvent = game.ReplicatedStorage.Events:FindFirstChild("Countdown")
local StartedEvent = game.ReplicatedStorage.Events:FindFirstChild("Started")
local EndedEvent = game.ReplicatedStorage.Events:FindFirstChild("Ended")
local VictoryEvent = game.ReplicatedStorage.Events:FindFirstChild("VictoryEvent")


mTime = 3 -- ammount of time for messages to appear
winner = nil
intermission = true -- if you don't want an intermission then set to false
interTime = 60 -- the intermission length if you have one
---------------------------------------------------------------------
while wait(5) do
	while game.Players.NumPlayers < 2 do 
		wait(5)
		EndedEvent:FireAllClients()
	end
	
	if intermission then
		CountdownEvent:FireAllClients()
		for i = interTime,1,-1 do
			wait(1)
		end
	end
	
	wait(mTime)
	
	TourneyPrompt:FireAllClients()		
	
	wait(15)
	
	local plr = game.Players:GetPlayers()
	for i, plr in pairs(game.Players:GetPlayers()) do
		if plr and plr.Character and plr.stats.Participate.Value == true then
			table.insert(CurrPlayers, plr)
		end
	end
		
	wait(mTime)
	wait(mTime)
	StartedEvent:FireAllClients()
	--Lines 47 to 112 only occur with two or more player participating--
	if #CurrPlayers > 1 then
		for i, plr in pairs(CurrPlayers) do
			if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				plr.Character.HumanoidRootPart.CFrame = CFrame.new(Spawns[i].CFrame.p) * CFrame.new(0,5,0)
			end
		
		end
	
		repeat 
		wait(2)
		local player = game.Players:GetPlayers()
		for i, plr in pairs(CurrPlayers) do
			if plr and plr:FindFirstChild("stats") then
				if plr.stats.Participate.Value ~= true then
					table.remove(CurrPlayers, i)
         		end	
			end 	
		end
			--remove players that disconnect

		print(#CurrPlayers)	
		until(#CurrPlayers <= 1)
	
		local winner = CurrPlayers[1]
		if winner then
			if winner:findFirstChild("leaderstats") then
				if winner.leaderstats:findFirstChild("Victories") then
					winner.leaderstats.Victories.Value = winner.leaderstats.Victories.Value + 1
					winner.stats.Zeni.Value = winner.stats.Zeni.Value + 500
					if winner.stats.VIP.Value == true then
						winner.stats.Zeni.Value = winner.stats.Zeni.Value + 500
					end
					winner.stats.Participate.Value = false
					local winnerName = winner.Name
					VictoryEvent:FireAllClients(winnerName)
					wait(2)		
					winner.Character.Humanoid.Health = 0
				end
			end
		end
	end
	--fix a bug that happens where only one player accepts--
	if CurrPlayers ~= nil then
		for i, plr in pairs(CurrPlayers) do
			if plr and plr:FindFirstChild("stats") then
				if plr.stats.Participate.Value == true then
					plr.stats.Participate.Value = false
         		end	
			end 	
		end
	end

	winner = nil
	CurrPlayers = {}
	EndedEvent:FireAllClients()
end

--actual loop--
