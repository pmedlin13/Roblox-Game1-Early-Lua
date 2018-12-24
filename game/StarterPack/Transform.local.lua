wait(30)
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TransformEvent = ReplicatedStorage.Events:WaitForChild("Transform")
local AngelEvent = ReplicatedStorage.Events:WaitForChild("Angel")
local UndeadEvent = ReplicatedStorage.Events:WaitForChild("Undead")
local OmegaEvent = ReplicatedStorage.Events:WaitForChild("Omega")
local LSSJGEvent = ReplicatedStorage.Events:WaitForChild("LSSJG")
local SSJ5Event = ReplicatedStorage.Events:WaitForChild("SSJ5")
local SSJB3Event = ReplicatedStorage.Events:WaitForChild("SSJB3")



player.Chatted:connect(function(MSG)
	MSG = MSG:lower()
	if player.stats.VIP.Value == true then
		
		if MSG == "angel" or MSG == "/e angel" then
			local Switch = true
    		AngelEvent:FireServer(Switch)
  
		elseif MSG == "angel off" or MSG == "/e angeloff" then
			local Switch = false
    		AngelEvent:FireServer(Switch)
    
		elseif MSG == "undead" or MSG == "/e undead" then
   			local Switch = true
    		UndeadEvent:FireServer(Switch)
  		
		elseif MSG == "undead off" or MSG == "/e undeadoff" then
    		local Switch = false
    		UndeadEvent:FireServer(Switch)
		
		elseif MSG == "ssj" or MSG == "/e ssj" then
   			local Switch = true
    		TransformEvent:FireServer(Switch)
  		
		elseif MSG == "ssj off" or MSG == "/e ssjoff" then
    		local Switch = false
    		TransformEvent:FireServer(Switch)
		
		elseif MSG == "lssjg" or MSG == "/e lssjg" then
   			local Switch = true
    		LSSJGEvent:FireServer(Switch)
  		
		elseif MSG == "lssjg off" or MSG == "/e lssjgoff" then
    		local Switch = false
    		LSSJGEvent:FireServer(Switch)
		
		elseif MSG == "ssj5" or MSG == "/e ssj5" then
   			local Switch = true
    		SSJ5Event:FireServer(Switch)
  		
		elseif MSG == "ssj5 off" or MSG == "/e ssj5off" then
    		local Switch = false
    		SSJ5Event:FireServer(Switch)
		
		elseif MSG == "omega" or MSG == "/e omega" then
   			local Switch = true
    		OmegaEvent:FireServer(Switch)
  		
		elseif MSG == "omega off" or MSG == "/e omegaoff" then
    		local Switch = false
    		OmegaEvent:FireServer(Switch)
		elseif MSG == "ssjb3" or MSG == "/e ssjb3" then
			local Switch = true
			SSJB3Event:FireServer(Switch)
		elseif MSG == "ssjb3 off" or MSG == "/e ssjb3" then
			local Switch = false
			SSJB3Event:FireServer(Switch)
  		end
	end
	if MSG == "ssj" or MSG == "/e ssj" then
   			local Switch = true
    		TransformEvent:FireServer(Switch)
		
	elseif MSG == "ssj off" or MSG == "/e ssjoff" then
    		local Switch = false
    		TransformEvent:FireServer(Switch)
	end
	
end)

