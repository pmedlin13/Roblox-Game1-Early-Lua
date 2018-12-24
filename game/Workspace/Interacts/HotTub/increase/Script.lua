dist = 1
local part = script.Parent

script.Parent.Touched:connect(function(hit)
    if hit.Parent:FindFirstChild("Humanoid") then
        local plr = workspace[hit.Parent.Name] --Access character from workspace.
        local player = game.Players:GetPlayerFromCharacter(plr) --Access (plr)
		local Torso = player.Character.Humanoid.RigType == "R6" and player.Character.Torso or player.Character.UpperTorso
		local playerpos = Torso.Position
		local ki = player.stats.Ki
		local kiR = player.training.KiRate.Value
		local incrKi = kiR * 10
		local damage = player.Character.Humanoid.MaxHealth * 0.05 

		while wait(2) do
		
			if ki.Value >= 150 then
				ki.Value = ki.Value + incrKi
				wait(2)
			elseif ki.Value >= 100 and ki.Value < 150 then
				ki.Value = ki.Value + incrKi 
				player.Character.Humanoid:TakeDamage(damage)
				wait(2) 
			elseif ki.Value < 100 then
				player.Character.Humanoid.Health = 0
		    end
		
		local mag = (Torso.Position - playerpos).magnitude
		
		if mag > dist then
			break 
		end
		
		end
	end
end)
    