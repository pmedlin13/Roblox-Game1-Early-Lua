local menu = script.Parent:WaitForChild("Menu")
local statsFrame = script.Parent:WaitForChild("Stats")

local PowerLevelLabel = statsFrame:WaitForChild("PowerLevel")
local StrengthLabel = statsFrame:WaitForChild("Strength")
local KiLabel = statsFrame:WaitForChild("Ki")
local SpeedLabel = statsFrame:WaitForChild("Speed")
local RankLabel = statsFrame:WaitForChild("RankVar")

local StrengthRateButton = statsFrame:WaitForChild("StrengthRateButton")
local KiRateButton = statsFrame:WaitForChild("KiRateButton")
local SpeedRateButton = statsFrame:WaitForChild("SpeedRateButton")

local ZeniLabel = statsFrame:WaitForChild("Zeni")

local KiRateLabel = statsFrame:WaitForChild("KiRate")
local SpeedRateLabel = statsFrame:WaitForChild("SpeedRate")
local StrengthRateLabel = statsFrame:WaitForChild("StrengthRate")

local KiCostLabel = statsFrame:WaitForChild("KiCost")
local SpeedCostLabel = statsFrame:WaitForChild("SpeedCost")
local StrengthCostLabel = statsFrame:WaitForChild("StrengthCost")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = game:GetService("ReplicatedStorage"):WaitForChild("Events")

local StrengthRateEvent = events:WaitForChild("StrengthRate")
local SpeedRateEvent = events:WaitForChild("SpeedRate")
local KiRateEvent = events:WaitForChild("KiRate")


local player = game.Players.LocalPlayer
repeat
  wait()
until player.Character
local character = player.Character
local humanoid = character:WaitForChild("Humanoid")
local stats = player:WaitForChild("stats")
local leaderstats = player:WaitForChild("leaderstats")
local PowerLevel = leaderstats:WaitForChild("PowerLevel")
local Speed = stats:WaitForChild("Speed")
local Strength = stats:WaitForChild("Strength")
local Ki = stats:WaitForChild("Ki")
local Zeni = stats:WaitForChild("Zeni")
local trainer = player:WaitForChild("training")
local KiRate = trainer:WaitForChild("KiRate")
local StrengthRate = trainer:WaitForChild("StrengthRate")
local SpeedRate = trainer:WaitForChild("SpeedRate")

local Rank = leaderstats:WaitForChild("Rank")


local ZeniCostStrength = StrengthRate.Value * 100
local ZeniCostSpeed = SpeedRate.Value * 100
local ZeniCostKi = KiRate.Value * 100


function updateStatsToGUI()
	local ZeniCostStrength = StrengthRate.Value * 100
	local ZeniCostSpeed = SpeedRate.Value * 100
	local ZeniCostKi = KiRate.Value * 100
    
	PowerLevelLabel.Text = ("Power Level: " ..PowerLevel.Value.. "")
    StrengthLabel.Text = ("Strength: " ..Strength.Value.. "")
	KiLabel.Text = ("Ki: " ..Ki.Value.. "")
	SpeedLabel.Text = ("Speed: " ..Speed.Value.. "")

	KiRateLabel.Text = ("x" ..KiRate.Value.. "")
	StrengthRateLabel.Text = ("x" ..StrengthRate.Value.. "")
	SpeedRateLabel.Text = ("x" ..SpeedRate.Value.. "")
	
	KiCostLabel.Text = ("" ..ZeniCostKi.. " Zeni")
	StrengthCostLabel.Text = ("" ..ZeniCostStrength.. " Zeni")
	SpeedCostLabel.Text = ("" ..ZeniCostSpeed.. " Zeni")
	
	ZeniLabel.Text = ("Zeni: " ..Zeni.Value.. "")
	
	--change reputation and rank text color depending on stats--
	if Rank.Value ~= "Farmer" and Rank.Value ~= "Turtle Hermit Master!" then
	   RankLabel.TextColor3 = Color3.new(0,0,255)
	end
	
	if Rank.Value == "Turtle Hermit Master!" then
		RankLabel.TextColor3 = Color3.new(255,0,0)
	end

	RankLabel.Text = ("" ..Rank.Value.. "")
	
	
