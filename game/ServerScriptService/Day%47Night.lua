
local currentTime = 600

local NIGHT_START = 1140
local NIGHT_END = 360
local DAY_RESET_TIME = 1440

local waitTime = 0.2

while wait(waitTime) do
	
	game.Lighting.Ambient = Color3.new(111/255, 111/255, 111/255)
	game.Lighting.Brightness = 1.25
	game.Lighting.ColorShift_Bottom = Color3.new(0/255, 0/255, 0/255)
	game.Lighting.ColorShift_Top = Color3.new(0/255, 0/255, 0/255)
	game.Lighting.GlobalShadows = false
	game.Lighting.OutdoorAmbient = Color3.new(128/255, 128/255, 128/255)
	game.Lighting.Outlines = false
	game.Lighting.ShadowColor = Color3.new(179/255, 179/255, 184/255)
	game.Lighting.GeographicLatitude = 50
	game.Lighting.FogEnd = 100000
	game.Lighting.FogStart = 0	
	
	game.Lighting:SetMinutesAfterMidnight(currentTime)

	if currentTime >= DAY_RESET_TIME then
		currentTime = 0
	elseif currentTime <= NIGHT_END or currentTime >= NIGHT_START then
		currentTime = currentTime + 0.3		
	else
		currentTime = currentTime + 0.1
	end
end