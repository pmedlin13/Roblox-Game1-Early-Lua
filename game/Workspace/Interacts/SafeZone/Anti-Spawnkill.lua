-- This script puts an ff in the player that only runs out once the player is dist away from his initial spawn location.
-- It also removes the tools of the player so that player can't ff kill.

local dist = 80 -- Amount of studs player can move from spawnpoint before ff gets removed.
local part = script.Parent

local enabled = true
--actual safe zone--
script.Parent.Touched:connect(function(hit)	
	if hit.Parent:FindFirstChild("Humanoid") then
		if not enabled then
			return
		end
		enabled = false
		local plr = workspace[hit.Parent.Name] --Access character from workspace.
    	local player = game.Players:GetPlayerFromCharacter(plr) --Access (plr)
		local Torso = player.Character.Humanoid.RigType == "R6" and player.Character.Torso or player.Character.UpperTorso
		if not player.Character:FindFirstChild("ForceField") then
			local ff = Instance.new("ForceField", player.Character)
		end
		while wait() do
			local mag = (Torso.Position - part.Position).magnitude
			if mag > dist then
				if player.Character:FindFirstChild("ForceField") then
					player.Character.ForceField:Destroy()
				end
				break 
			end
		wait(1)
		enabled = true
		end
	end
end)