end

local Statup = script.Parent.Statup

function StatUpToGUI(StatToUp) 
	local Statup = script.Parent.Statup
	local ImageLabel1 = Statup.ImageLabel1
	local ImageLabel2 = Statup.ImageLabel2
	local ImageLabel3 = Statup.ImageLabel3
	local ImageLabel4 = Statup.ImageLabel4
	
	local TextLabel1 = Statup.TextLabel1
	local TextLabel2 = Statup.TextLabel2
	local TextLabel3 = Statup.TextLabel3
	local TextLabel4 = Statup.TextLabel4
	
	local KiGain = KiRate.Value * 1
	local StrengthGain = StrengthRate.Value * 1
	local SpeedGain = SpeedRate.Value * 1
	
	
	if StatToUp == "Strength" then
		ImageLabel1.Image = "rbxassetid://1545265044"
		ImageLabel1.Visible = true
		TextLabel1.Text = "+" ..StrengthGain.. ""
		TextLabel1.Visible = true
		wait(1)
		ImageLabel1.Visible = false
		TextLabel1.Visible = false
	end
	if StatToUp == "Speed" then
		ImageLabel3.Image = "rbxassetid://979714118"
		TextLabel3.Text = "+" ..SpeedGain.. ""
		ImageLabel3.Visible = true
		TextLabel3.Visible = true
		wait(1)
		ImageLabel3.Visible = false
		TextLabel3.Visible = false
	end
	if StatToUp == "Ki" then
		TextLabel2.Text = "+" ..KiGain.. ""
		ImageLabel2.Image = "rbxassetid://259835200"
		ImageLabel2.Visible = true
		TextLabel2.Visible = true
		wait(1)
		ImageLabel2.Visible = false
		TextLabel2.Visible = false
	end
	if StatToUp == "Zeni" then
		ImageLabel4.Visible = true
		TextLabel4.Visible = true
		wait(1)
		ImageLabel4.Visible = false
		TextLabel4.Visible = false
	end
end

function passStrength()
	local StatToUp = "Strength" 
	StatUpToGUI(StatToUp)	
end

function passSpeed()
	local StatToUp = "Speed"
	StatUpToGUI(StatToUp)
end

function passKi()
	local StatToUp = "Ki"
	StatUpToGUI(StatToUp)
end

function passZeni()
	local StatToUp = "Zeni"
	StatUpToGUI(StatToUp)
end

if humanoid.Health > 0 then
	Strength.Changed:connect(updateStatsToGUI) 
	Strength.Changed:connect(passStrength)
	
	Ki.Changed:connect(updateStatsToGUI)
	Ki.Changed:connect(passKi)
	
	Speed.Changed:connect(updateStatsToGUI)
	Speed.Changed:connect(passSpeed)
	
	PowerLevel.Changed:connect(updateStatsToGUI)
	Zeni.Changed:connect(updateStatsToGUI)
	Zeni.Changed:connect(passZeni)
	
	KiRate.Changed:connect(updateStatsToGUI)
	StrengthRate.Changed:connect(updateStatsToGUI)
	SpeedRate.Changed:connect(updateStatsToGUI)
	
	Rank.Changed:connect(updateStatsToGUI)
	
end

StrengthRateButton.MouseButton1Click:connect(function()
	if Zeni.Value >= ZeniCostStrength then
		StrengthRateEvent:FireServer()
	end
end)

SpeedRateButton.MouseButton1Click:connect(function()
	if Zeni.Value >= ZeniCostSpeed then
		SpeedRateEvent:FireServer()
	end
end)


KiRateButton.MouseButton1Click:connect(function()
	if Zeni.Value >= ZeniCostKi then
		KiRateEvent:FireServer()
	end
end)