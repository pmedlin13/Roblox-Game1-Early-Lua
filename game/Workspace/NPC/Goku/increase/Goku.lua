script.Parent.Touched:connect(function(hit)
    if hit.Parent:FindFirstChild("Humanoid") then
        local plr = workspace[hit.Parent.Name] --Access character from workspace.
        local player = game.Players:GetPlayerFromCharacter(plr) --Access (plr)
		local strength = player.stats.Strength
		local strengthR = player.training.StrengthRate.Value
		local incrStrenth = strengthR * 10000
		
      	if strength.Value > 15000000 then
			strength.Value = strength.Value + incrStrenth
			wait(2)
		elseif strength.Value < 15000000 and strength.Value >= 10000000 then
			strength.Value = strength.Value + incrStrenth 
			player.Character.Humanoid.Health = player.Character.Humanoid.Health - (player.Character.Humanoid.MaxHealth * 0.20)
			strength.Value = strength.Value + incrStrenth
			wait(2)
		elseif strength.Value < 10000000 then
			player.Character.Humanoid.Health = 0
    	end
	end
end)
    